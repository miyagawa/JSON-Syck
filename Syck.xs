#define YAML_IS_JSON 1
#include "perl_syck.h"

MODULE = JSON::Syck		PACKAGE = JSON::Syck		

PROTOTYPES: DISABLE

SV *
Load (s)
	char *	s

SV *
Dump (sv)
	SV *	sv
