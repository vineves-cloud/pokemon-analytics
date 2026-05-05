-- name: top_pokemon
SELECT 
    p.name,
    SUM(ps.base_stat) AS total_stats
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
GROUP BY p.name
ORDER BY total_stats DESC
LIMIT 10;

-- name: weakest_pokemon
SELECT 
    p.name,
    SUM(ps.base_stat) AS total_stats
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
GROUP BY p.name
ORDER BY total_stats ASC
LIMIT 10;

-- name: avg_stats_by_type
SELECT 
    t.type_name,
    AVG(ps.base_stat) AS avg_stat
FROM pokemon p
JOIN pokemon_types pt ON p.pokemon_id = pt.pokemon_id
JOIN types t ON pt.type_id = t.type_id
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
GROUP BY t.type_name
ORDER BY avg_stat DESC;

-- name: ability_frequency_gen1
SELECT 
    a.ability_name,
    COUNT(pa.pokemon_id) AS frequency
FROM pokemon_abilities pa
JOIN pokemon p 
    ON pa.pokemon_id = p.pokemon_id
JOIN abilities a 
    ON pa.ability_id = a.ability_id
GROUP BY a.ability_name
ORDER BY frequency DESC
LIMIT 1;

-- name: most_common_types
SELECT 
    t.type_name,
    COUNT(*) AS total
FROM pokemon_types pt
JOIN types t ON pt.type_id = t.type_id
GROUP BY t.type_name
ORDER BY total DESC;