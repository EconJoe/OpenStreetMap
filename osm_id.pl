
#!/usr/bin/perl -w

#http://search.cpan.org/~pauamma/Geo-PostalAddress-0.04/PostalAddress.pm

use strict;
#use warnings;
use Geo::Parse::OSM;
use Data::Dumper;

my $path="B:\\Research\\RAWDATA\\OSM";
my @states=("alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "district-of-columbia",
            "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "lousiana", "maine", "maryland",
            "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new-hampshire",
            "new-jersey", "new-mexico", "new-york", "north-carolina", "north-dakota", "ohio", "oklahomoa", "oregon", "pennsylvania", "rhode-island",
            "south-carolina", "south-dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west-virginia",
            "wisconsin", "wyoming");

foreach my $state (@states) {
  
  print "Parsing $state\n";
  open (OUTFILE2, ">$path\\Parsed\\ID\\$state\_ID.txt") or die "Can't open subjects file: $state\_ID.txt";
  print OUTFILE2 "id\n";

  Geo::Parse::OSM->parse_file( "$path\\$state-latest.osm.bz2",
        sub{
            my $id="$_[0]->{id}";
            print OUTFILE2 "$id\n";
        }
  );
}