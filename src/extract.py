"""

Módulo de extração de dados da PokeAPI.

Objetivo:
- Consumir dados de Pokemon via API
- Coletar dados brutos
- Salvar dados coletados em JSON para processamento posterior

"""


import requests
import json

#Função que busca os dados de Pokemon baseado no id do mesmo nos registros da api
def get_pokemon(pokemon_id):
    url = f"https://pokeapi.co/api/v2/pokemon/{pokemon_id}"
    response = requests.get(url)

    if response.status_code == 200:
        return response.json()
    else:
        print(f"Erro ao buscar registro de {pokemon_id}")
        return None

data = []

# Loop para a extração apenas dos Pokemon 
# da 1ª geração presentes nos jogos 
# Pokemon Red, Green e Yellow.
for i in range(1, 152): 
    pokemon = get_pokemon(i)
    if pokemon:
        data.append(pokemon)

#Salva dados brutos em arquivo JSON
with open("data/raw/pokemon_raw_json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print("Dados extraídos com sucesso!")