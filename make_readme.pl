#!/usr/bin/perl
use strict;
use warnings;

# Regenerate README.md as a bulleted list of links to the documents in this directory.
# Each link shows the document's title, sorted by title.

my $readme = 'README.md';

# A Markdown file's title is its first "# " heading outside a code block.
sub markdown_title {
    my ($file) = @_;
    open(my $in, '<', $file) or die "Can't read $file: $!\n";
    my $in_code = 0;
    while (my $line = <$in>) {
        if ($line =~ /^\s*(```|~~~)/) {
            $in_code = !$in_code;
        } elsif (!$in_code && $line =~ /^#\s+(.+?)\s*#*\s*$/) {
            return $1;
        }
    }
    return undef;
}

# Anything else gets a title made from its filename: c++_cheat_sheet.txt => C++ Cheat Sheet
sub filename_title {
    my ($file) = @_;
    (my $title = $file) =~ s/\.[^.]+$//;
    $title =~ tr/_/ /;
    $title =~ s/(\S+)/\u$1/g;
    return $title;
}

my %titles;
for my $file (glob('*')) {
    next unless -f $file && $file ne $readme && $file ne 'LICENSE.txt' && $file =~ /\.(md|txt|pdf)$/i;
    my $title = $file =~ /\.md$/i ? markdown_title($file) : undef;
    $titles{$file} = defined $title ? $title : filename_title($file);
}

open(my $out, '>', $readme) or die "Can't write $readme: $!\n";
print $out <<'EOF';
These are some documents I've written for my own reference over the years. They range from [a couple of stray notes on a topic](c++_cheat_sheet.txt) to [a thoroughly documented and tested process for installing a development environment](Running_SGDK_on_macOS_27.md). You are free to use any of them under the terms of the [CC0](LICENSE.txt) license.

EOF

for my $file (sort { lc($titles{$a}) cmp lc($titles{$b}) } keys %titles) {
    (my $link = $file) =~ s/ /%20/g;
    print $out "* [$titles{$file}]($link)\n";
}
close($out);
