# **Airline Passenger Satisfaction Analysis Project**

Welcome to the **Airline Passenger Satisfaction Analysis Project**! This project leverages data analysis, machine learning, and business intelligence to explore and predict factors influencing airline passenger satisfaction. The project includes data preprocessing, feature engineering, machine learning modeling, SQL queries for data analysis, and a Power BI dashboard for data visualization.

### **Project Structure:**

The project is organized into the following directories:

- **/dataset**: Contains the raw dataset for airline passenger satisfaction, which includes information about passengers' demographics, flight details, and service ratings.
  
- **/Jupyter Notebook (Python)**: This folder holds the Jupyter notebook for performing data cleaning, feature engineering, machine learning model training, and evaluation. Various machine learning algorithms are applied to predict passenger satisfaction.

- **/sql**: Contains SQL queries for data exploration and insight generation, used to filter, aggregate, and explore key patterns in the data.
  
- **/dataset after feature engineering**: This folder contains the dataset after data cleaning, transformation, and feature engineering. It is the version of the dataset used to train and test machine learning models.

- **/powerBI dashboard**: This directory holds the Power BI dashboard file, which is designed to visualize key metrics, trends, and insights from the dataset, such as satisfaction levels, service ratings, and passenger demographics.

### **How to Use This Project:**

1. **Clone the repository**: Clone this project to your local machine to start exploring the analysis.
   
   ```bash
   git clone https://github.com/Vishnugnath/Airline-passenger-satisfaction-analysis-project.git
   ```

2. **Install the required dependencies**: Make sure to install all the required Python libraries listed in the `requirements.txt` file for the notebook and analysis.
   
3. **Explore the Dataset**: Start by inspecting the raw dataset located in the `/dataset` folder. This file is the foundation of the entire analysis.

4. **Run the Jupyter Notebook**: Explore the Jupyter notebook for detailed steps of data cleaning, feature engineering, machine learning modeling, and evaluation. Open the notebook in a Jupyter environment and run the code in sequence.

5. **SQL Queries**: For detailed database analysis, refer to the SQL queries in the `/sql` folder. These queries help you explore different patterns and relationships within the dataset.

6. **Power BI Dashboard**: The Power BI dashboard in the `/powerBI dashboard` folder provides an interactive and visually appealing way to explore the insights from the analysis. Load the `.pbix` file in Power BI to explore the dashboard.

### **Project Workflow:**

1. **Data Preprocessing**:
   - **Cleaning**: The raw data is cleaned by handling missing values, outliers, and irrelevant records.
   - **Feature Engineering**: New features are created to improve the predictive power of the machine learning models.
   
2. **Machine Learning Models**:
   - Various models are trained using the cleaned dataset, including:
     - Logistic Regression
     - K-Nearest Neighbors (KNN)
     - Decision Trees
     - Naive Bayes
     - Support Vector Machines (SVM)
     - Random Forest
   - These models are evaluated using metrics like accuracy, precision, recall, and F1-score.

3. **SQL Queries**:
   - SQL queries are written to perform exploratory data analysis (EDA) and gain insights into customer satisfaction across various attributes.

4. **Power BI Dashboard**:
   - An interactive dashboard is created to provide an at-a-glance overview of key statistics and trends, as well as deeper insights into passenger satisfaction based on demographics and service ratings.

---

### **requirements.txt**

```plaintext
# Data manipulation
pandas==1.5.3
numpy==1.24.1

# Data visualization
matplotlib==3.7.1
seaborn==0.12.2
plotly==5.13.0

# Machine learning
scikit-learn==1.2.2
xgboost==1.7.4

# Feature engineering
feature-engine==1.5.0

# SQL support
mysql-connector-python==8.0.30

# Power BI API support
pbi-tools==1.2.3

# Jupyter notebook support
notebook==7.0.3
ipython==8.10.0
```

### **Notes:**

1. **`pandas`** and **`numpy`** are included for data manipulation, ensuring that you can handle and process datasets efficiently.
   
2. **`scikit-learn`** is used for building and evaluating machine learning models, including classification algorithms.

3. **`mysql-connector-python`** provides connectivity with MySQL databases for running SQL queries on the dataset.

4. **`pbi-tools`** is an optional dependency for working with Power BI from a Python environment, useful if automating report generation.

5. **`feature-engine`** is used for feature engineering, transforming the dataset into better-suited formats for machine learning.

---

### **Links to Key Files:**

- **Dataset**: [airline_passenger_satisfaction_data.csv](https://github.com/Vishnugnath/Airline-passenger-satisfaction-analysis-project/tree/main/dataset)
- **Jupyter Notebook**: [Airline passenger satisfaction project.ipynb](https://github.com/Vishnugnath/Airline-passenger-satisfaction-analysis-project/tree/main/Jupyter%20Notebook%20(Python))
- **SQL Queries**: [airline_project_sql.sql](https://github.com/Vishnugnath/Airline-passenger-satisfaction-analysis-project/tree/main/sql)
- **Cleaned and Feature-Engineered Dataset**: [airline_passenger_satisfaction_cleaned_data.csv](https://github.com/Vishnugnath/Airline-passenger-satisfaction-analysis-project/tree/main/dataset%20after%20feature%20engineering)
- **Power BI Dashboard**: [Airlane passenger satisfaction.pbix](https://github.com/Vishnugnath/Airline-passenger-satisfaction-analysis-project/tree/main/powerBI%20dashboard)

---

### **Conclusion:**

This project comprehensively explores airline passenger satisfaction, utilizing advanced data processing, machine learning techniques, and visualization tools. By analyzing and predicting satisfaction levels, the insights from this project can help airlines improve their services and enhance customer experiences.

