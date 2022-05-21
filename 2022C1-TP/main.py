import pandas as pd
from scipy.spatial import distance_matrix
import json

CONFIG = json.load(open("datos_1.json"))

ciudades = CONFIG["NODE_COORD_SECTION"]
demandas = CONFIG["DEMANDAS"]
capacidad = CONFIG["CAPACIDAD"]

df = pd.DataFrame(ciudades.values(), index=ciudades.keys())

distancias = pd.DataFrame(
    distance_matrix(df.values, df.values), index=df.index, columns=df.index
)


def tsp(c):
    camino = [c]
    plata = demandas[c]["demanda"]
    distancia_recorrida = 0
    visited = {c}
    while len(visited) < len(ciudades):
        distancias_a_ciudad = distancias.loc[camino[-1]]
        distancias_a_ciudad = distancias_a_ciudad[
            ~distancias_a_ciudad.index.isin(visited)
        ].sort_values()
        for (nextc, distancia) in distancias_a_ciudad.iteritems():
            demanda = demandas[nextc]["demanda"]
            if plata + demanda >= 0 and plata + demanda <= capacidad:
                break

        plata += demanda
        distancia_recorrida += distancia
        camino.append(nextc)
        visited.add(nextc)

    return {"path": " ".join(camino), "score": distancia_recorrida, "source": c}


def check_sol(sol):
    plata = 0
    for c in sol["path"].split():
        plata += demandas[c]["demanda"]
        if plata < 0 or plata > capacidad:
            raise Exception(f"Falla en {c}")


sol = min(
    [tsp(c) for c in ciudades if demandas[c]["demanda"] > 0],
    key=lambda x: x["score"],
)
check_sol(sol)
print(sol["path"])
