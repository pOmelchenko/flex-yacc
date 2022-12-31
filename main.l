%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+                  yylval=atoi(yytext); return T_NUMBER;
heat                    return T_HEAT;
on|off                  yylval=!strcmp(yytext,"on"); return T_STATE;
get                     return T_GET;
target                  return T_TARGET;
temperature             return T_TEMPERATURE;
temp                    return T_TEMPERATURE;
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%
