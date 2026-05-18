CREATE OR REPLACE VIEW v_dim_year_date AS
SELECT DISTINCT
    make_date(year, 1, 1) AS year_date
FROM v_energy_base
WHERE country IN (
    'Nigeria',
    'South Africa',
    'Brazil',
    'Indonesia',
    'Mexico'
)
AND year BETWEEN 2000 AND 2024
ORDER BY  year_date;
