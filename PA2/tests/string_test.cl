(*
String parsing tests for the lexer.
*)

(**)
(*
*)

(*
Any addition to these scenarios is
WARMLY
WELCOME
*)

--

class Main inherits IO {

   main() : Object {
    -- some simple, no-catch involved, strings
    str1 = "";
    str2 = "word";
    str3 = "multiple words";
    str4 = "this is almost a sentence";
    -- MAX_STR_CONST a's; should be accepted
    str5 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    -- MAX_STR_CONST + x, x > 0, characters; should be rejected and an error displayed
    str6 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    str7 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    -- escape character before b, n, t and/or f
    -- no catch sequences
    str8 = "\b";
    str9 = "\n";
    str10 = "\t";
    str11 = "\f";
    str12 = "\f\n\b\t";
    str13 = "Alternate \t words \f and \n special \b sequences";
    -- length < MAX_STR_CONST; should be accepted
    str14 = "\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n";
    -- length == MAX_STR_CONST; should be accepted
    str15 = "\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b";
    -- length > MAX_STR_CONST; should be rejected
    str16 = "\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t\f\n\b\t";
    -- backslash already escaped in special sequence strings
    str17 = "\\b";
    str18 = "\\n";
    str19 = "\\f";
    str20 = "\\t";
    str21 = "\\b\\n\\t\\f";
    str22 = "Nothing \\n actually \\b alternate \\t here \\t";
    -- length < MAX_STR_CONST; should be accepted
    str23 = "\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f";
    -- length == MAX_STR_CONST; should be accepted
    str24 = "\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\";
    -- length > MAX_STR_CONST; should be rejected
    str25 = "\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n\\t\\f\\b\\n";
    -- escape character before any other character (not b n t f)
    str26 = "\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ";
    str27 = "\0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ ";
    -- length <= MAX_STR_CONST; should be accepted
    str28 = "\0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\\0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\  \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p"; 
    -- length > MAX_STR_CONST; should be rejected
    str29 = "\0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\\0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\  \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\q\r\s\u\v\w\x\y\z\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z\!\"\#\$\%\&\\\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\ \0\1\2\3\4\5\6\7\8\9\a\c\d\e\g\h\i\j\k\l\m\o\p\r";
    -- escaped newline
    str30 = "\
";
    str31 = "\
\
\
\
\
";
    -- escaped quotes
    str32 = "\"";
    -- length <= MAX_STR_CONST; should be accepted
    str33 = "\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"";
    -- length > MAX_STR_CONST; should be rejected
    str34 = "\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"";
    -- unescaped newline
    str35 = "
";
    str36 = "
	Incorrect
	multiline
	string"
    str37 = "T
h
i
s
 
i
s
 
a
 
w
r
o
n
g

m
u
l
t
i
l
i
n
e

s
t
r
i
n
g";
    -- unescaped quotes
    str38 = "\""";
    str39 = "This is not how an escaped " should look like";
    -- combined issues
    str40 = "This is not how one escapes newline (
) and quote (") characters";
    str41 = "This is not how one escapes quote (") and newline (
) characters";
    str42 = "This is how one escapes newline (\
) and quote (\") characters";
*)
    str43 = "This is not how one escapes newline (
) and quote (\") characters";

(*
    str3 = "Correct Multiline\
string";
    str5 = "String containing \n newline special character";
    str6 = "\"\"\"\"\"\"";
    str7 = "\"\"\"\"\"\""";
    str8 = "\"\\\t\n\"\.";
    str9 = \"abcdefg\"";
    str10 = "anaaremere\n
    str11 = meneither";
    str12 = "Ana
are
mere";
    str13 = "";
    str14 = "\\";
    str15 = "\\\\";
    str16 = "\\\\\\\\\\";
    str4 = "Wrong
multiline
string";
    str17 = "\\\";
    str18 = \"\\\g\b";
    str19 = "\"\\\\\n\'\*\^"
*)
};

};
