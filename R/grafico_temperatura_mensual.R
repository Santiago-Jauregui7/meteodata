#' Graficar temperaturas medias mensuales
#'
#' Calcula el promedio de temperatura para cada estacion
#' y mes del calendario, reuniendo los distintos anios.
#' Excluye las filas sin identificador, fecha o temperatura.
#'
#' @param datos Data frame con las columnas id, fecha
#'   y temperatura_abrigo_150cm. fecha debe ser de clase Date.
#' @param colores Vector opcional de colores.
#'   Sin nombres, se asignan por orden alfabetico de ID.
#'   Si tiene nombres, estos deben ser los IDs de las estaciones.
#' @param titulo Texto para el titulo del grafico.
#'
#' @return Un objeto ggplot con el promedio mensual
#'   de temperatura de cada estacion.
#'
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' grafico_temperatura_mensual(estaciones)
#'
#' una_estacion <- estaciones[
#'   estaciones$id == "NH0437",
#' ]
#' grafico_temperatura_mensual(
#'   una_estacion,
#'   colores = "steelblue",
#'   titulo = "Temperatura de NH0437"
#' )
grafico_temperatura_mensual <- function(
    datos,
    colores = NULL,
    titulo = "Temperatura") {

  columnas <- c(
    "id",
    "fecha",
    "temperatura_abrigo_150cm"
  )

  if (!is.data.frame(datos) ||
      !all(columnas %in% names(datos))) {
    cli::cli_abort(
      "datos debe incluir id, fecha y temperatura_abrigo_150cm."
    )
  }

  if (!inherits(datos$fecha, "Date")) {
    cli::cli_abort("La columna fecha debe ser de clase Date.")
  }

  if (!is.numeric(datos$temperatura_abrigo_150cm)) {
    cli::cli_abort("La columna de temperatura debe ser numerica.")
  }

  if (!is.character(titulo) || length(titulo) != 1L ||
      is.na(titulo)) {
    cli::cli_abort("titulo debe ser un unico texto.")
  }

  datos <- datos[
    stats::complete.cases(datos[columnas]),
    columnas,
    drop = FALSE
  ]

  if (nrow(datos) == 0L) {
    cli::cli_abort("No hay observaciones completas para graficar.")
  }

  datos$id <- as.character(datos$id)
  datos$mes <- as.integer(format(datos$fecha, "%m"))

  agrupados <- dplyr::group_by(
    datos,
    .data$id,
    .data$mes
  )

  resumen <- dplyr::summarise(
    agrupados,
    temperatura = mean(.data$temperatura_abrigo_150cm),
    .groups = "drop"
  )

  ids <- sort(unique(resumen$id))

  if (!is.null(colores)) {

    if (!is.character(colores) ||
        length(colores) < length(ids) ||
        anyNA(colores)) {
      cli::cli_abort(
        "Debes proporcionar al menos un color valido por estacion."
      )
    }

    if (is.null(names(colores))) {
      colores <- stats::setNames(
        colores[seq_along(ids)],
        ids
      )
    } else if (!all(ids %in% names(colores))) {
      cli::cli_abort(
        "Los nombres de colores deben incluir los IDs del grafico."
      )
    }
  }

  grafico <- ggplot2::ggplot(
    resumen,
    ggplot2::aes(
      x = .data$mes,
      y = .data$temperatura,
      colour = .data$id,
      group = .data$id
    )
  ) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::geom_point(size = 2) +
    ggplot2::scale_x_continuous(
      breaks = 1:12,
      labels = c(
        "Ene", "Feb", "Mar", "Abr", "May", "Jun",
        "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"
      )
    ) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura media (\u00B0C)",
      colour = "Estacion"
    ) +
    ggplot2::theme_minimal()

  if (!is.null(colores)) {
    grafico <- grafico +
      ggplot2::scale_colour_manual(values = colores)
  }

  grafico
}
