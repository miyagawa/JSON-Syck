#include "perl_syck.h"
#undef YAML_IS_JSON

MODULE = JSON::Syck		PACKAGE = JSON::Syck		

PROTOTYPES: DISABLE

SV *
Load (s)
	char *	s

SV *
_Dump (sv)
	SV *	sv
