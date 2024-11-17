# Parámetros de la distribución
mu_0 <- 130  # Media poblacional bajo la hipótesis nula
sigma <- 4   # Desviación estándar
alpha <- 0.01  # Nivel de significancia
z_critical <- qnorm(1 - alpha / 2)  # Valor crítico para un nivel bilateral

# Crear el gráfico
x <- seq(mu_0 - 4 * sigma, mu_0 + 4 * sigma, length.out = 1000)
y <- dnorm(x, mean = mu_0, sd = sigma)

# Configurar el gráfico
plot(x, y, type = "l", lwd = 2, col = "blue",
     main = "Distribución Normal Estándar y Región de Rechazo",
     xlab = "Temperatura de Activación (°F)",
     ylab = "Densidad")

# Rellenar las regiones de rechazo
polygon(c(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100), 
          rev(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), 
          rep(0, 100)),
        col = "red", border = NA)

polygon(c(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100), 
          rev(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), 
          rep(0, 100)),
        col = "red", border = NA)

# Añadir líneas verticales para los valores críticos
abline(v = c(mu_0 - z_critical * sigma, mu_0 + z_critical * sigma), col = "red", lty = 2, lwd = 2)

# Guardar el gráfico
png("region_rechazo.png", width = 800, height = 600)
plot(x, y, type = "l", lwd = 2, col = "blue",
     main = "Distribución Normal Estándar y Región de Rechazo",
     xlab = "Temperatura de Activación (°F)",
     ylab = "Densidad")

# Rellenar las regiones de rechazo
polygon(c(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100), 
          rev(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 - 4 * sigma, mu_0 - z_critical * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), 
          rep(0, 100)),
        col = "red", border = NA)

polygon(c(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100), 
          rev(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100))),
        c(dnorm(seq(mu_0 + z_critical * sigma, mu_0 + 4 * sigma, length.out = 100), 
                mean = mu_0, sd = sigma), 
          rep(0, 100)),
        col = "red", border = NA)

# Añadir líneas verticales para los valores críticos
abline(v = c(mu_0 - z_critical * sigma, mu_0 + z_critical * sigma), col = "red", lty = 2, lwd = 2)
dev.off()
