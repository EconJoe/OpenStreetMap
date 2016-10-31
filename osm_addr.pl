
#!/usr/bin/perl -w

#http://search.cpan.org/~pauamma/Geo-PostalAddress-0.04/PostalAddress.pm

use strict;
#use warnings;
use Geo::Parse::OSM;
use Data::Dumper;

my $path="B:\\Research\\RAWDATA\\OSM";
my $path="B:\\Research\\RAWDATA\\OSM";
my @states=("alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "district-of-columbia",
            "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland",
            "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new-hampshire",
            "new-jersey", "new-mexico", "new-york", "north-carolina", "north-dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode-island",
            "south-carolina", "south-dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west-virginia",
            "wisconsin", "wyoming");

foreach my $state (@states) {
  
  print "Parsing $state\n";

  open (OUTFILE, ">$path\\Parsed\\Addresses\\$state\_addr.txt") or die "Can't open subjects file: $state\_addr.txt";
  print OUTFILE "type	id	addrcity	addrpostcode	addrstreet	addrhousenumber\n";

  Geo::Parse::OSM->parse_file( "$path\\$state-latest.osm.bz2",
        sub{
            my $id="$_[0]->{id}";
            my $type="$_[0]->{type}";

            my $addrcity="addr:city"; $addrcity="$_[0]->{tag}->{$addrcity}";
            my $addrpostcode="addr:postcode"; $addrpostcode="$_[0]->{tag}->{$addrpostcode}";
            my $addrstreet="addr:street"; $addrstreet="$_[0]->{tag}->{$addrstreet}";
            my $addrhousenumber="addr:housenumber"; $addrhousenumber="$_[0]->{tag}->{$addrhousenumber}";
            
            if ($addrcity ne "" | $addrpostcode ne "" | $addrstreet ne "" | $addrhousenumber ne "") {
               print OUTFILE "$type	$id	$addrcity	$addrpostcode	$addrstreet	$addrhousenumber\n";
            }
        }
  );
}