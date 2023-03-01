#Importing Dataset
Efficiency <- read.csv("Efficiency.csv", stringsAsFactors = FALSE)

# Viewing Dataset
View(Efficiency)

# Datatypes Check
str(Efficiency)

# Datatype Conversion
Efficiency$Gender <- as.factor(Efficiency$Gender)
Efficiency$Exercise_frequency <- as.factor(Efficiency$Exercise_frequency)
Efficiency$Smoking_status <- as.factor(Efficiency$Smoking_status)
Efficiency$Sleep_efficiency <- as.factor(Efficiency$Sleep_efficiency)

# Datatypes Recheck
str(Efficiency)

# Express Table for people Smoking_status
prop.table(table(Efficiency$Smoking_status))

# Importing Library
library(ggplot2)


# People Survival Count Bar graph
ggplot(Efficiency, aes(x = Smoking_status)) + theme_classic() + 
  geom_bar() + 
  labs(y = "People count", title = "Efficiency Sleep_efficiency")


# Gender wise survival Plot
ggplot(Efficiency, aes(x = Gender, fill = Smoking_status)) + theme_light() + 
  geom_bar() + 
  labs(y = "People count", 
       title = "Efficiency Sleep_efficiency by gender")


# Plot for survival based on smoking category
ggplot(Efficiency, aes(x = Exercise_frequency, fill = Smoking_status)) + theme_light() + 
  geom_bar() + 
  labs(y = "People count", 
       title = "Efficiency Sleep_efficiency by smoking category")


# Plot for gender based Sleep_efficiency from each smoking category
ggplot(Efficiency, aes(x = Gender, fill = Smoking_status)) + theme_light() + 
  facet_grid(~Exercise_frequency) + geom_bar() + 
  labs(y = "People count", 
       title = "Efficiency Sleep_efficiency by Smoking_status and gender")


# Pie chart for Sleep_efficiency
ggplot(Efficiency, aes(x = "", fill = Smoking_status)) + 
  geom_bar(position = "fill") + 
  facet_grid(~Exercise_frequency) + coord_polar(theta = "y")


# Plot for Age group Sleep_efficiency distribution
ggplot(Efficiency, aes(x = Age, fill = Smoking_status)) + 
  theme_bw() + geom_histogram(binwidth = 5) +
  labs(y = "People count", x = "Age", 
       title = "Efficiency Age distribution")


# Box Plot for Sleep_efficiency by Age
ggplot(Efficiency, aes(x = Smoking_status, y = Age)) + theme_bw() + 
  geom_boxplot() + 
  labs(y = "Age", x = "Smoking_status", 
       title = "Efficiency Sleep_efficiency by Age")


# Density plot
ggplot(Efficiency, aes(x = Age, fill = Smoking_status)) + theme_bw() + 
  facet_wrap(Gender~Exercise_frequency) + geom_density(alpha = 0.5) + 
  labs(y = "Age", x = "Smoking_status", 
       title = "Efficiency Sleep_efficiency by Age, class and gender")
