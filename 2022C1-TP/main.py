import pandas as pd
from scipy.spatial import distance_matrix
import json
from tqdm.auto import trange

CONFIG = json.load(open("datos_3.json"))

ciudades = CONFIG["NODE_COORD_SECTION"]
demandas = CONFIG["DEMANDAS"]
capacidad = CONFIG["CAPACIDAD"]

df = pd.DataFrame(ciudades.values(), index=ciudades.keys())

distancias = pd.DataFrame(distance_matrix(df.values, df.values),
                          index=df.index,
                          columns=df.index)


def tsp(c):
    camino = [c]
    # plata = demandas[c]["demanda"]
    distancia_recorrida = 0
    visited = {c}
    for i in trange(len(ciudades) - 1, leave=False):
        distancias_a_ciudad = distancias.loc[camino[-1]]
        distancias_a_ciudad = distancias_a_ciudad[~distancias_a_ciudad.index.
                                                  isin(visited)].sort_values()

        nextc = distancias_a_ciudad[[0]].index[0]
        distancia = distancias_a_ciudad[[0]].values[0]
        # nextc, distancia = distancias_a_ciudad[[0]]

        # for (nextc, distancia) in distancias_a_ciudad.iteritems():
        # demanda = demandas[nextc]["demanda"]
        # if plata + demanda >= 0 and plata + demanda <= capacidad:
        #     break

        # plata += demanda
        distancia_recorrida += distancia
        camino.append(nextc)
        visited.add(nextc)

    return {
        "path": " ".join(camino),
        "score": distancia_recorrida,
        "source": c
    }


def check_sol(sol):
    plata = 0
    for c in sol["path"].split():
        plata += demandas[c]["demanda"]
        if plata < 0 or plata > capacidad:
            raise Exception(f"Falla en {c}")


# ciudades_positivas = [c for c in ciudades if demandas[c]["demanda"] >= 0]
# source = min(ciudades_positivas, key=lambda c: demandas[c]["demanda"])
source = '1'
sol = tsp(source)
# check_sol(sol)
print(sol["path"])
