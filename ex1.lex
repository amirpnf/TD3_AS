%{
#include <stdio.h>
%}
%option noinput
%option nounput
%option noyywrap

SEPARATOR [\t\n\r ]
%%
[\t\n\r ] ;
[A-Za-z_][A-Za-z_1-9]*/{SEPARATOR}*\( {
    printf("%s\n", yytext);
}
. ;
%%

/*The reason why the printed function names do not include the opening
*parenthesis is because of the way the printf function is used. The printf
* function is called with yytext as its argument, which means it will print
* out the text that was matched by the regular expression. However, the
* matched text does not include the opening parenthesis. This is because
* the \( part of the regular expression is outside of the capturing group
* defined by the * quantifier. Therefore, the opening parenthesis is not
* included in yytext, and is not printed out by the printf function.

* In other words, the \( in the regular expression is used to ensure that
* the match stops at the opening parenthesis of the function declaration,
*  but it is not included in the matched text that is printed out. This is
*  why you see the function names printed without the opening parenthesis.

* This behavior is consistent with how regular expressions work in general.
* In a regular expression, a capturing group is a part of the pattern enclosed
* in parentheses (). The part of the input string that matches the capturing 
* group is saved for later use, such as for use in the replacement text of a
* replace operation, or for retrieval by the printf function in this case. 
* In your regular expression, there is no capturing group defined, so the
* entire matched text is used. This matched text does not include the \(, 
* as explained above.
*/

int main(void) {
    yylex();
    return 0;
}
