# 📊 Predicción de Ventas para Panadería — Proyecto Final Máster en Data Science y Analítica

Este proyecto forma parte del trabajo final del Máster en Data Science y Analítica, y tiene como objetivo construir un sistema completo de análisis, predicción y visualización de ventas para una panadería. La solución abarca desde la conexión a la base de datos, pasando por el análisis exploratorio de datos y el modelado predictivo, hasta la creación de visualizaciones interactivas mediante Power BI.

---

## 🧩 Estructura del proyecto

1. **Conexión a la base de datos**  
   Utilizando SQLAlchemy, se accede a una base de datos relacional que contiene tres tablas clave:
   - `ventas`: registros diarios de unidades vendidas.
   - `productos`: información detallada de los productos.
   - `calendario`: fechas, días festivos y variables temporales.

2. **Análisis exploratorio de datos (EDA)**  
   Estudio visual y estadístico para entender:
   - Tendencias de venta por producto.
   - Estacionalidad y comportamiento temporal.
   - Efectos de festivos y días de la semana.

3. **Preprocesado y preparación para Machine Learning**  
   - Limpieza y transformación de datos.
   - Creación de variables temporales y agregadas.
   - Escalado de variables y codificación de variables categóricas.

4. **Modelado predictivo**  
   Se ha construido un pipeline automatizado para entrenar un modelo por cada uno de los **15 productos** diferentes.  
   - Uso de `scikit-learn` para los modelos y métricas.
   - Registro de experimentos y métricas con **MLflow**.
   - Predicción del volumen de ventas para el **mes siguiente**.

5. **Despliegue y predicciones**  
   - El modelo se sirve como una **API mediante Docker**, simulando un entorno de producción.
   - Las predicciones se obtienen a través de peticiones al endpoint del modelo.

6. **Visualización en Power BI**  
   Se crea un reporte interactivo que permite:
   - Comparar predicciones con ventas históricas.
   - Visualizar tendencias por producto y categoría.
   - Filtrar por fecha, producto o tipo de día (laboral/festivo).

---

## 🛠️ Tecnologías utilizadas

- **Lenguaje y análisis:** Python (Pandas, NumPy, Polars)
- **Modelado:** scikit-learn, MLflow
- **Visualización y EDA:** Seaborn, Matplotlib
- **Base de datos:** SQL, SQLAlchemy
- **Despliegue:** Docker
- **Visualización final:** Power BI

---

## 🚀 Ejecución del proyecto

1. Clona este repositorio y configura el entorno.
2. Asegúrate de tener acceso a la base de datos SQL.
3. Ejecuta el pipeline para entrenamiento y predicción de los productos.
4. Lanza el contenedor Docker para servir el modelo.
5. Consume la API para obtener predicciones.
6. Carga los datos en Power BI para análisis visual.

---

## 📂 Estructura de carpetas

```
├── data/                 # Conjuntos de datos utilizados (crudos o transformados)
├── mlartifacts/          # Artefactos generados por MLflow (modelos, métricas, etc.)
├── mlruns/               # Registros de experimentos de MLflow
├── model/                # Modelos entrenados o scripts relacionados con el modelado
├── notebooks/            # Análisis exploratorio y desarrollo inicial
├── outputs/              # Predicciones y resultados listos para Power BI
├── scripts/              # Código principal (pipelines, funciones, preparación de datos)
├── .env                  # Variables de entorno (no subir a GitHub)
├── .gitignore            # Archivos y carpetas ignorados por Git
├── Dockerfile            # Configuración del contenedor para servir el modelo como API
├── requirements.txt      # Dependencias del entorno Python
├── README.es.md          # Documentación en español
└── README.en.md          # Documentation in English
```
