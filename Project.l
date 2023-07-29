%{

int total =0 ;

%}

%option noyywrap


%%
("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")|("EOF")|("return")|("char")|("case")|("sizeof")|("long")|("short")|("typedef")|("switch")|("unsigned")|("void")|("static")|("struct")|("goto") {total++;fprintf(yyout,"This is Keyword:%s\n",yytext);}


[a-zA-Z_][a-zA-Z0-9_]* {total++; fprintf(yyout,"This is Identifier: %s\n\n",yytext);}



"and"|"or"|"not"|"nand"|"xor"|"nor"|"xnor"|"<="|">="|"++"|"!="|"=="|"<"|">"|"+"|"-"|"*"|"/"|"="  {total++; fprintf(yyout,"This is  Operators: %s\n\n",yytext);}

[''|,|;(|)|{|}|.|_] {total++; fprintf(yyout,"This is punctuation marks : %s\n\n",yytext);}

"#"|"@"|"$"|"^"|"%"|"^"|"&" {total++; fprintf(yyout,"This is Special Characters of punctuation: %s\n\n",yytext);}


[0-9]*"."[0-9]+|[-][0-9]*"."[0-9]+|[0-9]+|"-"[0-9]+ {total++;fprintf(yyout,"This is Constant: %s\n\n", yytext);} 


"//".*" "*    {total++;fprintf(yyout,"this is single line Commments: %s\n\n",yytext);}

\/\*(.*\n)*.*\*\/    {total++;fprintf(yyout,"this is multi line Comments: %s\n\n",yytext);}



. {fprintf(yyout,"",yytext);}

[\t\n]+


%%

main()
{
extern FILE *yyin, *yyout; 
  
    
    yyin = fopen("input.txt", "r"); 
  
   
    yyout = fopen("Output.txt", "w"); 
  
    yylex();

	fprintf(yyout,"\n\n\n\n\n Total Tokens = %d",total);
	 

    return 0; 
}

