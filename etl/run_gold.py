from dotenv import load_dotenv
import os
from sqlalchemy import create_engine, text

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

#Caminho scripts sql 
SQL_PATH = r"sql/gold"

#Lista arquivos SQL
sql_files = sorted(os.listdir(SQL_PATH))

#Executa Scripts
with engine.connect() as conn:
    for file in sql_files:
        if file.endswith(".sql"):
            print(f"Executando: {file}")
            with open(os.path.join(SQL_PATH, file), "r", encoding="utf-8") as f:
                sql = f.read()
            
            conn.execute(text(sql))
            conn.commit()
            
print("Camada Gold executada com sucesso")            
            
          
        