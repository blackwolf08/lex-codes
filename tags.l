%{ 
    int hello = 0;
%} 
  
%% 

"\/\*"[^(\*\/)]*"\*\/" {printf("%s\n", yytext); } 
. ;  // else do nothing 

%%     
  
int yywrap(){} 
       
int main(int argc, char*argv[]) 
{ 
    FILE *fp;
    fp = fopen("test.c","r"); 
    yyin = fp; 
  
    yylex();  
  
    return 0; 
} 