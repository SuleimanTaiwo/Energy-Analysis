CREATE OR REPLACE VIEW vw_energy_consumption_per_capita AS
SELECT
    country,
    year,
    population,
    total_energy_twh,
    energy_per_capita_kwh
FROM v_energy_base
WHERE country IN (
    'Nigeria',
    'South Africa',
    'Brazil',
    'Indonesia',
    'Mexico'
)
AND energy_per_capita_kwh IS NOT NULL
AND total_energy_twh IS NOT NULL
AND year BETWEEN 2000 AND 2024;
