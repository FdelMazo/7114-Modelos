---
geometry: "a4paper, left=3cm,right=3cm,top=3cm,bottom=3cm, headsep=1.5cm"
header-includes: |
  \usepackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhead[L]{[71.14] Modelos y Optimización I \\ }
  \fancyhead[R]{Federico del Mazo \\ 100029}
---

<!-- \usepackage{pdfpages} -->
<!-- \includepdf{enunciado.pdf} -->

# Parcial X / Ejercicio Z

## Situacion problemática

Se trata de un problema de XXX, donde hay que tener en cuenta XXX.

-Grafiquito-

## Objetivo

Determinar XXX para maximizar/minimizar XXX, teniendo en cuenta XXX, durante XXX.

## Hipótesis y Supuestos

- Todo lo que se produce se vende
- Todos los parametros del modelo son constantes conocidas
- No hay limitantes no especificados
- No hay inflación ni varían los precios o costos
- No se producen productos fallados
- No se compran componentes fallados
- No hay desperdicio de recursos al fabricar
- XXX

## Variables de decisión controlables

$$PRODUCTOS = \{ A, B, C \} $$
$$XXX = \{ XXX \} $$

\footnotesize Adicionalmente, por fuera de las variables, $M$ es una constante de valor muy grande y $m$ es una constante de valor muy pequeño (casi cero). \normalsize

### Productos

$P_{p} \in \mathbb{N}_0 \quad (p \in PRODUCTOS) \quad [u_{producto}]:$ Cantidad de unidades del producto $p$ a producir
$XXX \in \mathbb{N}_0 \quad (XXX \in XXX) \quad [XXX]:$ XXX

## Vinculaciones y Restricciones

### Producción

$$P_{\eta} = P_{\eta, A}$$
$$P_{\eta} = P_{\eta, B}$$
$$P_{\eta} = P_{\eta, C}$$

## Función Objetivo

$$Gancias = XXX$$
$$Costos = XXX $$

$$Max \: Z = Ganancias - Costos$$
