tabla_resumen_temperatura <- function(datos, ids = NULL) {
  columnas <- c("id", "temperatura_abrigo_150cm")
  faltan <- setdiff(columnas, names(datos))
  if (length(faltan) > 0) {
    stop("Faltan las columnas: ", paste(faltan, collapse = ", "), call. = FALSE)
  }

  if (is.null(ids)) {
    ids_sel <- unique(datos$id)
  } else {
    ids_sel <- unique(ids)
    inexistentes <- setdiff(ids_sel, unique(datos$id))
    if (length(inexistentes) > 0) {
      stop("ID(s) inexistente(s): ",
           paste(inexistentes, collapse = ", "), call. = FALSE)
    }
  }

  filtrado <- dplyr::filter(datos, .data$id %in% ids_sel)
  agrupado <- dplyr::group_by(filtrado, .data$id)
  resumen <- dplyr::summarise(
    agrupado,
    minima   = estadistica_valida(.data$temperatura_abrigo_150cm, min),
    maxima   = estadistica_valida(.data$temperatura_abrigo_150cm, max),
    promedio = estadistica_valida(.data$temperatura_abrigo_150cm, mean),
    desvio   = estadistica_valida(.data$temperatura_abrigo_150cm, stats::sd),
    .groups = "drop"
  )

  dplyr::arrange(resumen, match(.data$id, ids_sel))
}


estadistica_valida <- function(x, f) {
  x <- x[!is.na(x)]
  if (length(x) == 0) NA_real_ else f(x)
}


