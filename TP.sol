Problem:    TP
Rows:       11
Columns:    12
Non-zeros:  47
Status:     UNDEFINED
Objective:  z = 0 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 LIMITE1      B              0                        2000 
     2 LIMITE2      B              0                        4000 
     3 LIMITE3      B              0                        4000 
     4 LIMITE4      B              0                        5000 
     5 LIMITE5      B              0                        3000 
     6 LIMITE_SUPER B              0          8000               
     7 LIMITE_POTENCIA_COMUN
                    B              0            -0               
     8 LIMITE_POTENCIA_SUPER
                    B              0            -0               
     9 PRODUCCION[C]
                    B              0            -0             = 
    10 PRODUCCION[S]
                    B              0            -0             = 
    11 z            B              0                             

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 G[1,S]       NL             0             0                       < eps
     2 G[1,C]       NL             0             0                       < eps
     3 G[2,S]       NL             0             0                       < eps
     4 G[2,C]       NL             0             0                       < eps
     5 G[3,S]       NL             0             0                       < eps
     6 G[3,C]       NL             0             0                       < eps
     7 G[4,S]       NL             0             0                       < eps
     8 G[4,C]       NL             0             0                       < eps
     9 G[5,S]       NL             0             0                       < eps
    10 G[5,C]       NL             0             0                       < eps
    11 N[S]         NL             0             0                       < eps
    12 N[C]         NL             0             0                       < eps

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 8.00e+03 on row 6
        max.rel.err = 1.00e+00 on row 6
        PRIMAL SOLUTION IS INFEASIBLE

KKT.DE: max.abs.err = 3.75e+00 on column 11
        max.rel.err = 7.89e-01 on column 11
        DUAL SOLUTION IS WRONG

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
