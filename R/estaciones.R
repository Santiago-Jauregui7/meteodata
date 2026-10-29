#' Datos diarios de cinco estaciones meteorologicas
#'
#' Observaciones meteorologicas del INTA distribuidas
#' en el repositorio del curso.
#'
#' @format Un data frame con 95681 filas y 35 columnas.
#'   Entre sus variables principales se encuentran:
#' \describe{
#'   \item{id}{Identificador de la estacion meteorologica.}
#'   \item{fecha}{Fecha de la observacion, de clase Date.}
#'   \item{temperatura_abrigo_150cm}{
#'     Temperatura de abrigo a 150 cm, en grados Celsius.
#'   }
#'   \item{temperatura_abrigo_150cm_maxima}{
#'     Temperatura maxima de abrigo a 150 cm.
#'   }
#'   \item{temperatura_abrigo_150cm_minima}{
#'     Temperatura minima de abrigo a 150 cm.
#'   }
#'   \item{precipitacion_pluviometrica}{
#'     Precipitacion registrada.
#'   }
#'   \item{direccion_viento_1000cm}{
#'     Direccion del viento, conservada como texto.
#'   }
#' }
#'
#' @source
#' \url{https://github.com/rse-r/intro-programacion/tree/main/datos}
#'
#' @examples
#' head(estaciones)
#' unique(estaciones$id)
"estaciones"
