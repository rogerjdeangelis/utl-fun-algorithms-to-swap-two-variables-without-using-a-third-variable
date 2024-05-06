%let pgm=utl-fun-algorithms-to-swap-two-variables-without-using-a-third=variable;

Algorithms to swap two variables without using an additional variable

quoora
https://tinyurl.com/yh67wy5b
https://www.quora.com/How-do-I-write-an-algorithm-to-swap-two-variables-without-creating-the-third-variable?topAns=1477743705584495

  Three Solutions
     1 Quora only numeric
     2 SAS numeric   (SAS may be addional indirect addressing)
     3 SAS character
     4 sas fcmp swapn (uses third variable)
     5 sas fcmp swapc (uses third variable)

github
https://tinyurl.com/sy55p94a
https://github.com/rogerjdeangelis/utl-fun-algorithms-to-swap-two-variables-without-using-a-third-variable

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                         |                                             |                                                */
/*   INPUT                 |               PROCESS                       |  OUTPUT                                        */
/*                         |                                             |                                                */
/* 1 QUORA ONLY NUMERIC    |                                             |                                                */
/* ====================    |                                             |                                                */
/*                         |                                             |                                                */
/* data have;              |  data want;                                 |   A    B                                       */
/* a=1;                    |   set have;                                 |                                                */
/* b=2;                    |    a = a+b;                                 |   2    1                                       */
/* run;quit;               |    b = a-b;                                 |                                                */
/*                         |    a = a-b;                                 |                                                */
/*  A   B                  |  run;quit;                                  |                                                */
/*  1   2                  |                                             |                                                */
/*                         |                                             |                                                */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                         |                                             |                                                */
/* 2 SAS NUMERIC           |                                             |                                                */
/* =============           |                                             |                                                */
/*                         |  data want;                                 |   A    B                                       */
/*  A   B                  |   array ab[4]                               |                                                */
/*  1   2                  |     a b b a (1,2,1,2);                      |   2    1                                       */
/*                         |     ab[1]= ab[4];                           |                                                */
/*                         |     ab[2]= ab[3];                           |                                                */
/*                         |  run;quit;                                  |                                                */
/*                         |                                             |                                                */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                         |                                             |                                                */
/* 3 SAS CHARACTER         |                                             |                                                */
/* ===============         |                                             |                                                */
/*                         |  data want;                                 |     A      B                                   */
/*  A      B               |   array ab[4] $5                            |                                                */
/* JASON ROGER             |     a b b a                                 |   ROGER  JASON                                 */
/*                         |       ("JASON","ROGER","JASON","ROGER");    |                                                */
/*                         |   ab[1]= ab[4];                             |                                                */
/*                         |   ab[2]= ab[3];                             |                                                */
/*                         |  run;quit;                                  |                                                */
/*                         |                                             |                                                */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                         |                                             |                                                */
/* 4 SAS FCMP SWAPN        |                                             |                                                */
/*                         |                                             |    A    B                                      */
/*                         |  data want;                                 |                                                */
/*                         |    retain a 1 b 2;                          |    2    1                                      */
/*                         |    call swapn(a,b);                         |                                                */
/*                         |  run;quit;                                  |                                                */
/*                         |                                             |                                                */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                         |                                             |                                                */
/* 5 SAS FCMP SWAPC        |                                             |                                                */
/*                         |                                             |     A      B                                   */
/*                         |  data want;                                 |                                                */
/*                         |    retain a "JASON" b "ROGER";              |   ROGER  JASON                                 */
/*                         |    call swapc(a,b);                         |                                                */
/*                         |  run;quit;                                  |                                                */
/*                         |                                             |                                                */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                         |                                             |                                                */
/*                         |  FCMP SUBROUTINE                            |                                                */
/*                         |  ================                           |                                                */
/*                         |                                             |                                                */
/*                         |  options cmplib=work.functions;             |                                                */
/*                         |  proc fcmp                                  |                                                */
/*                         |   outlib=work.functions.swap;               |                                                */
/*                         |    subroutine swapn(a,b);                   |                                                */
/*                         |    outargs a, b;                            |                                                */
/*                         |        h = a; a = b; b = h;                 |                                                */
/*                         |    endsub;                                  |                                                */
/*                         |    subroutine swapc(a $,b $);               |                                                */
/*                         |    outargs a, b;                            |                                                */
/*                         |        h = a; a = b; b = h;                 |                                                */
/*                         |    endsub;                                  |                                                */
/*                         |  run;quit;                                  |                                                */
/*                         |                                             |                                                */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
