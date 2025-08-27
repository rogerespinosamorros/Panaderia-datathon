FROM python:3.11-slim

# OpenMP para CatBoost/LightGBM
RUN apt-get update && apt-get install -y --no-install-recommends libgomp1 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
ENV PYTHONUNBUFFERED=1 PIP_DISABLE_PIP_VERSION_CHECK=1

# Versiones que exige el modelo
RUN pip install --no-cache-dir \
    mlflow==3.1.1 \
    numpy==2.3.1 \
    scipy==1.16.0 \
    pandas==2.3.1 \
    scikit-learn==1.7.0 \
    lightgbm==4.6.0 \
    catboost==1.2.8 \
    xgboost==3.0.2 \
    ipywidgets==8.1.7 \
    pyarrow==20.0.0 \
    psutil==7.0.0 \
    defusedxml==0.7.1 \
    graphviz==0.21 \
    cffi==1.17.1 \
    matplotlib==3.10.0 \
    typing_extensions==4.12.2
   

EXPOSE 8080
CMD ["bash","-lc","exec mlflow models serve -m runs:/${RUN_ID}/${ARTIFACT_PATH} --host 0.0.0.0 --port 8080 --env-manager=local"]
