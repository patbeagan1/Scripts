#!/usr/bin/perl
use warnings;
use strict;

open(my $in, "<", "input.txt") or die "the file does not exist (input.txt)";
while (<$in>){
	print "Just read in the the line: $_";
}
