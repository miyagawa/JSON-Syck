use strict;
use lib '.';
use inc::Module::Install;

name        'JSON-Syck';
all_from    'lib/JSON/Syck.pm';
inc_paths   '.';
c_files     (glob("*.c"), (-e 'Syck.c' ? () : 'Syck.c'));
#optimize_flags '-g3';

can_cc or die "This module requires a C compiler";

WriteAll;
