# Set the working directory
setwd("~/Desktop/st2195")

# Load required libraries
library(ggplot2)
library(dplyr)
library(gridExtra) # For arranging multiple plots

# Read the dataset using relative path
df <- read.csv("titanic.csv", stringsAsFactors = FALSE)

# CRUCIAL STEP: Force all dataset column headers to lowercase
names(df) <- tolower(names(df))

# Clean/Factorize variables using completely lowercase column names
df$survived <- factor(df$survived, levels = c(0, 1), labels = c("Died", "Survived"))
df$pclass <- factor(df$pclass, levels = c(1, 2, 3), labels = c("1st Class", "2nd Class", "3rd Class"))
df$sex <- factor(df$sex)

# ==========================================
# 1. Bar charts for Gender, Class, and Survival
# ==========================================
p1_sex <- ggplot(df, aes(x = sex, fill = sex)) + 
  geom_bar() + theme_minimal() + labs(title = "Passenger Gender", y = "Count")

p1_class <- ggplot(df, aes(x = pclass, fill = pclass)) + 
  geom_bar() + theme_minimal() + labs(title = "Ticket Class", y = "Count")

p1_surv <- ggplot(df, aes(x = survived, fill = survived)) + 
  geom_bar() + theme_minimal() + labs(title = "Survival Distribution", y = "Count")

# Arrange the 3 bar charts side-by-side
grid.arrange(p1_sex, p1_class, p1_surv, ncol = 3)


# ==========================================
# 2. Age Histogram & Boxplots
# ==========================================
# Age Histogram
ggplot(df, aes(x = age)) + 
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black", na.rm = TRUE) + 
  theme_minimal() + labs(title = "Distribution of Passengers' Age", x = "Age", y = "Count")

# Age per Ticket Class Boxplot
ggplot(df, aes(x = pclass, y = age, fill = pclass)) + 
  geom_boxplot(na.rm = TRUE) + theme_minimal() + 
  labs(title = "Age Distribution per Ticket Class", x = "Ticket Class")

# Age based on Survival Boxplot
ggplot(df, aes(x = survived, y = age, fill = survived)) + 
  geom_boxplot(na.rm = TRUE) + theme_minimal() + 
  labs(title = "Age Distribution based on Survival", x = "Survival Status")


# ==========================================
# 3. Fare Histogram & Free Passengers Table
# ==========================================
# Travel Fare Histogram
ggplot(df, aes(x = fare)) + 
  geom_histogram(binwidth = 15, fill = "salmon", color = "black") + 
  theme_minimal() + labs(title = "Distribution of Travel Fares", x = "Fare", y = "Count")

# Free Passengers Table
free_passengers <- df %>% filter(fare == 0)
cat("Number of people who did not pay (Fare == 0):\n")
print(nrow(free_passengers))

# Write table to text file/CSV for repo completeness
write.csv(free_passengers, "free_passengers.csv", row.names = FALSE)


# ==========================================
# 4. Family Size per Ticket Class
# ==========================================
# Family Size = sibsp (siblings/spouses) + parch (parents/children) + 1
df$familysize <- df$sibsp + df$parch + 1

# Boxplot with point jittering to show continuous density distribution per class
ggplot(df, aes(x = pclass, y = familysize, fill = pclass)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.2, alpha = 0.3) +
  theme_minimal() + 
  labs(title = "Family Size per Ticket Class", x = "Ticket Class", y = "Family Size")


# ==========================================
# 5. Stacked Bar Charts (Survival by Gender and Class)
# ==========================================
ggplot(df, aes(x = pclass, fill = survived)) +
  geom_bar(position = "fill") +
  facet_wrap(~sex) +
  theme_minimal() +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Survival Rate by Gender and Ticket Class", x = "Ticket Class", y = "Percentage")

# ==========================================
# 6. Violin Chart: Survival vs Age and Gender
# ==========================================
ggplot(df, aes(x = survived, y = age, fill = sex)) +
  geom_violin(scale = "count", na.rm = TRUE, quantiles = 0.5) + # Fixed argument here
  theme_minimal() +
  labs(title = "Survival Distribution by Age and Gender", x = "Survival Status", y = "Age")


# ==========================================
# 7. Violin Chart: Survival Rate vs Age and Ticket Class
# ==========================================
ggplot(df, aes(x = survived, y = age, fill = pclass)) +
  geom_violin(scale = "count", na.rm = TRUE, quantiles = 0.5) + # Fixed argument here
  theme_minimal() +
  labs(title = "Survival Distribution by Age and Ticket Class", x = "Survival Status", y = "Age")
