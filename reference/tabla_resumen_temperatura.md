# Resumir temperaturas por estacion

Calcula temperaturas minima, maxima, promedio y desvio estandar para las
estaciones seleccionadas. Los valores faltantes se excluyen del calculo.
Los grupos sin temperaturas validas devuelven NA.

## Usage

``` r
tabla_resumen_temperatura(datos, ids = NULL)
```

## Arguments

- datos:

  Data frame con las columnas id y temperatura_abrigo_150cm.

- ids:

  Vector de identificadores de estaciones. Si es NULL, se utilizan todas
  las estaciones.

## Value

Una tabla con una fila por estacion y las columnas id, minima, maxima,
promedio y desvio.

## Examples

``` r
tabla_resumen_temperatura(estaciones)
#> # A tibble: 5 × 5
#>   id     minima maxima promedio desvio
#>   <chr>   <dbl>  <dbl>    <dbl>  <dbl>
#> 1 NH0472   0.55   34.8     18.0   5.94
#> 2 NH0910   0      35.2     17.7   6.12
#> 3 NH0046  -0.25   34.6     17.3   5.90
#> 4 NH0098 -17.4    37.4     18.6   5.98
#> 5 NH0437   2.1    36.3     20.2   5.77
tabla_resumen_temperatura(
  estaciones,
  ids = c("NH0437", "NH0472")
)
#> # A tibble: 2 × 5
#>   id     minima maxima promedio desvio
#>   <chr>   <dbl>  <dbl>    <dbl>  <dbl>
#> 1 NH0437   2.1    36.3     20.2   5.77
#> 2 NH0472   0.55   34.8     18.0   5.94
```
