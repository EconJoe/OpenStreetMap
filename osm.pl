
#!/usr/bin/perl -w

use strict;
#use warnings;
use Geo::Parse::OSM;
use Data::Dumper;

open (OUTFILE1, ">Dumped.txt") or die "Can't open subjects file: Dumped.txt";
open (OUTFILE2, ">Test.txt") or die "Can't open subjects file: Test.txt";


Geo::Parse::OSM->parse_file( 'map.osm', sub{ print OUTFILE1 Dumper $_[0] } );

Geo::Parse::OSM->parse_file( 'map.osm',
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

          my $addrcity="addr:city"; $addrcity="$_[0]->{tag}->{$addrcity}";
          my $addrpostcode="addr:postcode"; $addrpostcode="$_[0]->{tag}->{$addrpostcode}";
          my $addrstreet="addr:street"; $addrstreet="$_[0]->{tag}->{$addrstreet}";
          my $addrhousenumber="addr:housenumber"; $addrhousenumber="$_[0]->{tag}->{$addrhousenumber}";

          print OUTFILE2 "$type	$id	$visible	$timestamp	$lat	$lon	$user	$changeset	$uid	";
          print OUTFILE2 "$amenity	$source	$website	$addrcity	$addrpostcode	$addrstreet	$addrhousenumber\n";
      } 
);

