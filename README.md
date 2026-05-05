# Pokémon Analytics

Projeto de engenharia e análise de dados com a PokeAPI, organizado em etapas de extração, transformação, carga, SQL e visualização.

## Objetivo

Construir um pipeline completo de dados para:

- extrair dados da API pública da PokeAPI
- tratar e normalizar os registros com Python
- carregar os dados em um banco SQLite
- executar consultas SQL analíticas
- evoluir para um dashboard no Data Studio

## Status do projeto

- Extração de dados: concluída
- Transformação e modelagem: concluídas
- Carga em banco SQLite: concluída
- Consultas SQL: concluídas
- Dashboard no Data Studio: em andamento

## Stack

- Python
- Jupyter
- Pandas
- Requests
- SQLite
- SQL
- Google Sheets
- Data Studio

## Estrutura do repositório

```bash
pokemon-analytics/
├── data/
│   ├── raw/
│   └── processed/
├── dashboard/
├── docs/
├── notebooks/
├── sql/
│   └── queries/
├── src/
├── README.md
├── requirements.txt
└── .gitignore
```

## Pipeline

### 1. Extração
Consumo da PokeAPI e salvamento do JSON bruto em `data/raw/`.

### 2. Transformação
Tratamento dos dados brutos em tabelas analíticas com:
- `pokemon`
- `types`
- `pokemon_types`
- `abilities`
- `pokemon_abilities`
- `stats`
- `pokemon_stats`

### 3. Carga
Carregamento dos CSVs processados para um banco SQLite (`pokemon.db`).

### 4. SQL
Execução de consultas analíticas para ranking, agregações e exploração dos dados.

### 5. Visualização
Preparação do dataset para conexão no Data Studio.

## Principais análises

- Top Pokémon por soma de stats
- Média de stats por tipo
- Pokémon com mais habilidades
- Distribuição de tipos

## Como executar

### Instalar dependências
```bash
pip install -r requirements.txt
```

### Extrair dados
```bash
python src/extract.py
```

### Transformar dados
```bash
python src/transform.py
```

### Carregar no banco
```bash
python src/load.py
```

### Rodar consultas
```bash
python src/query.py
```

## Próximos passos

- concluir o dashboard no Data Studio
- incluir prints no README
- refinar os insights finais
- publicar o projeto como estudo completo de dados

## Observação

Este projeto foi desenvolvido para demonstrar prática em engenharia de dados, modelagem relacional, SQL e visualização de dados.