## Ideas de la segunda entrega

- El problema de la solución actual no es tanto el algoritmo para una ciudad en
  particular, si no la elección de la ciudad de origen. Lo que haciamos en la primera
  instancia del problema era iterar todas las ciudades, correr el algoritmo para cada
  una, y elegir la que mejor score dé.

- La solución actual, en la instancia nueva, corre en 1 minuto y medio por cada ciudad 
  de origen, lo cual no esta nada mal. Pero al ser casi 10 mil ciudades para probar, 
  termina siendo una solución que corre en más de 200 horas en total, lo cual son casi
  10 días de cómputo.

- Entonces, en vez de correr el algoritmo para todas las ciudades con fuerza bruta,
  simplemente lo corro para una, ya que la diferencia cambiando la ciudad de inicio es
  mínima (pensar que el algoritmo es determinístico para cada paso a tomar, entonces
  cambiar la ciudad de inicio solo podría, a lo sumo, minimizarnos un viaje en todo el
  recorrido).

- Para no volvernos locos y confirmar que el programa esta corriendo, agregamos la
  libreria [`tqdm`](https://github.com/tqdm/tqdm) que nos proporciona una linda barra de
  progreso para ir trackeando el avance en cada paso.

- Una optimización que se intentó agregar es la de pre-filtrar las ciudades a las que ya
  se que no puedo ir desde mi ciudad actual, viendo la demanda de plata que traen. Sin 
  embargo, después de varios intentos y corridas se descartó, porque el pre-filtrado
  terminó siendo más lento que el ordenamiento directo de las ciudades. De todas formas
  esto sería una optimización sobre el tiempo de ejecución, y no sobre la solución en
  si, por lo que no es necesaria.
