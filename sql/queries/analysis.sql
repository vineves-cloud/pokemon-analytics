-- name: top_pokemon
SELECT 
    p.name,
    SUM(ps.base_stat) AS total_stats
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
GROUP BY p.name
ORDER BY total_stats DESC
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

-- name: pokemon_most_abilities
SELECT 
    p.name,
    COUNT(pa.ability_id) AS total_abilities
FROM pokemon p
JOIN pokemon_abilities pa ON p.pokemon_id = pa.pokemon_id
GROUP BY p.name
ORDER BY total_abilities DESC;

-- name: most_common_types
SELECT 
    t.type_name,
    COUNT(*) AS total
FROM pokemon_types pt
JOIN types t ON pt.type_id = t.type_id
GROUP BY t.type_name
ORDER BY total DESC;