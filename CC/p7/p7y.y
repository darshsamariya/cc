%{
#include <stdio.h>
#include <stdlib.h>
  
//S         : ST {printf("Input accepted\n"); exit(0);}
//DAT   : DT | 'int' | 'float' |;
%}

%right "="
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%token ID NUM FOR LE GE EQ NE OR AND DT IF ELSE THEN

%%
ST       :  FOR '(' ForE1';' Ex ';' Ex ')' DEF 
           | IF '(' E ')' DEF ELSE DEF 
           | E ';'  
           ;
DEF    : '{' BODY '}' | E | ';' | ST
                ;
BODY  : BODY ST
           |ST
           |
               
           ;
           
Ex: E 
    |
    ;
ForE1 : Ex
       |DT ID '=' E
       ;
E        : ID '=' E
          | E '+' E
          | E '-' E
          | E '*' E
          | E '/' E
          | E '<' E
          | E '>' E
          | E LE E
          | E GE E
          | E EQ E
          | E NE E
          | E OR E
          | E AND E
          | E '+' '+'
          | E '-' '-' 
          | NUM 
          ; 
E2     : E'<'E
         | E'>'E
         | E LE E
         | E GE E
         | E EQ E
         | E NE E
         | E OR E
         | E AND E 
         |NUM |
         ;   
%%

int main()
{ yyparse();
  return 0;
}
void yyerror (char *s){
printf("Syntax Error\n");
}
void yywrap(){
//exit(0);
}
