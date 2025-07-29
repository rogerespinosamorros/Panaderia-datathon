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

### Observaciones
- Los productos más caóticos obtuvieron mejores resultados con clasificación binaria.
- Se aplicó balance de clases (`scale_pos_weight`) y ajuste de umbral manual para mejorar recall en clase 1 (alta demanda).

