%{
#include<stdio.h>
int count = 0;
int line = 0;
%}
%%
"auto"|"break"|"case"|"const"|"continue"|"default"|"do"|"else"|"enum"|"extern"|"register"|"goto"|"if"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"
{
    printf("<Keyword>");
     }
"char"|"double"|"float"|"for"|"int"|"long" {printf("<Data Type>"); }
[-,+]?[0-9]+ {printf("<Constants>"); }
^#.* {printf("<Preprocessor>"); }
[!+/\-\*%<=>?:]+ {printf("<Operators>"); }
[#\$?\^&\*]+ {printf("<Special Chars>"); }
[_a-zA-Z][a-zA-Z0-9]+ {printf("<Identifiers>"); }
[()] {printf("%s",yytext);}
"//".*\n {printf("<Single line Comment>"); }
"/*"[^*/]*"*/" {printf("<Multi line Comment>"); }
; printf(";");
\n printf("\n");
" " printf("");
\{ printf("{");
\} printf("}");
%%
int yywrap(){}
main(){yylex();}