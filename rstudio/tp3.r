# Configuración del DNI
a <- 3
b <- 2
c <- 4

# Tamaño de la muestra
n <- a + b

# Fijar semilla para reproducibilidad
set.seed(123)

# Generar la muestra
muestra <- rnorm(n, mean = 130, sd = c)

# Mostrar la tabla generada
print(muestra)

# Guardar como data.frame para exportar o analizar
tabla_muestra <- data.frame(Valores = muestra)

# Opcional: exportar a CSV
write.csv(tabla_muestra, "tabla_muestra.csv", row.names = FALSE)
