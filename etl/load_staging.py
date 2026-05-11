from dotenv import load_dotenv
import os
import pandas as pd
from sqlalchemy import create_engine

# Carrega variaveis do .env
load_dotenv()

# Variáveis
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

# Conexão PostgreSQL
engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

# Teste conexão
with engine.connect() as conn:
    print("Conexão realizada com sucesso!")
    
# Pasta bases

DATA_PATH = r"C:\Users\Yann\Desktop\Projeto\data\raw"

files = os.listdir(DATA_PATH)

# Loop nos arquivos para ingestão no banco

for file in files:
    if file.endswith(".csv"):
        #Caminho Completo
        file_path = os.path.join(DATA_PATH, file)
        table_name = (
          file
        .replace("olist_", "")
        .replace("_dataset.csv", "")
        .replace(".csv", "")
        )
        
        #Leitura csv
        df = pd.read_csv(file_path)
        
        # Carga Postgres
        df.to_sql(
            name=table_name,
            con=engine,
            schema="staging",
            if_exists="replace",
            index=False
        )

        print(f"{table_name} carregada com sucesso")
print("Carga finalizada")

    
