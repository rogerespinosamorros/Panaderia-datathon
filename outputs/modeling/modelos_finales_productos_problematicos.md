# ✅ Modelos finales para productos problemáticos

Este documento resume las decisiones de modelado para los productos con peores resultados iniciales de regresión (basado en MAPE).

---

## 🔹 Producto 6425
- Modelo final: RandomForestClassifier
- Clasificación: Binaria
- Accuracy: 0.77
- Umbral ajustado: No necesario (buenos resultados iniciales)

---

## 🔹 Producto 5403
- Modelo final: RandomForestClassifier
- Clasificación: Binaria
- Accuracy: 0.84
- Umbral ajustado: No necesario

---

## 🔹 Producto 5404
- Modelo final: RandomForestClassifier
- Clasificación: Binaria
- Accuracy: 0.79
- Umbral ajustado: No necesario

---

## 🔹 Producto 6451
- Modelo final: XGBClassifier
- Clasificación: Binaria
- Accuracy: 0.66
- Umbral ajustado: ✅ 0.31 (óptimo según F1)

---

## 🔹 Producto 6523
- Modelo final: XGBClassifier
- Clasificación: Binaria
- Accuracy: 0.64
- Umbral ajustado: ✅ 0.40

---

## 🔹 Producto 6549
- Modelo final: XGBClassifier
- Clasificación: Binaria
- Accuracy: 0.72
- Umbral ajustado: ✅ 0.27

---

 Observaciones
- Los productos más caóticos obtuvieron mejores resultados con clasificación binaria.
- Se aplicó balance de clases (`scale_pos_weight`) y ajuste de umbral manual para mejorar recall en clase 1 (alta demanda).

## ✅ Producto 417 


Clasificación **binaria** de la demanda como:
- `0`: Demanda normal o baja (≤ 1000 unidades)
- `1`: Demanda alta (> 1000 unidades)

---


**GradientBoostingClassifier** (scikit-learn), dentro de un `Pipeline` con:

- Preprocesador (`ColumnTransformer`) que incluye:
  - Escalado y media para variables numéricas
  - One-hot encoding para variables categóricas

No se utilizó `class_weight` porque no mejoraba los resultados.

---

 **Variables utilizadas
- `precio`
- `dia_semana` (0-6)
- `mes` (1-12)
- `is_weekend`
- `is_start_of_month`
- `cantidad_lag1`, `cantidad_lag2`, `cantidad_lag3`
- `rolling_mean_3`, `rolling_std_3`
- `diff_lag1_lag2` (lag1 - lag2)

---

 📊 Métricas finales (validación con TimeSeriesSplit, 3 folds)

| Clase        | Precision | Recall | F1-score | Soporte promedio |
|--------------|-----------|--------|----------|------------------|
| No alta (0)  | 0.645     | 0.720  | 0.664    | 8.67             |
| Alta (1)     | 0.625     | 0.379  | 0.408    | 5.33             |
| **Accuracy** |           |        | **59.5%**|                  |

---

 🗃️ Notas para MLflow
- Guardar el pipeline completo (`preprocessor + GradientBoostingClassifier`)
- Registrar `model_input_schema` con las 11 features listadas
- Usar `target_name = 'clase_binaria'`
- Umbral de conversión a binario: `cantidad > 1000`

---

## Producto 900

## ⚙️ Configuración del experimento

- **Modelo:** `ExtraTreesClassifier` (`class_weight='balanced'`)
- **Validación:** `TimeSeriesSplit(n_splits=5)`
- **Target binarizado:**  
  - Umbral en el **percentil 60** de `cantidad`
  - `clase_demanda = (cantidad > cantidad.quantile(0.6)).astype(int)`
- **Features utilizadas:**
  - `precio`
  - `dia_semana`
  - `mes`
  - `festivo` (convertido a 0/1)
  - `cantidad_lag1`
  - `cantidad_lag2`
  - `cantidad_lag3`
- **Preprocesamiento:**
  - Numéricas: imputación por media + escalado
  - Categóricas: imputación por moda + one-hot encoding