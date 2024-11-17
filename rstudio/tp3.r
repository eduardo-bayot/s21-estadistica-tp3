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
 

# Seccion 3.3
# Parámetros del problema
mu_0 <- 130  # Media poblacional bajo H0
sigma <- 4   # Desviación estándar
n <- length(muestra)  # Tamaño de la muestra (usando los valores simulados)

# Cálculo del promedio muestral
X_bar <- mean(muestra)

# Cálculo del estadístico Z
Z <- (X_bar - mu_0) / (sigma / sqrt(n))

# Imprimir resultados
cat("Promedio muestral (X_bar):", X_bar, "\n")
cat("Estadístico Z:", Z, "\n")
