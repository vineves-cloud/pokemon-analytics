"""
Módulo de carga de dados

"""

import sqlite3
import pandas as pd

conn = sqlite3.connect("pokemon.db")


# Carregando arquivo CSV no BD

pokemon_df = pd.read_csv("data/processed/pokemon.csv")
types_df = pd.read_csv("data/processed/types.csv")
pokemon_types_df = pd.read_csv("data/processed/pokemon_types.csv")
abilities_df = pd.read_csv("data/processed/abilities.csv")
pokeomon_abilities_df = pd.read_csv("data/processed/pokemon_abilities.csv")
stats_df = pd.read_csv("data/processed/stats.csv")
pokemon_stats_df = pd.read_csv("data/processed/pokemon_stats.csv")


# Criar tabelas e inserir dados

pokemon_df.to_sql("pokemon", conn, if_exists="replace", index=False)
types_df.to_sql("types", conn, if_exists="replace", index=False)
pokemon_types_df.to_sql("pokemon_types", conn, if_exists="replace", index=False)
abilities_df.to_sql("abilities", conn, if_exists="replace", index=False)
pokeomon_abilities_df.to_sql("pokeomon_abilities", conn, if_exists="replace", index=False)
stats_df.to_sql("stats", conn, if_exists="replace", index=False)
pokemon_stats_df.to_sql("pokemon_stats", conn, if_exists="replace", index=False)


#Teste
cursor = conn.cursor()
cursor.execute("SELECT COUNT(*) FROM pokemon")
print("Total de pokemon: ", cursor.fetchone()[0])
      

#Fechar conexão
conn.close()

print("O banco foi criado e seus dados carregados.")