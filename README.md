
# meteodata

Paquete de R desarrollado para Programación II que permite leer y
analizar datos de estaciones meteorológicas del INTA.

## Autores

- Santiago Jauregui
- Mateo Garcia

## Instalación

``` r
install.packages("remotes")
remotes::install_github("Santiago-Jauregui7/meteodata")
```

## Datos incluidos

El dataset `estaciones` reúne observaciones diarias de cinco estaciones:
NH0472, NH0910, NH0046, NH0098 y NH0437.

``` r
library(meteodata)

dim(estaciones)
```

    ## [1] 95681    35

``` r
head(
  estaciones[
    c("id", "fecha", "temperatura_abrigo_150cm")
  ]
)
```

    ##       id      fecha temperatura_abrigo_150cm
    ## 1 NH0472 1961-07-01                     11.1
    ## 2 NH0472 1961-07-02                      5.5
    ## 3 NH0472 1961-07-03                      6.0
    ## 4 NH0472 1961-07-04                       NA
    ## 5 NH0472 1961-07-05                     12.4
    ## 6 NH0472 1961-07-06                     11.0

## Leer datos de una estación

La función `leer_datos()` descarga el CSV cuando no existe en la ruta
indicada. Si ya está guardado, utiliza ese archivo.

``` r
datos <- leer_datos(
  id = "NH0437",
  ruta = "datos/NH0437.csv"
)

head(datos)
```

## Funciones previstas

- `leer_datos()`: lectura y descarga de datos, implementada.
- `tabla_resumen_temperatura()`: resumen de temperaturas, en desarrollo.
- `grafico_temperatura_mensual()`: gráfico mensual, en desarrollo.
