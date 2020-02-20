/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;
int string_buf_len;

int nested_mline_comms;

#define DEBUG 0

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */

%}

/*
 * Define names for regular expressions here.
 */

DARROW               =>
/*
 * Keywords
 */
CLASS_KW             [C|c][L|l][A|a][S|s]{2}
ELSE_KW              [E|e][L|l][S|s][E|e]
FI_KW                [F|f][I|i]
IF_KW                [I|i][F|f]
IN_KW                [I|i][N|n]
INHERITS_KW          [I|i][N|n][H|h][E|e][R|r][I|i][T|t][S|s]
ISVOID_KW            [I|i][S|s][V|v][O|o][I|i][D|d]
LET_KW               [L|l][E|e][T|t]
LOOP_KW              [L|l][O|o]{2}[P|p]
POOL_KW              [P|p][O|o]{2}[L|l]
THEN_KW              [T|t][H|h][E|e][N|n]
WHILE_KW             [W|w][H|h][I|i][L|l][E|e]
CASE_KW              [C|c][A|a][S|s][E|e]
ESAC_KW              [E|e][S|s][A|a][C|c]
NEW_KW               [N|n][E|e][W|w]
OF_KW                [O|o][F|f]
NOT_KW               [N|n][O|o][T|t]
TRUE_KW              t[R|r][U|u][E|e]
FALSE_KW             f[A|a][L|l][S|s][E|e]
BOOLEAN              {TRUE_KW}|{FALSE_KW}
/*
 * Operators
 */
PLUS_OP              \+
MINUS_OP             -
MUL_OP               \*
DIV_OP               \/
NEG_OP               ~
LT_CMP_OP            <
LTE_CMP_OP           <=
EQUAL_OP             =
ASSIGN_OP            <-
/*
 * Brackets
 */
ROUND_BRACKET_OPEN   \(
ROUND_BRACKET_CLOSED \)
CURLY_BRACKET_OPEN   \{
CURLY_BRACKET_CLOSED \}
/*
 * Misc symbols
 */
AT_SIGN              @
SEMICOLON            ;
COLON                :
COMMA                ,
DOT                  \.
/*
 * Whitespace characters
 */
CARRIAGE_RETURN      \r
FORMFEED             \f
HORIZONTAL_TAB       \t
VERTICAL_TAB         \v
NEWLINE              \n
SPACE                [ ]
/*
 * String definition
 */
NULL                 \0
/*
 * Regex for strings (does not make use of start conditions)
 * !!! DO NOT MODIFY !!!
 * STRING              {EMPTY_STRING}|\"({ESCAPED_QUOTE}|\\(\\\\)*[^\\\"]|(\\\\)*|[^\\\"])*\"
 */
