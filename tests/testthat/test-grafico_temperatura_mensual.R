datos_para_grafico <- data.frame(
  id = c("A", "A", "A", "A", "B", "B", "B"),
  fecha = as.Date(c(
    "2024-01-01",
    "2024-01-15",
    "2025-01-01",
    "2024-02-01",
    "2024-01-01",
    "2024-02-01",
    "2024-02-15"
  )),
  temperatura_abrigo_150cm = c(
    10, 20, 30, 40, 5, 15, NA_real_
  ),
  stringsAsFactors = FALSE
)


test_that("grafica los promedios mensuales correctos", {

  g <- grafico_temperatura_mensual(datos_para_grafico)

  expect_true(inherits(g, "ggplot"))
  expect_equal(g$labels$title, "Temperatura")

  puntos <- ggplot2::layer_data(g, i = 2)

  expect_equal(nrow(puntos), 4L)
  expect_equal(sort(puntos$x), c(1, 1, 2, 2))
  expect_equal(sort(puntos$y), c(5, 15, 20, 40))
})


test_that("personaliza titulo y colores por estacion", {

  g <- grafico_temperatura_mensual(
    datos_para_grafico,
    colores = c(A = "steelblue", B = "tomato"),
    titulo = "Comparacion"
  )

  expect_equal(g$labels$title, "Comparacion")

  puntos <- ggplot2::layer_data(g, i = 2)

  puntos_a <- puntos[puntos$colour == "steelblue", ]
  puntos_b <- puntos[puntos$colour == "tomato", ]

  puntos_a <- puntos_a[order(puntos_a$x), ]
  puntos_b <- puntos_b[order(puntos_b$x), ]

  expect_equal(puntos_a$y, c(20, 40))
  expect_equal(puntos_b$y, c(5, 15))
})


test_that("acepta colores sin nombres", {

  g <- grafico_temperatura_mensual(
    datos_para_grafico,
    colores = c("steelblue", "tomato")
  )

  puntos <- ggplot2::layer_data(g, i = 2)

  expect_equal(
    sort(unique(puntos$colour)),
    c("steelblue", "tomato")
  )
})


test_that("permite graficar una sola estacion", {

  una <- datos_para_grafico[
    datos_para_grafico$id == "A",
  ]

  g <- grafico_temperatura_mensual(una)
  puntos <- ggplot2::layer_data(g, i = 2)

  expect_equal(nrow(puntos), 2L)
  expect_equal(sort(puntos$y), c(20, 40))
})


test_that("rechaza columnas ausentes o de tipo incorrecto", {

  expect_error(
    grafico_temperatura_mensual(data.frame(id = "A")),
    "datos debe incluir"
  )

  fechas_texto <- datos_para_grafico
  fechas_texto$fecha <- as.character(fechas_texto$fecha)

  expect_error(
    grafico_temperatura_mensual(fechas_texto),
    "Date"
  )

  temperaturas_texto <- datos_para_grafico
  temperaturas_texto$temperatura_abrigo_150cm <-
    as.character(temperaturas_texto$temperatura_abrigo_150cm)

  expect_error(
    grafico_temperatura_mensual(temperaturas_texto),
    "numerica"
  )
})


test_that("rechaza titulos invalidos", {

  expect_error(
    grafico_temperatura_mensual(datos_para_grafico, titulo = 123),
    "titulo debe"
  )

  expect_error(
    grafico_temperatura_mensual(
      datos_para_grafico,
      titulo = NA_character_
    ),
    "titulo debe"
  )
})


test_that("rechaza datos sin observaciones completas", {

  sin_temperaturas <- datos_para_grafico
  sin_temperaturas$temperatura_abrigo_150cm <- NA_real_

  expect_error(
    grafico_temperatura_mensual(sin_temperaturas),
    "No hay observaciones"
  )
})


test_that("rechaza colores insuficientes o mal identificados", {

  expect_error(
    grafico_temperatura_mensual(
      datos_para_grafico,
      colores = "red"
    ),
    "un color"
  )

  expect_error(
    grafico_temperatura_mensual(
      datos_para_grafico,
      colores = c("red", NA_character_)
    ),
    "un color"
  )

  expect_error(
    grafico_temperatura_mensual(
      datos_para_grafico,
      colores = c(X = "red", Y = "blue")
    ),
    "nombres de colores"
  )
})
