#!/usr/bin/perl
use warnings;
use strict;

open(my $INFILE,"<",$ARGV[0]) or die "Missing Input File";
open(my $OUTFILE,">",$ARGV[1]) or die "Missing Output File";
my $SEQ='';

while (my $line = <$INFILE>) {
 chomp $line;
 if (substr($line,0,1) eq '>'){
  if ($SEQ ne ''){
   $SEQ=reverse($SEQ);
   $SEQ =~ tr/ATGCatgcUu/TACGtacgAa/;
   $SEQ =~ s/(.{1,60})/$1\n/g;
   chomp $SEQ;
   print $OUTFILE "$SEQ\n";
  }
  $SEQ='';
  print $OUTFILE "$line\n";
 }else
 {
  $SEQ=$SEQ.$line
 }
}
$SEQ=reverse($SEQ);
$SEQ =~ tr/ATGCatgcUu/TACGtacgAa/;
$SEQ =~ s/(.{1,60})/$1\n/g;
chomp $SEQ;
print $OUTFILE "$SEQ\n";
close $OUTFILE;
