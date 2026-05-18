CREATE OR REPLACE VIEW v_dim_country AS
SELECT DISTINCT
    country
FROM v_energy_base
WHERE country IN (
    'Nigeria',
    'South Africa',
    'Brazil',
    'Indonesia',
    'Mexico'
)
AND year BETWEEN 2000 AND 2024
ORDER BY country
