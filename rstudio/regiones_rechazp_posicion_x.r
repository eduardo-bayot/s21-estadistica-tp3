# Parámetros del problema
mu_0 <- 130  # Media poblacional bajo H0
sigma <- 4   # Desviación estándar
n <- length(muestra)  # Tamaño de la muestra
alpha <- 0.01  # Nivel de significancia
z_critical <- qnorm(1 - alpha / 2)  # Valor crítico para una prueba bilateral

# Valor del estadístico Z calculado
Z <- (mean(muestra) - mu_0) / (sigma / sqrt(n))

# Crear datos para el gráfico
x <- seq(mu_0 - 4 * sigma, mu_0 + 4 * sigma, length.out = 1000)
y <- dnorm(x, mean = mu_0, sd = sigma)

# Configurar el gráfico
plot(x, y, type = "l", lwd = 2, col = "blue",
     main = "Distribución Normal y Posición del Estadístico Z",
     xlab = "Temperatura de Activación (°F)", ylab = "Densidad")

# Sombrear las regiones de rechazo
polygon(c(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100),
          rev(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), rep(0, 100)),
        col = "red", border = NA)

polygon(c(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100),
          rev(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), rep(0, 100)),
        col = "red", border = NA)

# Marcar el valor de Z en el gráfico
points(mu_0 + Z * sigma, dnorm(mu_0 + Z * sigma, mean = mu_0, sd = sigma), col = "darkgreen", pch = 19, cex = 1.5)
text(mu_0 + Z * sigma, dnorm(mu_0 + Z * sigma, mean = mu_0, sd = sigma), labels = paste0("Z = ", round(Z, 4)), pos = 4)

# Añadir líneas verticales para los valores críticos
abline(v = c(mu_0 - z_critical * sigma, mu_0 + z_critical * sigma), col = "red", lty = 2, lwd = 2)

# Guardar el gráfico
png("posicion_Z.png", width = 800, height = 600)
plot(x, y, type = "l", lwd = 2, col = "blue",
     main = "Distribución Normal y Posición del Estadístico Z",
     xlab = "Temperatura de Activación (°F)", ylab = "Densidad")

# Sombrear las regiones de rechazo
polygon(c(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100),
          rev(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), rep(0, 100)),
        col = "red", border = NA)

polygon(c(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100),
          rev(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), rep(0, 100)),
        col = "red", border = NA)

# Marcar el valor de Z
points(mu_0 + Z * sigma, dnorm(mu_0 + Z * sigma, mean = mu_0, sd = sigma), col = "darkgreen", pch = 19, cex = 1.5)
text(mu_0 + Z * sigma, dnorm(mu_0 + Z * sigma, mean = mu_0, sd = sigma), labels = paste0("Z = ", round(Z, 4)), pos = 4)

# Añadir líneas verticales para los valores críticos
abline(v = c(mu_0 - z_critical * sigma, mu_0 + z_critical * sigma), col = "red", lty = 2, lwd = 2)
dev.off()
