#' Leer datos meteorologicos de una estacion
#'
#' Descarga el archivo CSV si no existe en la ruta indicada.
#' Si ya existe, lo lee sin volver a descargarlo.
#'
#' @param id Texto con el identificador de la estacion,
#'   por ejemplo "NH0437".
#' @param ruta Texto con la ruta donde guardar o leer el CSV,
#'   incluido el nombre del archivo.
#'
#' @return Un tibble, que es un tipo de data frame, con los datos.
#' @export
#'
#' @examples
#' archivo <- tempfile(fileext = ".csv")
#' writeLines(
#'   c("fecha,temperatura_abrigo_150cm", "2024-01-01,20"),
#'   archivo
#' )
#' leer_datos("NH0437", archivo)
#' unlink(archivo)
leer_datos <- function(id, ruta) {

  if (!is.character(id) || length(id) != 1L ||
      is.na(id) || !nzchar(trimws(id))) {
    cli::cli_abort("id debe ser un unico texto no vacio.")
  }

  if (!is.character(ruta) || length(ruta) != 1L ||
      is.na(ruta) || !nzchar(trimws(ruta))) {
    cli::cli_abort("ruta debe ser un unico texto no vacio.")
  }

  if (dir.exists(ruta)) {
    cli::cli_abort("ruta debe indicar un archivo CSV, no una carpeta.")
  }

  if (!file.exists(ruta)) {

    carpeta <- dirname(ruta)

    if (!dir.exists(carpeta)) {
      dir.create(carpeta, recursive = TRUE)
    }

    url <- paste0(
      "https://raw.githubusercontent.com/",
      "rse-r/intro-programacion/main/datos/",
      id,
      ".csv"
    )

    cli::cli_inform("Descargando datos de la estacion {id}.")

    estado <- tryCatch(
      utils::download.file(
        url = url,
        destfile = ruta,
        mode = "wb",
        quiet = TRUE
      ),
      error = function(e) {
        unlink(ruta)
        cli::cli_abort(
          "No se pudo descargar el CSV. Revisa el ID y la conexion.",
          parent = e
        )
      }
    )

    if (estado != 0L) {
      unlink(ruta)
      cli::cli_abort("La descarga del CSV no se completo.")
    }

  } else {
    cli::cli_inform("Leyendo el archivo que ya estaba descargado.")
  }

  readr::read_csv(ruta, show_col_types = FALSE)
}
