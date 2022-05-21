import pandas as pd
from scipy.spatial import distance_matrix
import json
from tqdm.auto import tqdm, trange

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
    for i in trange(len(ciudades) - 1, leave=False):
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


ciudades_positivas = [c for c in ciudades if demandas[c]["demanda"] >= 0]
tsps = []
for c in tqdm(ciudades_positivas):
    tsps.append(tsp(c))
    
sol = min(tsps, key=lambda x: x["score"])
check_sol(sol)
print(sol["path"])
