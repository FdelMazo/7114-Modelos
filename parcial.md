# Parcial 12 - 06 - 2021

## Situacion problemática

Se trata de un problema de producción con armado y recursos limitantes, donde hay que tener en cuenta de que lotes se adquieren los componentes, como se paga por estos lotes y hay que cumplir con la demanda mínima de cada uno de los productos producidos.

## Objetivo

Determinar la cantidad de productos de cada tipo a producir y su composición para maximizar las ganancias, teniendo en cuenta los costos de la adquisicion de los materiales, en el mes de octubre.

## Hipótesis y Supuestos

### Certeza

- Todo lo que se produce se vende
- Todos los parametros del modelo son constantes conocidas
- No hay stock inicial de componentes

### Proporcionalidad

- El consumo de los componentes es directamente proporcional a la cantidad producida

### Aditividad

- No hay inflación ni varían los precios o costos
- No se producen productos fallados
- No se compran componentes fallados
- No hay desperdicio de recursos al fabricar
- Todos los recursos no mencionados no son limitantes

## Variables de decisión controlables

$$PRODUCTOS = \{ \eta, \iota, \rho \} $$
$$COMPONENTES = \{ A, B, C \} $$
$$LOTES = \{ 1, 2, 3 \} $$
$$MESES = \{ Oct, Nov \} $$

### Productos

$P_{p} \in \mathbb{N}_0 \quad (p \in PRODUCTOS) \quad [u_{producto}]:$ Cantidad de unidades del producto $p$ a producir

$P_{p,c} \in \mathbb{N}_0 \quad (p \in PRODUCTOS \wedge c \in COMPONENTES) \quad [u_{componente}]:$ Cantidad de unidades del componente $c$ destinado a producir productos $p$

$Y_{\eta, 120} \in \{ 0, 1\}:$ Indica que se han producido más de 120 productos del tipo $\eta$

$P_{1, 120} \in \mathbb{N}_0 \quad [u_{producto}]:$ Las primeras 120 unidades a producir del producto $\eta$

$P_{\eta, +120} \in \mathbb{N}_0 \quad [u_{producto}]:$ Las unidades después de las primeras 120 a producir del producto $\eta$

### Lotes

$L_{i} \in \mathbb{N}_0 \quad (i \in LOTES ) \quad [u_{lote}]:$ Cantidad de unidades a comprar del lote $i$

$L_{i, m} \in \mathbb{N}_0 \quad (i \in LOTES \wedge m \in MESES) \quad [u_{lote}]:$ Cantidad de unidades a comprar del lote $i$ con dinero destinado al presupuesto del mes $m$

$Y_{25} \in \{ 0, 1\}:$ Indica que se han comprado más de 25 lotes del tipo 2

$X_3 \in \mathbb{N}_0:$ Cantidad de lotes de tipo 3 que salen gratis

### Componentes

$A_{i, c} \in \mathbb{N}_0 \quad (i \in LOTES \wedge c \in COMPONENTES) \quad [u_{componente}]:$ Cantidad de unidades del componente $c$ adquirida de la compra de lotes $i$

## Vinculaciones y Restricciones

### Producción

$$P_{\eta} = P_{\eta, A}$$
$$P_{\eta} = P_{\eta, B}$$
$$P_{\eta} = P_{\eta, C}$$

$$P_{\iota} = P_{\iota, A}$$
$$2 * P_{\iota} = P_{\iota, B}$$

$$2 * P_{\rho} = P_{\rho, C}$$
$$P_{\rho} = P_{\rho, A} + P_{\rho, B}$$

### Vincular variables de las primeras 120 y siguientes 120 unidades de $\eta$

$$Y_{\eta, 120} * 120 \leq P_{\eta, 120} \leq 120$$
$$P_{\eta, +120} \leq Y_{\eta, 120} * M$$
$$P_{\eta} = P_{\eta, 120} + P_{\eta, +120}$$

### Restriccion de demanda minima

$$P_{\eta} \leq E1$$
$$P_{\iota} \leq I1$$
$$P_{\rho} \leq R1$$

### Compra de lotes

$$L_{1} = 0.4 * L_{1, Oct} + 0.6 * L_{1, Nov}$$
$$L_{2} = L_{2, Nov}$$
$$L_{3} = 0.5 * L_{3, Oct} + 0.5 * L_{3, Nov}$$

### No se puede superar el presupuesto de cada mes

$$0.4 * \$UNO * L_{1, Oct} +  0.5 * \$TRES * L_{3, Oct} \leq \$OCTUBRE$$
$$0.6 * \$UNO * L_{1, Nov} +  \$DOS * L_{2, Nov} +  0.5 * \$TRES * L_{3, Nov} \leq \$NOVIEMBRE$$

### Composicion de lotes

$$20 * L_1 = A_{1, A}$$
$$40 * L_1 = A_{1, C}$$

$$25 * L_2 = A_{2, A}$$
$$25 * L_2 = A_{2, B}$$
$$25 * L_2 = A_{2, C}$$

$$20 * L_3 = A_{3, B}$$
$$45 * L_3 = A_{3, C}$$

### No se pueden utilizar más componentes que los adquiridos

$$P_{\eta, A} + P_{\iota, A} + P_{\rho, A} \leq A_{1, A} + A_{2, A}$$
$$P_{\eta, B} + P_{\iota, B} + P_{\rho, B} \leq A_{2, B} + A_{3, B}$$
$$P_{\eta, C} + P_{\rho, C} \leq A_{1, C} + A_{2, C} + A_{3, C}$$

### Por cada 12 lotes de tipo 3, uno sale gratis

> Recordando que $X_3$ es entera, por definición
> $$X_3 \leq \frac{L_3}{12}$$

### Indicar si se compran mas de 25 lotes del tipo 2

$$25 * Y_{25} \leq L_2 \leq 24 + M * Y_{25}$$

## Función Objetivo

$$Gancias = \$\eta_1 * P_{\eta, 120} + \$\eta_2 * P_{\eta, +120} + \$\iota * P_{\iota} + \$\rho * P_{\rho}$$

$$Costos = L_1 * \$UNO + (1 - Y_{25}) * L_2 * \$DOS + L_2 * Y_{25} * 0.9 * \$DOS + (L_3 - X_3)* \$TRES $$

$$Max \: Z = Ganancias - Costos$$

## Extensión del enunciado

### No se pueden comprar mas de 39 lotes de tipo 1

$$L_{1}  \leq 39$$

### Indicar si se compran exactamente 39 lotes

$Y_{39} \in \{ 0, 1\}:$ Indica que se han comprado exactamente 39 lotes del tipo 1

$$39 * Y_{39} \leq L_1$$

### Actualizar presupuesto de noviembre

$\$\$NOVIEMBRE \in \mathbb{N}_0 \quad [\$]:$ Presupuesto de noviembre teniendo en cuenta la extensión del enunciado

$$\$\$NOVIEMBRE = \$NOVIEMBRE + Y_{39} * 43000$$

Se depreca la ecuación original del presupuesto de noviembre

$$0.6 * \$UNO * L_{1, Nov} +  \$DOS * L_{2, Nov} +  0.5 * \$TRES * L_{3, Nov} \leq \$NOVIEMBRE$$

Y se reemplaza por la actualizada

$$0.6 * \$UNO * L_{1, Nov} +  \$DOS * L_{2, Nov} +  0.5 * \$TRES * L_{3, Nov} \leq \$\$NOVIEMBRE$$
