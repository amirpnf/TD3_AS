%{
#include <stdio.h>
%}
%option nounput
%option noinput
%option noyywrap

SEPARATOR [\r\t\n ]
%x COMMENT  
%%
\/\/.*$ {}
"/*" { BEGIN COMMENT; }
<COMMENT>"*/" { BEGIN INITIAL; }
<COMMENT>. {}
<COMMENT>{SEPARATOR} {}
[A-Za-z_][A-Za-z_1-9]*/{SEPARATOR}*\( { printf("%s\n", yytext); }
{SEPARATOR} ;
. ;
%%
