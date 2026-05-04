CREATE TABLE pokemon(
    pokemon_id INTEGER PRIMARY KEY,
    name TEXT,
    height INTEGER,
    weight INTEGER,
    base_experience INTEGER
);


CREATE TABLE types(
    type_id INTEGER PRIMARY KEY,
    type_name TEXT
);

CREATE TABLE pokemon_types(
    pokemon_id INTEGER,
    type_id INTEGER,
    FOREING KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREING KEY (type_id) REFERENCES types(type_id)
);

CREATE TABLE abilities(
    ability_id INTEGER PRIMARY KEY,
    ability_name TEXT
);


CREATE TABLE pokemon_abilities(
    pokemon_id INTEGER,
    ability_id INTEGER,
    is_hidden BOOLEAN,
    FOREING KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREING KEY (ability_id) REFERENCES abilities(ability_id)
);

CREATE TABLE stats(
    stats_id INTEGER PRIMARY KEY,
    stat_name TEXT
);

CREATE TABLE pokemon_stats(
    pokemon_id INTEGER,
    stat_id INTEGER,
    base_stat INTEGER,
    FOREING KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREING KEY (stat_id) REFERENCES stats(stat_id)
);