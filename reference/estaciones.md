# Datos diarios de cinco estaciones meteorologicas

Observaciones meteorologicas del INTA distribuidas en el repositorio del
curso.

## Usage

``` r
estaciones
```

## Format

Un data frame con 95681 filas y 35 columnas. Entre sus variables
principales se encuentran:

- id:

  Identificador de la estacion meteorologica.

- fecha:

  Fecha de la observacion, de clase Date.

- temperatura_abrigo_150cm:

  Temperatura de abrigo a 150 cm, en grados Celsius.

- temperatura_abrigo_150cm_maxima:

  Temperatura maxima de abrigo a 150 cm.

- temperatura_abrigo_150cm_minima:

  Temperatura minima de abrigo a 150 cm.

- precipitacion_pluviometrica:

  Precipitacion registrada.

- direccion_viento_1000cm:

  Direccion del viento, conservada como texto.

## Source

<https://github.com/rse-r/intro-programacion/tree/main/datos>

## Examples

``` r
head(estaciones)
#>       id      fecha temperatura_abrigo_150cm temperatura_abrigo_150cm_maxima
#> 1 NH0472 1961-07-01                     11.1                            13.4
#> 2 NH0472 1961-07-02                      5.5                            10.5
#> 3 NH0472 1961-07-03                      6.0                            10.8
#> 4 NH0472 1961-07-04                       NA                              NA
#> 5 NH0472 1961-07-05                     12.4                            14.8
#> 6 NH0472 1961-07-06                     11.0                            16.5
#>   temperatura_abrigo_150cm_minima temperatura_intemperie_5cm_minima
#> 1                             8.8                                NA
#> 2                             0.5                                NA
#> 3                             1.2                                NA
#> 4                             7.0                                NA
#> 5                            10.0                                NA
#> 6                             5.5                                NA
#>   temperatura_intemperie_50cm_minima temperatura_suelo_5cm_media
#> 1                                 NA                          NA
#> 2                                 NA                          NA
#> 3                                 NA                          NA
#> 4                                 NA                          NA
#> 5                                 NA                          NA
#> 6                                 NA                          NA
#>   temperatura_suelo_10cm_media temperatura_inte_5cm
#> 1                           NA                   NA
#> 2                           NA                   NA
#> 3                           NA                   NA
#> 4                           NA                   NA
#> 5                           NA                   NA
#> 6                           NA                   NA
#>   temperatura_intemperie_150cm_minima humedad_suelo precipitacion_pluviometrica
#> 1                                  NA            NA                           0
#> 2                                  NA            NA                           0
#> 3                                  NA            NA                           0
#> 4                                  NA            NA                           0
#> 5                                  NA            NA                           0
#> 6                                  NA            NA                           0
#>   granizo nieve heliofania_efectiva heliofania_relativa tesion_vapor_media
#> 1       0     0                  NA                  NA                9.8
#> 2       0     0                  NA                  NA                7.9
#> 3       0     0                  NA                  NA                7.5
#> 4       0     0                  NA                  NA               14.9
#> 5       0     0                  NA                  NA               17.2
#> 6       0     0                  NA                  NA               11.5
#>   humedad_media humedad_media_8_14_20 rocio_medio duracion_follaje_mojado
#> 1            NA                    81         6.7                      NA
#> 2            NA                    80         3.6                      NA
#> 3            NA                    62         2.9                      NA
#> 4            NA                    93        12.9                      NA
#> 5            NA                    92        15.1                      NA
#> 6            NA                    80         9.0                      NA
#>   velocidad_viento_200cm_media direccion_viento_200cm
#> 1                         14.4                     NA
#> 2                          4.8                     NA
#> 3                          7.2                     NA
#> 4                          8.8                     NA
#> 5                          4.8                     NA
#> 6                         14.4                     NA
#>   velocidad_viento_1000cm_media direccion_viento_1000cm velocidad_viento_maxima
#> 1                            18                    <NA>                      NA
#> 2                             6                    <NA>                      NA
#> 3                             9                    <NA>                      NA
#> 4                            11                    <NA>                      NA
#> 5                             6                    <NA>                      NA
#> 6                            18                    <NA>                      NA
#>   presion_media radiacion_global radiacion_neta evaporacion_tanque
#> 1            NA               NA             NA                 NA
#> 2            NA               NA             NA                 NA
#> 3            NA               NA             NA                 NA
#> 4            NA               NA             NA                 NA
#> 5            NA               NA             NA                 NA
#> 6            NA               NA             NA                 NA
#>   evapotranspiracion_potencial profundidad_napa horas_frio unidad_frio
#> 1                           NA               NA   0.000000          NA
#> 2                           NA               NA  15.600000          NA
#> 3                           NA               NA  14.500000          NA
#> 4                           NA               NA         NA          NA
#> 5                           NA               NA   0.000000          NA
#> 6                           NA               NA   3.272727          NA
unique(estaciones$id)
#> [1] "NH0472" "NH0910" "NH0046" "NH0098" "NH0437"
```
