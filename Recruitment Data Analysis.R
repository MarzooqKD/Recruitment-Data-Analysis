getwd()
setwd("/Users/marzooqhabibmohamadu/Documents/R LABWORKS")

# read data
Mydata <- read.csv("recruitment_mydata.csv")
Mydata

# summary Stastisics
summary(Mydata)

# Data Profiling
library(DataExplorer)
create_report(Mydata)

#Display first few rows of data
head(Mydata)

# Check the structure of the datasets
str(Mydata)

# Validate data types
cat("Data type validation:\n")
data_types <- sapply(Mydata, class)
print(data_types)

# Check for duplication
duplicates <- Mydata[duplicated(Mydata), ]
print(duplicates)

# Check for missing values
sum(is.na(Mydata))
missing_vals <- colSums(is.na(Mydata))
print(missing_vals)

# Replace missing numeric values with the mean
Mydata$Age[is.na(Mydata$Age)] <- mean(Mydata$Age, na.rm = TRUE)
Mydata$ExperienceYears[is.na(Mydata$ExperienceYears)] <- mean(Mydata$ExperienceYears, na.rm = TRUE)
Mydata$InterviewScore[is.na(Mydata$InterviewScore)] <- mean(Mydata$InterviewScore, na.rm = TRUE)
Mydata$SkillScore[is.na(Mydata$SkillScore)] <- mean(Mydata$SkillScore, na.rm = TRUE)
Mydata$PersonalityScore[is.na(Mydata$PersonalityScore)] <- mean(Mydata$PersonalityScore, na.rm = TRUE)

sum(is.na(Mydata))
missing_vals <- colSums(is.na(Mydata))
print(missing_vals)


#Checking the most frequent in Gender
gender_count <- table(Mydata$Gender)
print(gender_count)

#Checking the most frequent in EducationLevel
EducationLevel_count <- table(Mydata$EducationLevel)
print(EducationLevel_count)

# Replace missing categorical values with the most frequent category
Mydata$Gender[is.na(Mydata$Gender)] <- "Male" 
Mydata$EducationLevel[is.na(Mydata$EducationLevel)] <- "Bachelor's (Type 2)"  

# Convert categorical variables into factors
Mydata$Gender <- as.factor(Mydata$Gender)
Mydata$EducationLevel <- as.factor(Mydata$EducationLevel)
Mydata$RecruitmentStrategy <- as.factor(Mydata$RecruitmentStrategy)

# Check the structure to confirm encoding
str(Mydata)

# Generate boxplots to check for outliers
boxplot(Mydata)


#Deleting outliers
table(Mydata$EducationLevel)
rare_threshold <- 5
education_level_freq <- table(Mydata$EducationLevel)
rare_categories <- names(education_level_freq[education_level_freq < rare_threshold])
Mydata <- Mydata[!(Mydata$EducationLevel %in% rare_categories), ]
table(Mydata$EducationLevel)
dim(Mydata)
boxplot(Mydata)





# Breaking it into 2 groups (Hired and Not_Hired)
hired_data <- subset(Mydata, HiringDecision == 1, 
                     select = c(Age, ExperienceYears, InterviewScore))
not_hired_data <- subset(Mydata, HiringDecision == 0, 
                         select = c(Age, ExperienceYears, InterviewScore))

# Check the structure of both dataset
str(hired_data)
str(not_hired_data)

# Measure of Central Tendency
#Defined Function to calculate mode
get_mode <- function(x) {
  uniq_values <- unique(x)
  uniq_values[which.max(tabulate(match(x, uniq_values)))]
}

# Calculating mean, median, and mode for 'Hired' group
hired_means <- colMeans(hired_data, na.rm = TRUE)
hired_median <- apply(hired_data, 2, median, na.rm = TRUE)
hired_mode <- sapply(hired_data, get_mode)

# Create a dataframe to display the central tendency measures for 'Hired'
hired_cot <- data.frame(hired_means, hired_median, hired_mode)
print("Hired - Measures of Central Tendency:")
print(hired_cot)

