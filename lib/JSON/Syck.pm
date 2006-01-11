package JSON::Syck;
use strict;

use Exporter;
use DynaLoader;

our $VERSION = '0.02';
our @EXPORT_OK  = qw( Dump Load );
our @ISA     = qw( Exporter DynaLoader );

__PACKAGE__->bootstrap;

$JSON::Syck::ImplicitTyping  = 1;
$JSON::Syck::Headless        = 1;
$JSON::Syck::ImplicitUnicode = 0;

1;

__END__

=head1 NAME

JSON::Syck - JSON is YAML

=head1 SYNOPSIS

  use JSON::Syck;

  my $data = JSON::Syck::Load($json);
  my $json = JSON::Syck::Dump($data);

=head1 DESCRIPTION

JSON::Syck is a syck implementatoin of JSON parsing and
generation. Because JSON is YAML
(L<http://redhanded.hobix.com/inspect/yamlIsJson.html>), using syck
gives you the fastest and most memory efficient parser and dumper for
JSON data representation.

=head1 DIFFERENCE WITH JSON

You might want to know the difference between I<JSON> and
I<JSON::Syck>.

Since JSON is a pure-perl module and JSON::Syck is based on libsyck,
JSON::Syck is supposed to be very fast and memory efficient. See
chansen's benchmark table at
L<http://idisk.mac.com/christian.hansen/Public/perl/serialize.pl>

JSON.pm comes with dozens of ways to do the same thing and lots of
options, while JSON::Syck doesn't. There's only C<Load> and C<Dump>.

Oh, and JSON::Syck doesn't use camelCase method names :-)

=head1 AUTHORS

Audrey Tang E<lt>autrijus@autrijus.orgE<gt>

Tatsuhiko Miyagawa E<lt>miyagawa@gmail.comE<gt>

This module is originally forked from Audrey Tang's excellent
YAML::Syck module and 99.9% of the XS code is written by Audrey.

The F<libsyck> code bundled with this module is written by I<why the
lucky stiff>, under a BSD-style license.  See the F<COPYING> file for
details.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
