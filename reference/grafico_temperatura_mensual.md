# Graficar temperaturas medias mensuales

Calcula el promedio de temperatura para cada estacion y mes del
calendario, reuniendo los distintos anios. Excluye las filas sin
identificador, fecha o temperatura.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Data frame con las columnas id, fecha y temperatura_abrigo_150cm.
  fecha debe ser de clase Date.

- colores:

  Vector opcional de colores. Sin nombres, se asignan por orden
  alfabetico de ID. Si tiene nombres, estos deben ser los IDs de las
  estaciones.

- titulo:

  Texto para el titulo del grafico.

## Value

Un objeto ggplot con el promedio mensual de temperatura de cada
estacion.

## Examples

``` r
grafico_temperatura_mensual(estaciones)


una_estacion <- estaciones[
  estaciones$id == "NH0437",
]
grafico_temperatura_mensual(
  una_estacion,
  colores = "steelblue",
  titulo = "Temperatura de NH0437"
)
```
