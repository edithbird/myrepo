library(psych)
fs <- read.csv("fs.csv", header = T, stringsAsFactors = T)
head(fs)
str(fs)

# Perform the two single regressions and save them in a variable
model_years <- lm(fs$salary ~ fs$years)
model_pubs <- lm(fs$salary ~ fs$pubs)
summary(model_years)
summary(model_pubs)


# Perform the two single regressions and save them in a variable
model_years <- lm(fs$salary ~ fs$years)
model_pubs <- lm(fs$salary ~ fs$pubs)

# Plot both enhanced scatter plots in one plot matrix of 1 by 2
par(mfrow = c(1, 2))
plot(fs$salary ~ fs$years, main = "plot_years", xlab = "years", ylab = "salary")
abline(model_years)
plot(fs$salary ~ fs$pubs, main = "plot_pubs", xlab = "pubs", ylab = "salary")
abline(model_pubs)

# fs is available in your working environment

# Do a single regression of salary onto years of experience and check the output
model_1 <- lm(fs$salary ~ fs$years)
summary(model_1)

# Do a multiple regression of salary onto years of experience and numbers of publications and check the output
model_2 <- lm(fs$salary ~ fs$years + fs$pubs)
summary(model_2)

# Save the R squared of both models in preliminary variables
preliminary_model_1 <- summary(model_1)$r.squared
preliminary_model_2 <- summary(model_2)$r.squared

# Round them off while you save them in a vector
r_squared <- c()
r_squared[1] <- 
  round(preliminary_model_1,3)
r_squared[2] <- round(preliminary_model_2,3)

# Print out the vector to see both R squared coefficients
r_squared

# Do multiple regression and check the regression output
model_3 <- lm(fs$salary ~ fs$years + fs$pubs + fs$age)
summary(model_3)

# Round off the R squared coefficients and save the result in the vector (in one step!)
r_squared[3] <- round(summary(model_3)$r.squared, 3)
r_squared[3]
# Print out the vector in order to display all R squared coefficients simultaneously
r_squared


#Categorical coding
# Summary statistics by department
describeBy(fs, fs$dept)

# #dept must be a factor
str(fs)
fs$dept <- factor(fs$dept)
fs$dept

#Creating dummy variables
dept_code <- dummy.code(fs$dept)
dept_code

# Merge the dataset in an extended dataframe
extended_fs <- cbind(dept_code, fs)
extended_fs

# Provide summary statistics
summary(extended_fs)

# Regress salary against years and publications
model <- lm(fs$salary ~ fs$years + fs$pubs)
# Apply the summary function to get summarized results for model
summary(model)

# Compute the confidence intervals for model
confint(model)

# Create dummies for the categorical variable fs$dept by using the C() function
dept_code <- C(fs$dept, treatment)

# Regress salary against years, publications and department
model_dummy <- lm(fs$salary ~ fs$years + fs$pubs + dept_code)

# Apply the summary function to get summarized results for model_dummy
summary(model_dummy)

# Compute the confidence intervals for model_dummy
confint(model_dummy)

# Compare model 4 with model 3
anova(model, model_dummy)

# Actual means of fs$salary
tapply(fs$salary, fs$dept, mean)

# Number of levels
fs$dept

#Unweighted
# Factorize the categorical variable fs$dept and name the factorized variable dept.f
dept.f <- factor(fs$dept)
dept.f
# Assign the 3 levels generated in step 2 to dept.f
contrasts(dept.f) <-contr.sum(3)
dept.f
# Regress salary against dept.f
model_unweighted <- lm(fs$salary ~ dept.f)
summary(model_unweighted)



#Weighted
# Factorize the categorical variable fs$dept and name the factorized variable dept.g
dept.g <- factor(fs$dept)

# Assign the weights matrix to dept.g
contrasts(dept.g) <- weights

# Regress salary against dept.f and apply the summary() function
model_weighted <- lm(fs$salary ~ dept.g)

# Apply the summary() function
summary(model_weighted)
anova(model_unweighted, model_weighted)

