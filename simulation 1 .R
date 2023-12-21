library(knitr)
library(rmarkdown)
library(AER)
library(lmtest)
library(ggplot2)
rm(list = ls())
#Q1. Conduct simulation for model_1 where x1 = x + e1 where e1 ∼ N (0,0.25)
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




#Q4. Consider IV regressions of y on to x1.and consider x2 as instrument for x1 
# Store IV regression results
iv_results <- vector("list", length = num_sim)
# Conduct simulations
for (i in 1:num_sim) {
  x <- rnorm(num_obs, mean = 1, sd = 1)
  v <- rnorm(num_obs, mean = 0, sd = 1)
  e1 <- rnorm(num_obs, mean = 0, sd = 0.25)
  e2 <- rnorm(num_obs, mean = 0, sd = 0.5)
  x_1 <- x + e1
  x_2 <- x + e2
  y <- 1 + 0.5 * x + v
  iv_model <- ivreg(y ~ x_1 | x_2)
  # Store IV regression results
  iv_results[[i]] <- coef(iv_model)
}
# Create a matrix of coefficients
coeff_matrix_iv_1 <- matrix(unlist(iv_results), ncol = 2, byrow = TRUE,
                            dimnames = list(NULL, c("Intercept", "x_1")))
# Calculate and display the summary statistics for coefficients and intercept
coeff_summary_iv <- sapply(1:2, function(i) {
  c(
    obs = num_sim,
    mean = mean(coeff_matrix_iv_1[, i]),
    sd = sd(coeff_matrix_iv_1[, i]),
    min = min(coeff_matrix_iv_1[, i]),
    max = max(coeff_matrix_iv_1[, i])
  )
})
# Create a data frame for the summary statistics with row names
coeff_summary_df_iv <- data.frame(t(coeff_summary_iv), row.names = c("Intercept", "x_1"))
# Display the summary statistics for coefficients and intercept
print("Summary Statistics for Coefficients and Intercept for Model iv:")
print(coeff_summary_df_iv)



#Consider IV regressions of y on to x1.and consider x3 as instrument for x1 
# Store IV regression results
iv_results_2 <- vector("list", length = num_sim)
# Conduct simulations
for (i in 1:num_sim) {
  x <- rnorm(num_obs, mean = 1, sd = 1)
  v <- rnorm(num_obs, mean = 0, sd = 1)
  e1 <- rnorm(num_obs, mean = 0, sd = 0.25)
  e3 <- rnorm(num_obs, mean = 0, sd = 19)
  x_1 <- x + e1
  x_3 <- x + e3
  y <- 1 + 0.5 * x + v
  iv_model_2 <- ivreg(y ~ x_1 | x_3)
  
  # Store IV regression results
  iv_results_2[[i]] <- coef(iv_model_2)
}
# Create a matrix of coefficients
coeff_matrix_iv_2 <- matrix(unlist(iv_results_2), ncol = 2, byrow = TRUE,
                            dimnames = list(NULL, c("Intercept", "x_1")))
# Calculate and display the summary statistics for coefficients and intercept
coeff_summary_iv <- sapply(1:2, function(i) {
  c(
    obs = num_sim,
    mean = mean(coeff_matrix_iv_2[, i]),
    sd = sd(coeff_matrix_iv_2[, i]),
    min = min(coeff_matrix_iv_2[, i]),
    max = max(coeff_matrix_iv_2[, i])
  )
})
# Create a data frame for the summary statistics with row names
coeff_summary_df_iv <- data.frame(t(coeff_summary_iv), row.names = c("Intercept", "x_1"))
# Display the summary statistics for coefficients and intercept
print("Summary Statistics for Coefficients and Intercept for Model iv:")
print(coeff_summary_df_iv)



#Q6, plot kernel density estimates of both simulated IV estimates in a single plot
iv_x2 <- coeff_matrix_iv_1[ , "x_1"]
iv_x3 <- coeff_matrix_iv_2[ , "x_1"]
df <- data.frame(iv_x2 = c(iv_x2),
                 iv_x3 = c(iv_x3))
#remvoving extream values 
df<- df[-c(1,18, 20,7, 19, 27, 33,45), ]


ggplot(df, aes(x = iv_x2, fill = "iv_x2")) +
  geom_density(alpha = 0.5) +
  geom_density(aes(x = iv_x3, fill = "iv_x3"), alpha = 0.5) +
  labs(title = "Kernel Density Estimates of Two Variables",
       x = "Values",
       y = "Density") +
  scale_fill_manual(values = c("iv_x2" = "blue", "iv_x3" = "red"))

