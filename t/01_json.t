use strict;
use Data::Dumper;
use Test::More;
use JSON::Syck;
use Storable;

$Data::Dumper::Indent = 0;
$Data::Dumper::Terse  = 1;

my @tests = (
    '"foo"',
    '"foo\'bar"',
    '[1, 2, 3]',
    '[1.1, 2.2, 3.3]',
    '{"foo": "bar"}',
);

plan tests => scalar @tests;

warn my $d = JSON::Syck::Dump(JSON::Syck::Load($tests[2]));

for (@tests) {
    my $test = ref($_) ? Storable::dclone($_) : $_;
    my $data = JSON::Syck::Load($test);
    my $json = JSON::Syck::Dump($data);
    is $json, $test, "roundtrip $test -> " . Dumper($data) . " -> $json";
}
