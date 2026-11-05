test_that("lee el archivo existente sin modificarlo", {

  archivo <- tempfile(fileext = ".csv")

  contenido <- c(
    "fecha,temperatura_abrigo_150cm",
    "2024-01-01,10",
    "2024-01-02,20"
  )

  writeLines(contenido, archivo)

  expect_message(
    resultado <- leer_datos("NH0437", archivo),
    "ya estaba descargado"
  )

  expect_true(is.data.frame(resultado))
  expect_equal(nrow(resultado), 2L)

  expect_equal(
    resultado$temperatura_abrigo_150cm,
    c(10, 20)
  )

  expect_equal(readLines(archivo), contenido)

  unlink(archivo)
})


test_that("rechaza identificadores invalidos", {

  ruta <- tempfile(fileext = ".csv")

  expect_error(leer_datos(123, ruta), "id debe")
  expect_error(leer_datos("", ruta), "id debe")
  expect_error(leer_datos(NA_character_, ruta), "id debe")

  expect_error(
    leer_datos(c("NH0437", "NH0472"), ruta),
    "id debe"
  )
})


test_that("rechaza rutas invalidas", {

  expect_error(leer_datos("NH0437", 123), "ruta debe")
  expect_error(leer_datos("NH0437", ""), "ruta debe")

  expect_error(
    leer_datos("NH0437", NA_character_),
    "ruta debe"
  )

  expect_error(
    leer_datos("NH0437", tempdir()),
    "archivo CSV"
  )
})

test_that("conserva los valores despues de muchas filas vacias", {

  archivo <- tempfile(fileext = ".csv")

  columnas <- c(
    "id",
    "fecha",
    "direccion_viento_1000cm",
    "radiacion_neta",
    "temperatura_suelo_5cm_media",
    "profundidad_napa"
  )

  contenido <- c(
    paste(columnas, collapse = ","),
    rep("NH0437,2024-01-01,,,,", 1000),
    "NH0437,2024-01-02,270,12.5,18.2,1.4"
  )

  writeLines(contenido, archivo)

  resultado <- suppressMessages(
    leer_datos("NH0437", archivo)
  )

  expect_equal(nrow(resultado), 1001L)
  expect_equal(nrow(readr::problems(resultado)), 0L)

  expect_equal(
    resultado$direccion_viento_1000cm[1001],
    "270"
  )

  expect_equal(resultado$radiacion_neta[1001], 12.5)
  expect_equal(resultado$temperatura_suelo_5cm_media[1001], 18.2)
  expect_equal(resultado$profundidad_napa[1001], 1.4)

  unlink(archivo)
})
