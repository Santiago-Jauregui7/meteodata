# Contribuir a meteodata

Aceptamos reportes de problemas, mejoras en la documentación,
nuevos tests y propuestas para mejorar las funciones del paquete.

## Reportar un problema

Abrí un issue en:
https://github.com/Santiago-Jauregui7/meteodata/issues

Incluí:

- Qué intentaste hacer.
- Qué resultado esperabas y qué ocurrió.
- El mensaje de error completo, si lo hubo.
- Un ejemplo pequeño que permita reproducir el problema.
- Tu versión de R y sistema operativo.

Podés consultar la información de tu sesión con:

```r
sessionInfo()
```

## Preparar el entorno

Abrí meteodata.Rproj en RStudio.

En un entorno nuevo, podés instalar las herramientas y dependencias
de desarrollo con:

```r
install.packages(c("devtools", "remotes"))

remotes::install_deps(
  dependencies = TRUE,
  upgrade = "never"
)
```

## Proponer cambios

1. Actualizá tu copia del repositorio. Si no tenés permisos de
   escritura, creá un fork.
2. Creá una rama para tu propuesta.
3. Realizá cambios pequeños relacionados con un mismo objetivo.
4. Si modificás funciones, actualizá su documentación en R/ y
   agregá o ajustá los tests en tests/testthat/.
5. Verificá los cambios.
6. Hacé commits con mensajes que describan lo realizado.
7. Abrí un pull request explicando el problema, la solución y
   las verificaciones realizadas.

## Verificar cambios en funciones

Regenerá la documentación y ejecutá la revisión del paquete:

```r
devtools::document()
devtools::check()
```

Comprobá también la cobertura:

```r
cobertura <- covr::package_coverage()
covr::percent_coverage(cobertura)
```

El paquete debe pasar los checks sin errores ni warnings.
La cobertura global de los tests debe alcanzar al menos el 75 %.

GitHub ejecuta automáticamente los checks y la medición de
cobertura en los push y pull requests.

## Actualizar el README

Editá README.Rmd y generá README.md con:

```r
devtools::build_readme()
```

Incluí en el commit los archivos modificados y las imágenes
generadas que correspondan.

## Código de conducta

Todas las contribuciones deben respetar el
[código de conducta](CODE_OF_CONDUCT.md).

Para reportar una situación relacionada con la convivencia,
utilizá el contacto indicado en ese documento.
