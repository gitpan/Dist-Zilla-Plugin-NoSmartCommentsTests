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
  $Dist::Zilla::Plugin::NoSmartCommentsTests::VERSION = '0.006';
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

version 0.006

=head1 SYNOPSIS

In C<dist.ini>:

    [NoSmartCommentsTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/no-smart-comments.t - test to ensure no Smart::Comments

=head1 NOTE

The name of this plugin has turned out to be somewhat misleading, I'm afraid:
we don't actually test for the _existance_ of smart comments, rather we
ensure that Smart::Comment is not used by any file checked.

=head1 SEE ALSO

L<Smart::Comments>, L<Test::NoSmartComments>

=head1 BUGS

All complex software has bugs lurking in it, and this module is no exception.

Please report any bugs to
"bug-dist-zilla-plugin-nosmartcommentstests@rt.cpan.org", or through the web
interface at <http://rt.cpan.org>.

Patches and pull requests through GitHub are most welcome; our page and repo
(same URI):

    https://github.com/RsrchBoy/dist-zilla-plugin-nosmartcommentstests

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
