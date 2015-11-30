#!/usr/bin/perl -w

use lib "/exp/rcf/common";
use Getopt::Long;
use CSCF::Utilities;
use CSCF::IDFILES::Utilities;
use File::Copy;

$columns = 3;

sub print_help {
    my $f = $0;
    $f =~ s/./ /g;
    print << "EOT";

Usage: $0 [ -h|--help ]
       $f [ (-c|--columns) <number> ]
       $f [ (-s|--source) <dirname> ]
       $f [ (-t|--target) <filename> ]

--help     Display this help message
--columns  The number of columns produced.
           3 by default
--source   The name of the directory where the "250x250" subdir is.
           "." by default
--target   The name of the target html file.
           <source>/list.html by default.
EOT

}

sub get_names () {
    my %names = ();
    my @yp = `/usr/local/ldap_tools/ypcat passwd`; chomp @yp;
    for my $i (@yp) {
	if ($i =~ /^(\w+):[^:]*:\d+:\d+:([^:,]+)/) {
	    $names{$1} = $2;
	}
    }
    return \%names;
}


###################################
###################################
###                             ###
###    Execution starts here    ###
###                             ###
###################################
###################################

GetOptions ( "help"        => \$help,
	         "source"      => \$source,
             "target"      => \$target);

if ($help) {
    print_help;
    exit 0;
}

$source = "." unless $source;
$target = "$source/list.html" unless $target;

$passwd = read_passwd ("/usr/local/ldap_tools/ypcat passwd");

#print ObjectContents ($passwd->{byname}->{akuntz});

unless (-d "$source/250x250") {
    print STDERR "Error: '$source/250x250' not found.\n\n";
    print_help;
    exit 1 ;
}

my $names = get_names;

open (OUT, "> $target") or die "Cannot open '$target' for writing";

print OUT "<head></head>\n<body>\n";
print OUT "<table border='2'>\n";

my $counter = 0;

#<tr>
#    <td align='center'>
#      <a href='/~name'>name</a> (name name)<br>
#      <a href="./400x400/name-400.jpg"><img src='./250x250/name-250.jpg'></a></td>
#    <td align='center'>
#      <a href='/~name2'>name2</a> (name2 name2)<br>
#      <a href="./400x400/name2-400.jpg"><img src='./250x250/name2-250.jpg'></a></td>
#    <td align='center'>
#      <a href='/~name3'>name3</a> (name3 name3)<br>
#      <a href="./400x400/name3-400.jpg"><img src='./250x250/name3-250.jpg'></a></td>
#  </tr>
  
for $file (<$source/250x250/*>) {
    my $uname = ($file =~ /250x250\/([a-z]+)/i) [0];
    $uname = lc ($uname);
	#print "$uname   $file\n";
    my $col = $counter % $columns;

    if ($uname && $uname !~ /\b(group|pic)\b/) {
	my $entry = $passwd->{byname}->{$uname};

#<tr>
#<td align='center'>
	print OUT "  <tr>\n" if $col == 0;
	print OUT "    <td align='center'>\n";
	
#<a href='/~name'>name</a> (name name)<br>
	if ($names->{$uname}) {
	    print OUT "      <a href='/~$uname'>$uname</a>";
	    print OUT " ($names->{$uname})<br>\n";
	} else {
	    print OUT "      $uname<br>\n";
	}

#<a href="./400x400/name-400.jpg"><img src='./250x250/name-250.jpg'></a></td>
	my @bigpics = <$source/400x400/$uname*.jpg>;my $bigpic = "";
	for my $i (@bigpics) { $bigpic = $i if $i =~ /$uname[\d\W]/;}

	if (-r $bigpic) {
	    print OUT "      <a href=\"$bigpic\">";
	    print OUT "<img src='$file'></a>";
	} else {	    
	    print OUT "      <img src='$file'>";
	}
	print OUT "</td>\n";
	
#</tr>
	print OUT "  </tr>\n" if $col == 2;

#putting in personal directory
	if ($entry && -d $entry->{home} && -d "$entry->{home}/public_html") {
	    my $picdir = "$entry->{home}/public_html/CSCF-pics";
	    unless (-d $picdir) {
		print "Processing $uname ... ";
		mkdir $picdir;
		for (<$source/*/$uname-*>) { copy $_, $picdir; }
		chmod 0755, $picdir;
		chmod 0644, <$picdir/*>;
		chown $entry->{id}, $entry->{gid}, $picdir;
		chown $entry->{id}, $entry->{gid}, <$picdir/*>;

#mailing results
		open (MAIL, "| /exp/rcf/common/bin/perl_mail -t $uname -f system\@cs.umass.edu -s 'Your pictures are on-line' -b - Bcc valerie,terrie") or warn "Couldn't send mail to $uname\n";
		print MAIL "The pictures CSCF took of you are now in your public web area:\n\n";
		print MAIL "# ls -l $picdir\n", `ls -l $picdir`, "\n";
		print MAIL "To see them go to http://www.cs.umass.edu/~$uname/CSCF-pics/\n";
		print MAIL "It's currently not accessible to anyone. If you want to have it be world-\n";
		print MAIL "readable, please execute the following commands for your public account:\n\n";
		print MAIL "# chmod -R go+rx $picdir\n\n";
		print MAIL "Also, please note that if you remove the directory in question, it may be\n";
		print MAIL "automatically recreated when this script runs again. To avoid this, either\n";
		print MAIL "read-protect the directory as per above instructions, or just leave it\n";
		print MAIL "empty.\n\n-- \n";
		print MAIL "\tCSCF picture processor script\n";
		close MAIL;
		print "Done.\n";
	    }

#	    system "rm -rf $picdir";
#	    exit 0;
	}
	
	++$counter;
    }
}

print OUT "  </tr>\n" unless $counter % $columns == 0;
print OUT "</table>\n";

#for my $name (sort keys %$names) {
#    print OUT "$name    $names->{$name}\n";
#}
print OUT "</body>\n";
close OUT;

