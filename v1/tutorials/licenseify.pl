#!/usr/bin/perl
use warnings;
use strict;

print "Which file contains the authoring information? ";
	my $author_file = <>;
	chomp($author_file);
print "which file contains the license? ";
	my $license_file = <>;
	chomp($license_file);
print "Which file would you like to modify? ";
	my $file_to_mod = <>;
	chomp($file_to_mod);

open( MFILE, $file_to_mod) or die "The file $file_to_mod could not be opened";
open( AFILE, $author_file) or die "The file $author_file could not be opened";
open( LFILE, $license_file) or die "The file $license_file could not be opened";
open( OFILE, ">", "/tmp/licensify_output_file") or die "the output file could not be opened.";


while(<AFILE>){
#	chomp;
	print OFILE "# $_";
}
while(<LFILE>){
#	chomp;
	print OFILE "# $_";
}
while(<MFILE>){
#	chomp;
	print OFILE $_;
}

close AFILE;
close LFILE;
close MFILE;
close OFILE;

