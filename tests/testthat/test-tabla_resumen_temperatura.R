datos_prueba <- data.frame(
  id = c("A", "A", "A", "B", "B", "C", "C", "C"),
  temperatura_abrigo_150cm = c(
    10, 20, 30, 5, 15, NA_real_, 8, 12
  ),
  stringsAsFactors = FALSE
)


test_that("calcula las estadisticas correctamente", {

  resultado <- tabla_resumen_temperatura(datos_prueba)

  expect_equal(nrow(resultado), 3L)
  expect_equal(sort(resultado$id), c("A", "B", "C"))

  fila_a <- resultado[resultado$id == "A", ]

  expect_equal(fila_a$minima, 10)
  expect_equal(fila_a$maxima, 30)
  expect_equal(fila_a$promedio, 20)
  expect_equal(fila_a$desvio, 10)
})


test_that("permite seleccionar una estacion", {

  resultado <- tabla_resumen_temperatura(
    datos_prueba,
    ids = "B"
  )

  expect_equal(nrow(resultado), 1L)
  expect_equal(resultado$id, "B")
})


test_that("permite seleccionar varias estaciones", {

  resultado <- tabla_resumen_temperatura(
    datos_prueba,
    ids = c("A", "C")
  )

  expect_equal(nrow(resultado), 2L)
  expect_equal(sort(resultado$id), c("A", "C"))
})


test_that("excluye los valores faltantes del calculo", {

  resultado <- tabla_resumen_temperatura(
    datos_prueba,
    ids = "C"
  )

  expect_equal(resultado$minima, 8)
  expect_equal(resultado$maxima, 12)
  expect_equal(resultado$promedio, 10)
  expect_equal(resultado$desvio, sqrt(8))
})


test_that("devuelve NA si no hay temperaturas validas", {

  datos_faltantes <- data.frame(
    id = c("D", "D"),
    temperatura_abrigo_150cm = c(NA_real_, NA_real_),
    stringsAsFactors = FALSE
  )

  resultado <- tabla_resumen_temperatura(datos_faltantes)

  expect_equal(nrow(resultado), 1L)

  columnas <- c(
    "minima",
    "maxima",
    "promedio",
    "desvio"
  )

  expect_true(all(is.na(resultado[columnas])))
})


test_that("rechaza identificadores inexistentes", {

  expect_error(
    tabla_resumen_temperatura(datos_prueba, ids = "Z"),
    "inexistente"
  )

  expect_error(
    tabla_resumen_temperatura(
      datos_prueba,
      ids = c("A", "Z")
    ),
    "inexistente"
  )
})


test_that("rechaza datos sin las columnas necesarias", {

  expect_error(
    tabla_resumen_temperatura(
      data.frame(id = "A")
    ),
    "Faltan las columnas"
  )

  expect_error(
    tabla_resumen_temperatura(
      data.frame(temperatura_abrigo_150cm = 10)
    ),
    "Faltan las columnas"
  )
})
