# 📊 Bakery Sales Forecasting — Final Project for Master's in Data Science & Analytics

This project is the final capstone for the Master’s Degree in Data Science and Analytics. Its goal is to build a complete system for sales analysis, forecasting, and visualization for a bakery. The solution covers everything from database connection and exploratory data analysis (EDA) to predictive modeling and dashboard creation using Power BI.

---

## 🧩 Project structure

1. **Database connection**  
   Using SQLAlchemy, the project connects to a relational database composed of three key tables:
   - `sales`: daily records of units sold.
   - `products`: detailed product information.
   - `calendar`: date-related data, holidays, and time features.

2. **Exploratory Data Analysis (EDA)**  
   Visual and statistical exploration of the data to understand:
   - Sales trends by product.
   - Seasonality and time-based patterns.
   - Effects of holidays and weekdays.

3. **Preprocessing and preparation for Machine Learning**  
   - Data cleaning and transformation.
   - Feature engineering: time-based and aggregated variables.
   - Scaling and encoding of features.

4. **Predictive modeling**  
   A fully automated pipeline is built to train a separate model for each of the **15 different products**.
   - Built with `scikit-learn` and custom metrics.
   - Experiment tracking and logging with **MLflow**.
   - Prediction of monthly sales for the **next month**.

5. **Deployment and predictions**  
   - The model is served as an **API using Docker**, simulating a production environment.
   - Predictions are retrieved by sending requests to the model endpoint.

6. **Visualization in Power BI**  
   An interactive report is created to:
   - Compare predictions with historical sales.
   - Visualize trends by product and category.
   - Filter by date, product, or day type (weekend/holiday).

---

## 🛠️ Technologies used

- **Language & analysis:** Python (Pandas, NumPy, Polars)
- **Modeling:** scikit-learn, MLflow
- **EDA & plotting:** Seaborn, Matplotlib
- **Database:** SQL, SQLAlchemy
- **Deployment:** Docker
- **Reporting & BI:** Power BI

---

## 🚀 How to run the project

1. Clone this repository and set up the Python environment.
2. Ensure access to the SQL database.
3. Run the pipeline to train and predict sales for all products.
4. Launch the Docker container to serve the model.
5. Use the API to get predictions.
6. Load the output into Power BI for interactive reporting.

---

## 📂 Folder structure

├── data/                 # Datasets (raw or processed)
├── mlartifacts/          # MLflow artifacts (models, metrics, etc.)
├── mlruns/               # MLflow experiment logs
├── model/                # Trained models and related scripts
├── notebooks/            # EDA and exploratory development
├── outputs/              # Predictions and files for Power BI
├── scripts/              # Main pipeline, data processing, and ML code
├── .env                  # Environment variables (should not be pushed)
├── .gitignore            # Git ignore rules
├── Dockerfile            # Docker container to serve the model as an API
├── requirements.txt      # Python dependencies
├── README.es.md          # Spanish version of the documentation
└── README.en.md          # English version of the documentation
