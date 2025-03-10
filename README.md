# Recruitment Data Analysis

## Overview
This project analyzes recruitment data to evaluate candidate selection trends and hiring decisions. It involves data cleaning, statistical analysis, and visualization to gain insights into factors influencing hiring outcomes.

## Main Goal
The primary goal of this project is to analyze recruitment data and identify key factors that influence hiring decisions. By leveraging statistical techniques and data visualization, this project aims to:
- **Identify Hiring Patterns** – Understand how variables such as age, experience, education level, and interview scores impact the likelihood of being hired.
- **Optimize Recruitment Strategies** – Provide data-driven insights to improve candidate selection criteria and enhance hiring efficiency.
- **Detect Biases & Trends** – Analyze gender distribution, education levels, and recruitment strategies to ensure fair and inclusive hiring practices.
- **Enhance Data-Driven Decision-Making** – Use statistical measures (mean, variance, standard deviation) to support HR teams in making informed recruitment choices.
- **Provide Actionable Recommendations** – Suggest improvements to hiring strategies based on observed trends and analysis.

## Features
- **Data Exploration**: Loads and summarizes recruitment data.
- **Data Cleaning & Preprocessing**:
  - Handles missing values.
  - Encodes categorical variables.
  - Removes rare categories in `EducationLevel`.
- **Candidate Segmentation**:
  - Splits data into `Hired` and `Not Hired` groups.
  - Computes statistical measures (Mean, Median, Mode, Variance, Standard Deviation).
- **Data Visualization**:
  - Boxplots for `Age` and `InterviewScore` by hiring decision.
  - Histogram for `ExperienceYears`.
  - Bar chart for `EducationLevel`.
  - Pie chart for `Gender` distribution.

## Technologies Used
- R Programming
- `ggplot2`, `dplyr`, `DataExplorer`

## How to Run the Script
1. Install required packages:
   ```r
   install.packages(c("ggplot2", "dplyr", "DataExplorer"))
   ```
2. Place `recruitment_mydata.csv` in the working directory.
3. Run `Assignment.R` script step by step.

## Insights Gained
- **Age, Experience, and Interview Scores** significantly impact hiring decisions, with higher scores correlating with increased chances of selection.
- **Education Level Distribution**: Candidates with higher degrees, particularly those with Bachelor's or higher qualifications, tend to have better hiring rates.
- **Gender Trends**: While hiring rates differ between male and female candidates, gender diversity should be considered in recruitment strategies.
- **Data Quality Matters**: Handling missing values and removing outliers ensures a more accurate analysis.
- **Skill Scores & Personality Scores**: These factors also play a crucial role in hiring decisions, emphasizing the importance of soft skills along with technical expertise.
- **Recruitment Strategies Influence Hiring**: Certain recruitment strategies yield better results in terms of candidate quality and hiring success.

## Future Enhancements
- **Implement Machine Learning Models**: Apply Logistic Regression, Decision Trees, or Random Forest models to predict hiring decisions based on historical data.
- **Feature Importance Analysis**: Perform correlation analysis and feature selection to determine the most significant factors affecting hiring decisions.
- **Automate Data Preprocessing**: Develop a streamlined pipeline for real-time recruitment insights.
- **Explore Bias in Hiring**: Investigate potential biases in hiring decisions related to gender, education, or experience levels.
- **Advanced Visualization Dashboards**: Use `Shiny` in R to build an interactive dashboard for HR teams.

## Recommendations
- **Enhance Data Collection**: Ensure all key variables, including soft skills assessments and behavioral scores, are consistently recorded.
- **Improve Recruitment Strategies**: Leverage insights from data to refine hiring processes and optimize candidate selection criteria.
- **Promote Diversity in Hiring**: Address any disparities in hiring trends related to gender or education level by implementing inclusive hiring practices.
- **Optimize Candidate Screening**: Utilize predictive analytics to identify top candidates early in the recruitment process.
- **Regularly Update Hiring Models**: Continuously refine statistical models to adapt to changing recruitment trends and company needs.

## Author
This project was developed by Marzooq Habib Mohamadu as part of a personal study on Recruitment Data Analysis

