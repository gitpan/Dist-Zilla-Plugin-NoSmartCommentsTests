package Dist::Zilla::Plugin::NoSmartCommentsTests;
BEGIN {
  $Dist::Zilla::Plugin::NoSmartCommentsTests::AUTHORITY = 'cpan:RSRCHBOY';
}
BEGIN {
  $Dist::Zilla::Plugin::NoSmartCommentsTests::VERSION = '0.002';
}

# ABSTRACT: Make sure no Smart::Comments escape into the wild

use Moose;
use namespace::autoclean;

extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
1;




=pod

=head1 NAME

Dist::Zilla::Plugin::NoSmartCommentsTests - Make sure no Smart::Comments escape into the wild

=head1 VERSION

version 0.002

=head1 SYNOPSIS

In C<dist.ini>:

    [NoSmartCommentTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/no-smart-comments.t - test to ensure no Smart::Comments

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut


__DATA__
___[ xt/release/no-smart-comments.t ]___
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Module::ScanDeps;
use ExtUtils::Manifest qw( maniread );

my $manifest = maniread();
my @files = grep m!^lib/.*\.pm$!, keys %$manifest;
plan tests => scalar @files;

for my $file (@files) {

    my $href = scan_deps(files => [ $file ], recurse => 0);

    ### $href
    is exists $href->{'Smart/Comments.pm'} => q{}, "$file w/o Smart::Comments";
}

1;
