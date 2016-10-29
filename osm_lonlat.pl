
#!/usr/bin/perl -w

#http://search.cpan.org/~pauamma/Geo-PostalAddress-0.04/PostalAddress.pm

use strict;
#use warnings;
use Geo::Parse::OSM;
use Data::Dumper;

my $path="B:\\Research\\RAWDATA\\OSM";
my @states=("alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "district-of-columbia",
            "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland",
            "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new-hampshire",
            "new-jersey", "new-mexico", "new-york", "north-carolina", "north-dakota", "ohio", "oklahomoa", "oregon", "pennsylvania", "rhode-island",
            "south-carolina", "south-dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west-virginia",
            "wisconsin", "wyoming");

foreach my $state (@states) {
  
  print "Parsing $state\n";

  open (OUTFILE, ">$path\\Parsed\\$state\_lonlat.txt") or die "Can't open subjects file: $state\_lonlat.txt";
  print OUTFILE "type	id	lat	lon\n";

  Geo::Parse::OSM->parse_file( "$path\\$state-latest.osm.bz2",
        sub{
            my $id="$_[0]->{id}";
            my $lat="$_[0]->{lat}";
            my $lon="$_[0]->{lon}";
            my $type="$_[0]->{type}";

            print OUTFILE "$type	$id	$lat	$lon\n";
        }
  );
}