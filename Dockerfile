FROM python:3.11-slim

# ARG para permitir definir la carpeta del modelo en tiempo de build
ARG MODEL_DIR

# Copiamos los archivos del modelo
COPY model/${MODEL_DIR}/ /model/

# Instalamos dependencias
RUN pip install --no-cache-dir -r /model/requirements.txt || true
RUN pip install --no-cache-dir -r /model/python_env.yaml || true
RUN pip install --no-cache-dir mlflow==3.1.1

# Carpeta de trabajo
WORKDIR /app
COPY model/${MODEL_DIR}/ model/

EXPOSE 5000

CMD ["mlflow", "models", "serve", "-m", "model", "-h", "0.0.0.0", "-p", "5000", "--no-conda"]
