# Leer datos meteorologicos de una estacion

Descarga el archivo CSV si no existe en la ruta indicada. Si ya existe,
lo lee sin volver a descargarlo.

## Usage

``` r
leer_datos(id, ruta)
```

## Arguments

- id:

  Texto con el identificador de la estacion, por ejemplo "NH0437".

- ruta:

  Texto con la ruta donde guardar o leer el CSV, incluido el nombre del
  archivo.

## Value

Un tibble, que es un tipo de data frame, con los datos.

## Examples

``` r
archivo <- tempfile(fileext = ".csv")
writeLines(
  c("fecha,temperatura_abrigo_150cm", "2024-01-01,20"),
  archivo
)
leer_datos("NH0437", archivo)
#> Leyendo el archivo que ya estaba descargado.
#> # A tibble: 1 × 2
#>   fecha      temperatura_abrigo_150cm
#>   <date>                        <dbl>
#> 1 2024-01-01                       20
unlink(archivo)
```
