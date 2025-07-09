import pandas as pd
import os

# Convierto archivos Excel a CSV (por si fuera útil más adelante)

DATA_RAW_DIR = r"d:\PersonalProjects\Panadería Datathon\data\raw"

# Cargar archivo Excel y convertir a CSV
articulos_panaderia_df = pd.read_excel(os.path.join(DATA_RAW_DIR, "ArticulosPanaderia.xlsx"))
articulos_panaderia_df.to_csv(os.path.join(DATA_RAW_DIR, "articulos_panaderia.csv"), index=False, encoding="utf-8")

cantidad_pedida_df = pd.read_excel(os.path.join(DATA_RAW_DIR, "CantidadPedida.xlsx"))
cantidad_pedida_df.to_csv(os.path.join(DATA_RAW_DIR, "cantidad_pedida.csv"), index=False, encoding="utf-8")

# Convertir Excel a CSV con varias hojas
archivo_excel = pd.ExcelFile(os.path.join(DATA_RAW_DIR, "Calendario.xlsx"))
for sheet in archivo_excel.sheet_names:
    calendario_df = archivo_excel.parse(sheet)
    calendario_df.to_csv(os.path.join(DATA_RAW_DIR, f"{sheet}.csv"), index=False, encoding="utf-8")


print("Preparación de datos completada")
