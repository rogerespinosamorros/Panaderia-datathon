# Este archivo esta hecho porque he tenido problemas con instalacions en pip y conda
import subprocess

# Obtener lista de paquetes conda
def get_conda_packages():
    result = subprocess.run(['conda', 'list'], capture_output=True, text=True)
    pkgs = set()
    for line in result.stdout.split('\n'):
        if line and not line.startswith(('#', '@')):
            pkg = line.split()[0]
            pkgs.add(pkg.lower())
    return pkgs

# Obtener lista de paquetes pip
def get_pip_packages():
    result = subprocess.run(['pip', 'list'], capture_output=True, text=True)
    pkgs = set()
    for line in result.stdout.split('\n')[2:]:
        if line:
            pkg = line.split()[0]
            pkgs.add(pkg.lower())
    return pkgs

conda_pkgs = get_conda_packages()
pip_pkgs = get_pip_packages()

duplicated = sorted(conda_pkgs & pip_pkgs)

if duplicated:
    print("Paquetes DUPLICADOS (instalados con conda y pip):")
    for pkg in duplicated:
        print(f"  - {pkg}")
    print("\nRecomendación: 'pip uninstall nombre_paquete' para cada uno (y después 'conda install' si lo necesitas).")
else:
    print("¡No hay paquetes duplicados entre conda y pip en este entorno! ")
