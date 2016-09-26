#!/usr/bin/perl -w

use strict;
use warnings;
use LWP::Simple;

# Set path to input HTML files
my $path="B:\\Research\\RAWDATA\\OSM";
open (OUTFILE, ">$path\\wikiparse.txt") or die "Can't open subjects file: wikiparse.txt";
print OUTFILE "franchisename\n";

my $url="https://en.wikipedia.org/wiki/List_of_franchises";
my $content = get $url;  die "Couldn't get $url" unless defined $content;

while ($content=~/<li><a href="\/wiki\/(.*?)title="(.*?)">(.*?)<\/a>, /g) {
      my $franchisename="$2";
      print OUTFILE "$franchisename\n";
}



