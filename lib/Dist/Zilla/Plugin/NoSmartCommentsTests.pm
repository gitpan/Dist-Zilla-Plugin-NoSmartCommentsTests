#
# This file is part of Dist-Zilla-Plugin-NoSmartCommentsTests
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package Dist::Zilla::Plugin::NoSmartCommentsTests;
BEGIN {
  $Dist::Zilla::Plugin::NoSmartCommentsTests::AUTHORITY = 'cpan:RSRCHBOY';
}
BEGIN {
  $Dist::Zilla::Plugin::NoSmartCommentsTests::VERSION = '0.005';
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

version 0.005

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

use Test::More 0.88;

eval "use Test::NoSmartComments";
plan skip_all => 'Test::NoSmartComments required for checking comment IQ'
    if $@;

no_smart_comments_in_all();

done_testing();
