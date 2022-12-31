%{
#include <stdio.h>
#include <string.h>

int yylex(void);
int yyparse(void); 
void yyerror(const char *);

int state = 0;
int temp = 0;

void yyerror(const char *str)
{
    fprintf(stderr,"error: %s\n",str);
}

int yywrap()
{
    return 1;
}

int main(void)
{
    yyparse();

    return 0;
}

%}

%token T_NUMBER T_HEAT T_GET T_STATE T_TARGET T_TEMPERATURE

%%

commands: /* empty */
    | commands command
    ;


command:
    heat_switch
    |
    get_temp
    |
    target_set
    ;

heat_switch:
    T_HEAT T_STATE 
    {
        if ($2) {
            state = 1;
            printf("\tHeat turned on\n");
        } else {
            state = 0;
            printf("\tHeat turned off\n");
        }
    }
    ;

get_temp:
    T_GET T_TEMPERATURE
    {
        printf("\tTemp is %d\n", temp);
    }

target_set:
    T_TARGET T_TEMPERATURE T_NUMBER
    {
        temp = $3;
        printf("\tTemperature set\n");
    }
    ;

