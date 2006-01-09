package JSON::Syck;
use strict;

use Exporter;
use DynaLoader;

our $VERSION = '0.01';
our @EXPORT_OK  = qw( Dump Load );
our @ISA     = qw( Exporter DynaLoader );

__PACKAGE__->bootstrap;

sub Dump {
    my $json = JSON::Syck::_Dump(@_);
    chomp($json);
    $json;
}

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

While JSON is a pure-perl module and JSON::Syck is based on libsyck,
JSON::Syck is supposed to be very fast and memory efficient. See
chansen's benchmark table at L<http://rafb.net/paste/results/8rSJGq74.txt>.

JSON.pm comes with dozens of ways to do the same thing and lots of
options, while JSON::Syck doesn't.

JSON::Syck doesn't use camelCase method names :-)

=head1 BUGS

C<Load> function in JSON::Syck is actually the same with that of
YAML's. That means, when you give a valid YAML but non-valid JSON
data, it just accepts and is able to parse the string.

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@gmail.comE<gt>

This module is forked from Audrey Tang's excellent YAML::Syck module
and 99% of the XS code is written by Audrey.

The F<libsyck> code bundled with this module is written by I<why the
lucky stiff>, under a BSD-style license.  See the F<COPYING> file for
details.

The F<Storable.xs> code bundled with this library is written by
Raphael Manfredi and maintained by perl5-porters, under the same
license as Perl.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
