import subprocess
import logging

# Configuração log
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    filename="pipeline.log",
    filemode="a"
)

# Função execução
def run_step(step_name, command):

    try:

        print(f"Executando: {step_name}")
        logging.info(f"Executando: {step_name}")

        subprocess.run(command, check=True)

        print(f"{step_name} executado com sucesso!")
        logging.info(f"{step_name} executado com sucesso!")

    except subprocess.CalledProcessError as e:

        print(f"Erro ao executar {step_name}")
        logging.error(f"Erro ao executar {step_name}: {e}")

        raise

# Pipeline
print("Iniciando pipeline...")
logging.info("Iniciando pipeline...")

run_step(
    "Staging",
    ["python", "etl/load_staging.py"]
)

run_step(
    "Silver",
    ["python", "etl/run_silver.py"]
)

run_step(
    "Gold",
    ["python", "etl/run_gold.py"]
)

print("Pipeline executado com sucesso!")
logging.info("Pipeline executado com sucesso!")