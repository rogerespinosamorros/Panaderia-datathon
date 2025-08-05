FROM python:3.10-slim

# Copia requirements.txt del modelo primero
COPY model/requirements.txt requirements.txt

# Instala dependencias del modelo
RUN pip install --no-cache-dir -r requirements.txt

# Luego instala MLflow (asegúrate que la versión coincida con la del modelo si da problemas)
RUN pip install --no-cache-dir mlflow==3.1.1

# Copia el modelo completo
WORKDIR /app
COPY model/ model/

# Exponer puerto
EXPOSE 5000

# Servir el modelo
CMD ["mlflow", "models", "serve", "-m", "model", "-h", "0.0.0.0", "-p", "5000", "--no-conda"]
