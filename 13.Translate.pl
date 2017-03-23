# 对于给定的核苷酸序列，翻译成蛋白质

#! /usr/bin/perl -w
#Translate DNA into protein

use strict;
use warnings;

my %proteins = qw/
    UUU F UUC F UUA L UUG L UCU S UCC S UCA S UCG S UAU Y UAC Y UGU C UGC C UGG W
    CUU L CUC L CUA L CUG L CCU P CCC P CCA P CCG P CAU H CAC H CAA Q CAG Q CGU R CGC R CGA R CGG R
    AUU I AUC I AUA I AUG M ACU T ACC T ACA T ACG T AAU N AAC N AAA K AAG K AGU S AGC S AGA R AGG R
    GUU V GUC V GUA V GUG V GCU A GCC A GCA A GCG A GAU D GAC D GAA E GAG E GGU G GGC G GGA G GGG G
    /;
    
print "Import your DNA sequence(end with Enter):\n";
LINE: while (<>) {
    chomp;
    
    y/GCTA/CGAU/; # translate (point 1&2 mixed)
    
    foreach my $protein (/(...)/g) {
        if (defined $proteins{$protein}) {
            print $proteins{$protein};
        }
        else {
            print "Whoops, stop state?\n";
            next LINE;
        }
    }
    print "\n"
}
