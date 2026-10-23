#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Regenerate README.md as a bulleted list of links to the documents in this directory.

my $readme = 'README.md';

my @docs = sort { lc($a) cmp lc($b) }
           grep { -f $_ && $_ ne $readme && /\.(md|txt|pdf)$/i }
           glob('*');

open(my $out, '>', $readme) or die "Can't write $readme: $!\n";
for my $file (@docs) {
    (my $link = $file) =~ s/ /%20/g;
    print $out "* [$file]($link)\n";
}
close($out);
