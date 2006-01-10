use strict;
use Data::Dumper;
use Test::More;
use JSON::Syck;
use JSON;
use Storable;

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

plan tests => scalar @tests;

my $conv = JSON::Converter->new;

for my $test (@tests) {
    my $data = eval { JSON::Syck::Load($test) };
    my $json = JSON::Syck::Dump($data);
    is $json, $test, "roundtrip $test -> " . Dumper($data) . " -> $json";

    # try parsing the data with JSON.pm
    my $data_pp = JSON::jsonToObj($json);
    is_deeply $data_pp, $data, "compatibility with JSON.pm $test";
}