# Measure of Dispersion
# Calculating variance and standard deviation for 'Hired'
hired_variance <- sapply(hired_data, var, na.rm = TRUE)
hired_sd <- sapply(hired_data, sd, na.rm = TRUE)

# Create a dataframe to display the measures of dispersion for 'Hired'
hired_dispersion <- data.frame(hired_variance, hired_sd)
print("Hired - Measures of Dispersion:")
print(hired_dispersion)

data.frame(hired_cot, hired_dispersion)

# Calculating mean, median, and mode for 'Not_Hired' group
not_hired_means <- colMeans(not_hired_data, na.rm = TRUE)
not_hired_median <- apply(not_hired_data, 2, median, na.rm = TRUE)
not_hired_mode <- sapply(not_hired_data, get_mode)

# Create a dataframe to display the cen4tral tendency measures for 'Not_Hired'
not_hired_cot <- data.frame(not_hired_means, not_hired_median, not_hired_mode)
print("Not_Hired - Measures of Central Tendency:")
print(not_hired_cot)

# Calculating variance and standard deviation for 'Not_Hired'
not_hired_variance <- sapply(not_hired_data, var, na.rm = TRUE)
not_hired_sd <- sapply(not_hired_data, sd, na.rm = TRUE)

# Create a dataframe to display the measures of dispersion for 'Not_Hired'
not_hired_dispersion <- data.frame(not_hired_variance, not_hired_sd)
print("Not_Hired - Measures of Dispersion:")
print(not_hired_dispersion)

data.frame(not_hired_cot, not_hired_dispersion)


library(ggplot2)
library(dplyr)


# Boxplot for Age by HiringDecision 
ggplot(Mydata, aes(x = factor(HiringDecision), y = Age, fill = factor(HiringDecision))) +
  geom_boxplot() +
  labs(title = "Boxplot of Age by Hiring Decision", x = "Hiring Decision", y = "Age") +
  theme_minimal() +
  scale_fill_manual(values = c("red", "blue"))

# Boxplot for InterviewScore by HiringDecision 
ggplot(Mydata, aes(x = factor(HiringDecision), y = InterviewScore, fill = factor(HiringDecision))) +
  geom_boxplot() +
  labs(title = "Boxplot of Interview Score by Hiring Decision", x = "Hiring Decision", y = "Interview Score") +
  theme_minimal() +
  scale_fill_manual(values = c("orange", "pink"))


# Histograms for ExperienceYears by HiringDecision
ggplot(Mydata, aes(x = ExperienceYears, fill = factor(HiringDecision))) +
  geom_histogram(binwidth = 1, position = "dodge", alpha = 0.7, color = "black") +
  labs(title = "Histogram of Experience Years by Hiring Decision", x = "Experience Years", y = "Frequency") +
  theme_minimal()






# Bar chart for EducationLevel by HiringDecision
education_counts <- Mydata %>%
  group_by(EducationLevel, HiringDecision) %>%
  summarise(count = n())

ggplot(education_counts, aes(x = EducationLevel, y = count, fill = factor(HiringDecision))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Bar Chart of Education Level by Hiring Decision", x = "Education Level", y = "Frequency") +
  theme_minimal()

#Pie chart for Gender By HiringDecison
# Grouping by Gender and HiringDecision and calculating counts
gender_counts <- Mydata %>%
  group_by(Gender, HiringDecision) %>%
  summarise(count = n(), .groups = 'drop')

# Calculate percentages
gender_counts <- gender_counts %>%
  group_by(HiringDecision) %>%
  mutate(percentage = count / sum(count) * 100)

# Pie chart for Gender by HiringDecision
ggplot(gender_counts, aes(x = "", y = percentage, fill = Gender)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Pie Chart of Gender Distribution by Hiring Decision") +
  facet_wrap(~ HiringDecision) +
  theme_void() +
  geom_text(aes(label = paste0(round(percentage, 1), "%")), 
            position = position_stack(vjust = 0.5), 
            color = "black") +  # Add percentage labels
  scale_fill_brewer(palette = "Set3")  # Optional: change color palette



