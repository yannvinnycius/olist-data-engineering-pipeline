import subprocess

print("Iniciando pipeline...")

#Executa staging, se erro o processo para.
print("Executando staging...")
subprocess.run(['python', "etl/load_staging.py"], check=True)

#Executa silver, se erro o processo para.
print("Executando silver...")
subprocess.run(['python', "etl/run_silver.py"], check=True)

#Executa gold, se erro o processo para.
print("Executando gold...")
subprocess.run(['python', "etl/run_gold.py"], check=True)

print("Pipeline executado com sucesso!")