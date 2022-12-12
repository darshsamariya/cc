%{
#include "y.tab.h"
%}
alpha [A-Za-z]
digit [0-9]
ALPHA [A-Za-z]
DIGIT [0-9]
%%
"//".*\n {}
"/*"\**[^*/]*"*/" { } 
[\t \n]
for             return FOR;
{digit}+    return NUM;
"int" return DT; 
"if"  return IF;
"then"        return THEN;
"else"        	return ELSE;
{ALPHA}({ALPHA}|{digit})*    return ID;
"<="         return LE;
">="         return GE;
"=="         return EQ;
"!="          return NE;
"||"            return OR;
"&&"         return AND;
[ \n\t\r]+ {}
.                return yytext[0];
 
%%