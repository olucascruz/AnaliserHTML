/*
	Interpretador v.1 - Parser HTML
	Lucas Cruz && Larissa ROCK
*/

%{
#define YYSTYPE double
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
extern FILE* yyin;

void yyerror(char *s);
int yylex(void);
int yyparse();
%}

%token OPENTAG EOL WORD
%token CLOSETAG OPENENDTAG VERSION

%left EOL OPENTAG CLOSETAG OPENENDTAG
%left WORD VERSION

%%
STATEMENT:
	STATEMENT EXPRESSION EOL {$$ = $2;}
	|
	;

EXPRESSION: VERSION 							{}
	|OPENTAG WORD CLOSETAG WORD_CONTENT WORD_CONTENT  WORD_CONTENT OPENENDTAG WORD CLOSETAG								  {}
	|   OPENTAG WORD CLOSETAG WORD_CONTENT 		{}
    |   WORD_CONTENT OPENENDTAG WORD CLOSETAG 	{}
	|   OPENTAG WORD CLOSETAG 					{}
	|   OPENENDTAG WORD CLOSETAG				{}
	|   WORD_CONTENT							{}
	|
    ;

WORD_CONTENT: WORD 
	|WORD_CONTENT WORD  {}
	|
    ;

%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
	exit(EXIT_FAILURE);
}

int main(int argc, char *argv[])
{
	if (argc == 1)
    {
		yyparse();
    }

	if (argc == 2)
	{
    	yyin = fopen(argv[1], "r");
		yyparse();
		printf("It is HTML \n");

    }

	return 0;
}