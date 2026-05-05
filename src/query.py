import sqlite3
import pandas as pd


"""
    Lê arquivo SQL e transforma em dicionário: 
    {nome_query: sql}
    """
def load_queries(path):
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    
    queries = {}
    parts = content.split("-- name:")

    for part in parts[1:]:
        lines = part.strip().split("\n")
        name = lines[0].strip()
        sql = "\n".join(lines[1:]).strip()
        queries[name] = sql
    
    return queries

conn = sqlite3.connect("pokemon.db")

#carrega queries
queries = load_queries("sql/queries/analysis.sql")

#define a query a ser executada
query_name = input("Digite o nome da query: ")

if query_name not in queries:
    print("Query não encontrada!")
    print("Consultas disponíveis:", list(queries.keys()))
else:
    df = pd.read_sql_query(queries[query_name], conn)
    df.to_csv(f"data/analysis/{query_name}.csv", index=False)
    print(df)

conn.close()