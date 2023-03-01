/*
	Analisador HTML v.1 - Analisador HTML
	Lucas Cruz
*/

%{
#define YYSTYPE double
#include "analiser.tab.h" 
#include <stdlib.h>

void yyerror(char *s); 
%}

%%
"<!DOCTYPE html>"	{return VERSION;}
[a-zA-Z]*[1-9]*[\.\,]*  	{return WORD;}
[\<]              	{return OPENTAG;}
[\>]              	{return CLOSETAG;}
[\<][\/]          	{return OPENENDTAG;}
[\n  \r\n]		  	{return EOL; }
[:space:]		 ;
.				 {yyerror("Undefined token\n"); }

%%

int yywrap()
{
	return 1;
}
