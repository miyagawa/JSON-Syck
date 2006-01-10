use strict;
use Data::Dumper;
use Test::More;
use JSON::Syck;
use Storable;

our $HAS_JSON = 0;
eval { require JSON; $HAS_JSON = 1 };

$Data::Dumper::Indent = 0;
$Data::Dumper::Terse  = 1;

my @tests = (
    '"foo"',
    '[1, 2, 3]',
    '[1, 2, 3]',
    '2',
    '2.1',
    '"foo\'bar"',
    '[1,2,3]',
    '[1.1, 2.2, 3.3]',
    '[1.1,2.2,3.3]',
    '{"foo": "bar"}',
    '{"foo":"bar"}',
    '[{"foo": 2}, {"foo": "bar"}]',
);

plan tests => scalar @tests * (1 + $HAS_JSON);

my $conv = $HAS_JSON ? JSON::Converter->new : undef;

for my $test (@tests) {
    my $data = eval { JSON::Syck::Load($test) };
    my $json = JSON::Syck::Dump($data);

    # don't bother white spaces
    for ($test, $json) {
        s/([,:]) /$1/eg;
    }
    is $json, $test, "roundtrip $test -> " . Dumper($data) . " -> $json";

    # try parsing the data with JSON.pm
    if ($HAS_JSON) {
        my $data_pp = eval { JSON::jsonToObj($json) };
        is_deeply $data_pp, $data, "compatibility with JSON.pm $test";
    }
}
