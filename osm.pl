
#!/usr/bin/perl -w

#http://search.cpan.org/~pauamma/Geo-PostalAddress-0.04/PostalAddress.pm

use strict;
#use warnings;
use Geo::Parse::OSM;
use Data::Dumper;

my $path="C:\\Users\\JoeS\\Downloads";

open (OUTFILE1, ">Dumped.txt") or die "Can't open subjects file: Dumped.txt";

open (OUTFILE2, ">Test.txt") or die "Can't open subjects file: Test.txt";
print OUTFILE2 "type	id	visible	timestamp	lat	lon	user	changeset	uid	";
print OUTFILE2 "amenity	source	website	phone	openinghours	cuisine	name	wikipedia	internetaccess	";
print OUTFILE2 "addrcity	addrpostcode	addrstreet	addrhousenumber\n";


#Geo::Parse::OSM->parse_file( "$path\\ex_HsvMczpFRQizva2AW4gLHbGmTSP3k.osm.bz2", sub{ print OUTFILE1 Dumper $_[0] } );

Geo::Parse::OSM->parse_file( "$path\\ex_HsvMczpFRQizva2AW4gLHbGmTSP3k.osm.bz2",
      sub{
          my $id="$_[0]->{id}";
          my $visible="$_[0]->{visible}";
          my $timestamp="$_[0]->{timestamp}";
          my $lat="$_[0]->{lat}";
          my $lon="$_[0]->{lon}";
          my $user="$_[0]->{user}";
          my $changeset="$_[0]->{changeset}";
          my $uid="$_[0]->{uid}";
          my $type="$_[0]->{type}";
          
          my $amenity="$_[0]->{tag}->{amenity}";
          my $source="$_[0]->{tag}->{source}";
          my $website="$_[0]->{tag}->{website}";
          my $phone="$_[0]->{tag}->{phone}";
          my $openinghours="$_[0]->{tag}->{opening_hours}";
          my $cuisine="$_[0]->{tag}->{cuisine}";
          my $name="$_[0]->{tag}->{name}";
          my $wikipedia="$_[0]->{tag}->{wikipedia}";
          my $internetaccess="$_[0]->{tag}->{internet_access}";

          my $addrcity="addr:city"; $addrcity="$_[0]->{tag}->{$addrcity}";
          my $addrpostcode="addr:postcode"; $addrpostcode="$_[0]->{tag}->{$addrpostcode}";
          my $addrstreet="addr:street"; $addrstreet="$_[0]->{tag}->{$addrstreet}";
          my $addrhousenumber="addr:housenumber"; $addrhousenumber="$_[0]->{tag}->{$addrhousenumber}";

          print OUTFILE2 "$type	$id	$visible	$timestamp	$lat	$lon	$user	$changeset	$uid	";
          print OUTFILE2 "$amenity	$source	$website	$phone	$openinghours	$cuisine	$name	$wikipedia	$internetaccess	";
          print OUTFILE2 "$addrcity	$addrpostcode	$addrstreet	$addrhousenumber\n";
      } 
);

