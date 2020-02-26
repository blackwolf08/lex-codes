%{
    #include<stdio.h>
    #include<string.h>
    int count=1;
    

%}

%%

[a-zA-Z]* {fprintf(yyout,"<h%d>%s</h%d>\n",count,yytext,count);count=count%6+1;}
\n {fprintf(yyout,"<BR/>");}


%%

int yywrap(){}

int main(){
    FILE *fp;
    fp=fopen("test.c","r");
    yyin = fp;
    yyout=fopen("tags2.txt", "w");
    fprintf(yyout,"<HTML>\n<BODY>");
    yylex();
    fprintf(yyout,"</HTML>\n</BODY>");
    printf("%d",count);
    return 0;

}