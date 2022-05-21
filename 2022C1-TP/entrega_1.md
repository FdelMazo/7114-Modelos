\newpage

## Ideas de la primera entrega

- Vamos a solucionarlo de manera greedy. Armo una matriz de distancias que me diga cuan
  alejado estoy de cada ciudad. Partiendo de la ciudad de origen voy a la que sea mas
  cercana, de ahí a la más cercana, etc.

- Como todavía el problema es de pocos elementos, puedo darme el lujo de no elegir
  ciudad de origen. Simplemente hago fuerza bruta. Parto de todas las ciudades (con
  demanda positiva), aplico mi solucionador de tsp greedy, y después me quedo con el que
  mejor (menor) score tenga.

- El único cambio introducido es que me confundi y no permití tener demanda = 0 ni 
  demanda = capacidad, algo que en el problema si se puede. Ironicamente tuve peor 
  resultado con este cambio, pero lo mantengo porque si no el modelo no sería correcto.
