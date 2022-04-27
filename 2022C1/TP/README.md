## Situacion problemática

Se tienen distintos bancos en el mapa a los cuales tengo que visitar exactamente una vez
a cada uno, y en cada banco que visite tengo que recaudar/depositar dinero, siempre
teniendo en cuenta que no puedo pasarme de ciertos límites. 

Se trata de un problema de optimización tanto del viajante como de la móchila. Por un
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
