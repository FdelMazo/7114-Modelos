## Situacion problemática

Se tienen distintos bancos en el mapa a los cuales tengo que visitar exactamente una vez
a cada uno, y en cada banco que visite tengo que recaudar/depositar dinero, siempre
teniendo en cuenta que no puedo pasarme de ciertos límites. 

Se trata de un problema de optimización parecido al del viajante. Por un
lado, quiero que la distancia recorrida sea la mínima posible, y por el otro quiero
siempre asegurarme que el dinero que recaude no se pase de un monto fijo.

\begin{tikzpicture}
  \graph { subgraph K_n [n=10,clockwise,radius=5cm] };
\end{tikzpicture}

## Objetivo

Determinar el camino a hacer para minimizar la distancia, teniendo en cuenta que nunca
podemos tener saldo negativo ni salgo que supere un monto definido, durante un recorrido
del día.

## Hipótesis y Supuestos

- Es negligible la distancia entre la central y el primer banco que visite (ya que no
  tengo el dato)
- Nunca me roban en todo el trayecto, ni pierdo dinero
- No hay limitantes no especificados
- Los montos preestablecidos no cambian
- Todas las distancias entre bancos son conocidas y fijas
- La ruta entre bancos es siempre la misma, sin variar su distancia
- El monto inicial es cero

## Constantes

$CANT_{BANCOS} \in \mathbb{N}:$ Cantidad de bancos a visitar.

$CAPACIDAD \in \mathbb{N}:$ Cuanto dinero puede transportar el camión.

$DISTANCIA_{i, j} \in \mathbb{N}:$ Distancia del banco $i$ al banco $j$.

$DEMANDA_{i} \in \mathbb{N}:$ Cuanto dinero entrega o recibe el banco $i$.

## Variables de decisión controlables

$$BANCOS \in \{1...CANT_{BANCOS}\}$$

$Y_{i, j} \in \{0, 1\}:$ Variable bivalente que indica si el recorrido incluye ir del banco $i$ al banco $j$.

$U_{i} \in \mathbb{N}:$ Número de secuencia del banco $i$ en el recorrido.

$P_{i} \in \mathbb{N}_0:$ Plata que tiene el camión al llegar al punto $i$.

\footnotesize Adicionalmente, por fuera de las variables, $M$ es una constante de valor muy grande y $m$ es una constante de valor muy pequeño. \normalsize

## Vinculaciones y Restricciones

Solo se visita una vez cada banco. 

$$\sum_{\substack{i = 1\\ j \ne i}}^{BANCOS} Y_{i,j} = 1 \quad \forall j \in BANCOS$$

$$\sum_{\substack{j = 1\\ j \ne i}}^{BANCOS} Y_{i,j} = 1 \quad \forall i \in BANCOS$$

Evitamos subtours.

$$\forall i,j \in BANCOS$$ $$U_{i} - U_{j} + CANT_{BANCOS} Y_{i,j} \le CANT_{BANCOS} - 1 $$

En todo momento debo tener dinero (esto es redundante por la condición de
no-negatividad pero lo escribimos igual) y este dinero no debe superar la capacidad de
mi camión.

$$\forall i \in BANCOS$$ $$0 \leq P_{i} \leq CAPACIDAD$$

Vinculo la variable de dinero con la diferencia de demandas entre cada par de bancos.

$$\forall i,j \in BANCOS$$ $$-M * (1 - Y_{i,j}) + DEMANDA_j \leq P_j - P_i \leq DEMANDA_i
+ M * (1 - Y_{i,j})$$


## Función Objetivo

$$Min \: Z = \mathop{\sum\sum}_{\substack{i = 1 j = 1 \\ i \ne j}}^{BANCOS} Y_{i,j} * DISTANCIA_{i,j}$$

