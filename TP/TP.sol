Problem:    TP
Rows:       10
Columns:    12
Non-zeros:  46
Status:     OPTIMAL
Objective:  z = 32080 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 LIMITE1      NU          2000                        2000           0.7 
     2 LIMITE2      NU          4000                        4000           1.5 
     3 LIMITE3      NU          4000                        4000           1.9 
     4 LIMITE4      NU          5000                        5000          2.15 
     5 LIMITE5      NU          3000                        3000          2.11 
     6 LIMITE_POTENCIA_COMUN
                    NL             0            -0                       -0.09 
     7 LIMITE_POTENCIA_SUPER
                    NL             0            -0                       -0.09 
     8 PRODUCCION[C]
                    NS             0            -0             =          -4.8 
     9 PRODUCCION[S]
                    NS             0            -0             =          -4.8 
    10 z            B          32080                             

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 G[1,S]       B        234.483             0               
     2 G[1,C]       B        1765.52             0               
     3 G[2,S]       NL             0             0                       < eps
     4 G[2,C]       B           4000             0               
     5 G[3,S]       NL             0             0                       < eps
     6 G[3,C]       B           4000             0               
     7 G[4,S]       NL             0             0                       < eps
     8 G[4,C]       B           5000             0               
     9 G[5,S]       B        1465.52             0               
    10 G[5,C]       B        1534.48             0               
    11 N[C]         B          16300             0               
    12 N[S]         B           1700             0               

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 2.91e-11 on row 7
        max.rel.err = 7.39e-16 on row 1
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 3.55e-15 on column 10
        max.rel.err = 1.89e-16 on column 10
        High quality

KKT.DB: max.abs.err = 8.88e-16 on column 5
        max.rel.err = 8.88e-16 on column 5
        High quality

End of output
