
#conduct simulation for model_1 where x1 = x + e1 where e1 ∼ N (0,0.25)
set.seed(123)
# Number of simulations
num_sim <- 50
# Number of observations per simulation
num_obs <- 500
# Store regression results
reg_results <- vector("list", length = num_sim)
# conduct simulations
for (i in 1:num_sim) {
  x <- rnorm(num_obs, mean = 1, sd = 1)
  v <- rnorm(num_obs, mean = 0, sd = 1)
  e1 <- rnorm(num_obs, mean = 0, sd = 0.25)
  x_1 <- x + e1
  y <- 1 + 0.5 * x + v
  reg_model <- lm(y ~ x_1)
# Store regression results
  reg_results[[i]] <- coef(reg_model)
}
coeff_matrix <- matrix(unlist(reg_results), ncol = 2, byrow = TRUE,
                       dimnames = list(NULL, c("Intercept", "x_1")))

# Display summary table of coefficients across all simulations
print("Summary Table of Coefficients:")
print(coeff_matrix)

# Calculate and display the summary statistics for coefficients and intercept
coeff_summary_stats <- sapply(1:2, function(i) {
  c(
    obs = num_sim,
    mean = mean(coeff_matrix[, i]),
    sd = sd(coeff_matrix[, i]),
    min = min(coeff_matrix[, i]),
    max = max(coeff_matrix[, i])
  )
})
coeff_summary_df <- data.frame(t(coeff_summary_stats), row.names = c("Intercept", "Coeff"))
print("Summary Statistics for Coefficients and Intercept for Model 1:")
print(coeff_summary_df)


##Model 2 , where x2= x + e2 where e2∼N(0,0.5)
# Store regression results
reg_results_2 <- vector("list", length = num_sim)
# conduct simulations
for (i in 1:num_sim) {
  x <- rnorm(num_obs, mean = 1, sd = 1)
  v <- rnorm(num_obs, mean = 0, sd = 1)
  e2 <- rnorm(num_obs, mean = 0, sd = 0.5)
  x_2 <- x + e2
  y <- 1 + 0.5 * x + v
  reg_model <- lm(y ~ x_2)
  # Store regression results
  reg_results_2[[i]] <- coef(reg_model)
}
coeff_matrix_2 <- matrix(unlist(reg_results_2), ncol = 2, byrow = TRUE,
                       dimnames = list(NULL, c("Intercept", "x_2")))
print("Summary Table of Coefficients:")
print(coeff_matrix_2)
# Calculate and display the summary statistics for coefficients and intercept
coeff_summary_stats <- sapply(1:2, function(i) {
  c(
    obs = num_sim,
    mean = mean(coeff_matrix_2[, i]),
    sd = sd(coeff_matrix_2[, i]),
    min = min(coeff_matrix_2[, i]),
    max = max(coeff_matrix_2[, i])
  )
})
coeff_summary_df <- data.frame(t(coeff_summary_stats), row.names = c("Intercept", "Coeff"))
print("Summary Statistics for Coefficients and Intercept for Model 1:")
print(coeff_summary_df)

rm(list = lst())
##Model 3 , where x3= x + e3 where e3 ∼ N (0,19)
# Store regression results
reg_results_3 <- vector("list", length = num_sim)
# conduct simulations
for (i in 1:num_sim) {
  x <- rnorm(num_obs, mean = 1, sd = 1)
  v <- rnorm(num_obs, mean = 0, sd = 1)
  e3 <- rnorm(num_obs, mean = 0, sd = 19)
  x_3 <- x + e3
  y <- 1 + 0.5 * x + v
  reg_model_3 <- lm(y ~ x_3)
  # Store regression results
  reg_results_3[[i]] <- coef(reg_model_3)
}
coeff_matrix_3 <- matrix(unlist(reg_results_3), ncol = 2, byrow = TRUE,
                         dimnames = list(NULL, c("Intercept", "x_2")))
print("Summary Table of Coefficients:")
print(coeff_matrix_3)
# Calculate and display the summary statistics for coefficients and intercept
coeff_summary_stats_3 <- sapply(1:2, function(i) {
  c(
    obs = num_sim,
    mean = mean(coeff_matrix_3[, i]),
    sd = sd(coeff_matrix_3[, i]),
    min = min(coeff_matrix_3[, i]),
    max = max(coeff_matrix_3[, i])
  )
})
coeff_summary_3 <- data.frame(t(coeff_summary_stats_3), row.names = c("Intercept", "Coeff"))
print("Summary Statistics for Coefficients and Intercept for Model 3:")
print(coeff_summary_3)






