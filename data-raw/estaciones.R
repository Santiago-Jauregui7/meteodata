# Preparar el dataset de estaciones meteorologicas

ids <- c(
  "NH0472",
  "NH0910",
  "NH0046",
  "NH0098",
  "NH0437"
)

base_url <- paste0(
  "https://raw.githubusercontent.com/",
  "rse-r/intro-programacion/main/datos/"
)

tipos <- readr::cols(
  .default = readr::col_double(),
  id = readr::col_character(),
  fecha = readr::col_date(),
  direccion_viento_1000cm = readr::col_character()
)

tablas <- lapply(ids, function(id) {

  url <- paste0(base_url, id, ".csv")

  tabla <- readr::read_csv(
    url,
    col_types = tipos,
    show_col_types = FALSE
  )

  tabla$id <- id

  as.data.frame(tabla)
})

estaciones <- do.call(rbind, tablas)

rownames(estaciones) <- NULL

# Comprobar la estructura antes de guardar

stopifnot(
  identical(sort(unique(estaciones$id)), sort(ids)),
  inherits(estaciones$fecha, "Date"),
  is.numeric(estaciones$temperatura_abrigo_150cm)
)

# Guardar el dataset dentro del paquete

usethis::use_data(
  estaciones,
  overwrite = TRUE,
  compress = "xz"
)