STR_START            \"
STR_ACC_ESC_CHAR     \\[^\0]
STR_ACC_UNESC_CHAR   [^\0\\\"\n]
STR_END              \"
%x                   string
%x                   string_error_detected
/*
 * Integer definition
 */
INTEGER              0|[1-9][0-9]*
/*
 * Identifier definition
 */
TYPE_IDENTIFIER      [A-Z][0-9a-zA-Z_]*|SELF_TYPE
OBJ_IDENTIFIER       [a-z][0-9a-zA-Z_]*|self
/*
 * Comments
 */
SLINECOMM_START      --
SLINECOMM_END        \n
MLINECOMM_START      \(\*
MLINECOMM_END        \*\)
%x                   slinecomm
%x                   mlinecomm
/*
 * Any invalid character is dealt with here
 */
DEFAULT              .

%%


{CLASS_KW}              { 
			  if (DEBUG) {
			    printf("|Class:%s|\n", yytext);
			  }
			  return CLASS;
			}
{ELSE_KW}               {
			  if (DEBUG) {
			    printf("|Else:%s|\n", yytext);
			  }
			  return ELSE;
			}
{FI_KW}                 {
			  if (DEBUG) {
			    printf("|Fi:%s|\n", yytext);
			  }
			  return FI;
			}
{IF_KW}                 {
			  if (DEBUG) {
			    printf("|If:%s|\n", yytext);
			  }
			  return IF;
			}
{IN_KW}                 {
			  if (DEBUG) {
			    printf("|In:%s|\n", yytext);
			  }
			  return IN;
			}
{INHERITS_KW}           {
			  if (DEBUG) {
			    printf("|Inherits:%s|\n", yytext);
			  }
			  return INHERITS;
			}
{LET_KW}                {
			  if (DEBUG) {
			    printf("|Let:%s|\n", yytext);
			  }
			  return LET;
			}
{LOOP_KW}               {
			  if (DEBUG) {
			    printf("|Loop:%s|\n", yytext);
			  }
			  return LOOP;
			}
{POOL_KW}               {
			  if (DEBUG) {
			    printf("|Pool:%s|\n", yytext);
			  }
			  return POOL;
			}
{THEN_KW}               {
			  if (DEBUG) {
			    printf("|Then:%s|\n", yytext);
			  }
			  return THEN;
			}
{WHILE_KW}              {
			  if (DEBUG) {
			    printf("|While:%s|\n", yytext);
			  }
			  return WHILE;
			}
{CASE_KW}               {
			  if (DEBUG) {
			    printf("|Case:%s|\n", yytext);
			  }
			  return CASE;
			}
{ESAC_KW}               {
			  if (DEBUG) {
			    printf("|Esac:%s|\n", yytext);
			  }
			  return ESAC;
			}
{OF_KW}                 {
			  if (DEBUG) {
			    printf("|Of:%s|\n", yytext);
			  }
			  return OF;
			}
{DARROW}                {
			  if (DEBUG) {
			    printf("|Darrow:%s|\n", yytext);
			  }
			  return DARROW;
			}
{NEW_KW}                {
			  if (DEBUG) {
			    printf("|New:%s|\n", yytext);
			  }
			  return NEW;
			}
{ISVOID_KW}             {
			  if (DEBUG) {
			    printf("|Isvoid:%s|\n", yytext);
			  }
			  return ISVOID;
			}
{NOT_KW}                {
			  if (DEBUG) {
			    printf("|Not operator:%s|\n", yytext);
			  }
			  return NOT;
			}
{STR_START}             {
			  string_buf_len = 0;
			  BEGIN(string);
			}
<string>{NEWLINE}       {
			  if (DEBUG) {
			    printf("Unterminated string constant\n");
			  }
			  cool_yylval.error_msg = strdup("Unterminated string constant");
			  ++curr_lineno;
			  BEGIN(INITIAL);
			  return ERROR;
			}
<string>{NULL}          {
			  if (DEBUG) {
			    printf("String contains null character\n");
			  }
			  cool_yylval.error_msg = strdup("String contains null character");
			  BEGIN(string_error_detected);
			  return ERROR;
			}
<string><<EOF>>         {
			  if (DEBUG) {
			    printf("EOF in string constant\n");
			  }
			  cool_yylval.error_msg = strdup("EOF in string constant");
			  BEGIN(INITIAL);
			  return ERROR;
			}
<string>{STR_ACC_ESC_CHAR} {
			  if (string_buf_len >= MAX_STR_CONST) {
			    if (DEBUG) {
			      printf("String constant too long\n");
			    }
			    cool_yylval.error_msg = strdup("String constant too long");
			    BEGIN(string_error_detected);
			    return ERROR;
			  }
			  switch (yytext[1]) {
			    case 'b':
			      string_buf[string_buf_len++] = '\b';
			      break;
			    case 'f':
			      string_buf[string_buf_len++] = '\f';
			      break;
			    case 'n':
			      string_buf[string_buf_len++] = '\n';
			      break;
			    case 't':
			      string_buf[string_buf_len++] = '\t';
			      break;
			    default:
			      string_buf[string_buf_len++] = yytext[1];
			      if (yytext[1] == '\n') {
				++curr_lineno;
			      }
			      break;
			  }
			}
<string>{STR_ACC_UNESC_CHAR} {
			  if (string_buf_len >= MAX_STR_CONST) {
			    if (DEBUG) {
			      printf("String constant too long\n");
			    }
			    cool_yylval.error_msg = strdup("String constant too long");
			    BEGIN(string_error_detected);
			    return ERROR;
			  }
			  string_buf[string_buf_len++] = yytext[0];
			}
<string>{STR_END}       {
			  if (DEBUG) {
			    if (string_buf_len > 0) {
			      int i = 0;
			      for (i = 0; i < string_buf_len - 1; ++i) {
			        printf("%d_", string_buf[i]);
			      }
			      printf("%d\n", string_buf[string_buf_len - 1]);
			    } else {
			      printf("Empty string\n");
			    }
			  }

			  cool_yylval.symbol = stringtable.add_string(string_buf, string_buf_len);
			  BEGIN(INITIAL);
			  return STR_CONST;
			}
<string_error_detected>[^\\\"\n][\"\n] {
			  /* string end: either
                           * - unescaped \"
                           * or
                           * - unescaped \n
                           */
			  if (DEBUG) {
			    printf("In str err detected: found end of the string\n");
			  }
			  if (yytext[1] == '\n') {
			    ++curr_lineno;
			  }
			  BEGIN(INITIAL);
			}
<string_error_detected>\\[\"\n] {
			  /* eat out any escaped newline or escaped quote  */
			  if (yytext[1] == '\n') {
			    ++curr_lineno;
			  }
			  if (DEBUG) {
			    printf("In str err detected: escaped newline or escaped quote\n");
			  }
			}
<string_error_detected>[\"\n] {
			  /*
			   * should reach this only if the character at position
			   * MAX_STR_CONST in string_buf (hypothetically) is either
			   * an unescaped newline or unescaped quote, both of which
			   * imply the end of the string
			   */
			  if (DEBUG) {
			    printf("In str err detected: found end of the string\n");
			  }
			  if (yytext[0] == '\n') {
			    ++curr_lineno;
			  }
			  BEGIN(INITIAL);
			}
<string_error_detected>[^\n\"] {
			  /* eat out any other character */
			  if (DEBUG) {
			    printf("In str err detected: newline not accepted: %s\n", yytext);
			  }
			}
{INTEGER}               {
			  if (DEBUG) {
			    printf("|Integer:%s|\n", yytext);
			  }
			  cool_yylval.symbol = inttable.add_string(yytext, yyleng);
			  return INT_CONST;
			}
{BOOLEAN}               {
			  if (DEBUG) {
			    printf("|Boolean:%s|\n", yytext);
			  }
			  /* true = 1    false = 0 */
			  cool_yylval.boolean = (yyleng - 4 == 0) ? 1 : 0;
			  return BOOL_CONST;
			}
{TYPE_IDENTIFIER}       {
			  if (DEBUG) {
			    printf("|Type identifier:%s|\n", yytext);
			  }
			  cool_yylval.symbol = idtable.add_string(yytext, yyleng);
			  return TYPEID;
			}
{OBJ_IDENTIFIER}        {
			  if (DEBUG) {
			    printf("|Object identifier:%s|\n", yytext);
			  }
			  cool_yylval.symbol = idtable.add_string(yytext, yyleng);
			  return OBJECTID;
			}
{ASSIGN_OP}             {
			  if (DEBUG) {
			    printf("|Assign Operator:%s|\n", yytext);
			  }
			  return ASSIGN;
			}
{LTE_CMP_OP}            {
			  if (DEBUG) {
			    printf("|Less or equal comp:%s|\n", yytext);
			  }
			  return LE;
			}
{NULL}                  {
			  if (DEBUG) {
			    printf("|Null:%s|\n", yytext);
			  }
			  return 0;
			}
{HORIZONTAL_TAB}        {
			  if (DEBUG) {
			    printf("|Horizontal tab:%s|\n", yytext);
			  }
			}
{NEWLINE}               {
			  if (DEBUG) {
			    printf("|Newline:%s|\n", yytext);
			  }
			  ++curr_lineno;
			}
{VERTICAL_TAB}          {
			  if (DEBUG) {
			    printf("|Vertical tab:%s|\n", yytext);
			  }
			}
{FORMFEED}              {
			  if (DEBUG) {
			    printf("|Formfeed:%s|\n", yytext);
			  }
			}
{CARRIAGE_RETURN}       {
			  if (DEBUG) {
			    printf("|Carriage return:%s|\n", yytext);
			  }
			}
{SPACE}                 {
			  if (DEBUG) {
			    printf("|Whitespace:%s|\n", yytext);
			  }
			}
{PLUS_OP}               {
			  if (DEBUG) {
			    printf("|Plus Operator:%s|\n", yytext);
			  }
			  return 43;
			}
{MINUS_OP}              {
			  if (DEBUG) {
			    printf("|Minus Operator:%s|\n", yytext);
			  }
			  return 45;
			}
{MUL_OP}                {
			  if (DEBUG) {
			    printf("|Multiply Operator:%s|\n", yytext);
			  }
			  return 42;
			}
{DIV_OP}                {
			  if (DEBUG) {
			    printf("|Division Operator:%s|\n", yytext);
			  }
			  return 47;
			}
{NEG_OP}                {
			  if (DEBUG) {
			    printf("|Negation Operator:%s|\n", yytext);
			  }
			  return 126;
			}
{LT_CMP_OP}             {
			  if (DEBUG) {
			    printf("|Less than Operator:%s|\n", yytext);
			  }
			  return 60;
			}
{EQUAL_OP}              {
			  if (DEBUG) {
			    printf("|Equal Operator:%s|\n", yytext);
			  }
			  return 61;
			}
{ROUND_BRACKET_OPEN}    {
			  if (DEBUG) {
			    printf("|Round bracket open:%s|\n", yytext);
			  }
			  return 40;
			}
{ROUND_BRACKET_CLOSED}  {
			  if (DEBUG) {
			    printf("|Round bracket closed:%s|\n", yytext);
			  }
			  return 41;
			}
{CURLY_BRACKET_OPEN}    {
			  if (DEBUG) {
			    printf("|Curly bracket open:%s|\n", yytext);
			  }
			  return 123;
			}
{CURLY_BRACKET_CLOSED}  {
			  if (DEBUG) {
			    printf("|Curly bracket closed:%s|\n", yytext);
			  }
			  return 125;
			}
{AT_SIGN}               {
			  if (DEBUG) {
			    printf("|At sign:%s|\n", yytext);
			  }
			  return 64;
			}
{SEMICOLON}             {
			  if (DEBUG) {
			    printf("|Semicolon:%s|\n", yytext);
			  }
			  return 59;
			}
{COLON}                 {
			  if (DEBUG) {
			    printf("|Colon:%s|\n", yytext);
			  }
			  return 58;
			}
{COMMA}                 {
			  if (DEBUG) {
			    printf("|Comma:%s|\n", yytext);
			  }
			  return 44;
			}
{DOT}                   {
			  if (DEBUG) {
			    printf("|Dot:%s|\n", yytext);
			  }
			  return 46;
			}
{SLINECOMM_START}       {
			  BEGIN(slinecomm);
			}
<slinecomm>{SLINECOMM_END}  {
			  ++curr_lineno;
			  BEGIN(INITIAL);
			}
<slinecomm>.            {
			  /* simply consume single line comments characters */
			}
<slinecomm><<EOF>>      {
			  cool_yylval.error_msg = strdup("EOF in comment");
			  BEGIN(INITIAL);
			  return ERROR;
			}
{MLINECOMM_START}       {
			  nested_mline_comms = 0;
			  BEGIN(mlinecomm);
			}
<mlinecomm>{MLINECOMM_START} {
			  ++nested_mline_comms;
			  if (DEBUG) {
			    printf("%d nested multiline comments\n", nested_mline_comms);
			  }
			}
<mlinecomm>{MLINECOMM_END}  {
			  if (nested_mline_comms == 0) {
			    BEGIN(INITIAL);
			  }
			  else {
			    --nested_mline_comms;
			    if (DEBUG) {
			      printf("%d nested multiline comments\n", nested_mline_comms);
			    }
			  }
			}
<mlinecomm>.            {
			  /* simply consume multiline comments characters */
			}
<mlinecomm>\n           {
			  ++curr_lineno;
			}
<mlinecomm><<EOF>>      {
			  if (DEBUG) {
			    printf("EOF in multi line comment.\n");
			  }
			  cool_yylval.error_msg = strdup("EOF in comment");
			  BEGIN(INITIAL);
			  return ERROR;
			}
{MLINECOMM_END}         {
			  if (DEBUG) {
			    printf("Unmatched *)\n");
			  }
			  cool_yylval.error_msg = strdup("Unmatched *)");
			  return ERROR;
			}
<<EOF>>                 {
			  if (DEBUG) {
			    printf("|Reached EOF\n");
			  }
			  yyterminate();
			}
{DEFAULT}               {
			  if (DEBUG) {
			    printf("|Invalid character:%s|\n", yytext);
			  }
			  cool_yylval.error_msg = (char *)malloc(2);
			  cool_yylval.error_msg[0] = yytext[0];
			  cool_yylval.error_msg[1] = '\0';
			  return ERROR;
			}

%%
