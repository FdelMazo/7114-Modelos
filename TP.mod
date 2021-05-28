set NAFTA;

var G{i in 1..5, j in NAFTA} >= 0;
var N{k in NAFTA} >= 0;

s.t. LIMITE1: G[1,'C'] + G[1,'S'] <= 2000;
s.t. LIMITE2: G[2,'C'] + G[2,'S'] <= 4000;
s.t. LIMITE3: G[3,'C'] + G[3,'S'] <= 4000;
s.t. LIMITE4: G[4,'C'] + G[4,'S'] <= 5000;
s.t. LIMITE5: G[5,'C'] + G[5,'S'] <= 3000;

s.t. LIMITE_SUPER: N['S'] >= 8000;

s.t. LIMITE_POTENCIA_COMUN: G[1,'C'] * 70 + G[2,'C'] * 80 + G[3,'C'] * 85 + G[4,'C'] * 90 + G[5,'C'] * 99 >= N['C'] * 85;
s.t. LIMITE_POTENCIA_SUPER: G[1,'S'] * 70 + G[2,'S'] * 80 + G[3,'S'] * 85 + G[4,'S'] * 90 + G[5,'S'] * 99 >= N['S'] * 95;

s.t. PRODUCCION{k in NAFTA}: N[k] = sum{i in 1..5} G[i, k];

maximize z: 2.85 * N['C'] + 3.75 * N['S'] - 0.8 * (G[1,'C'] + G[1,'S']) - 0.9 * (G[2,'C'] + G[2,'S']) - 0.95 * (G[3,'C'] + G[3,'S']) - 1.15 * (G[4,'C'] + G[4,'S']) - 2 * (G[5,'C'] + G[5,'S']);

data;

set NAFTA := 'C' 'S';
