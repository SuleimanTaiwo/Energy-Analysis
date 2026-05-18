CREATE OR REPLACE VIEW vw_GDP_Growth_Rate_10_Year AS

WITH latest AS (
    SELECT year, gdp
    FROM v_energy_base
    WHERE country = 'Nigeria'
      AND gdp > 0
    ORDER BY year DESC
    LIMIT 1
)

SELECT
    l.year AS latest_year,
    ((l.gdp / p.gdp) - 1) AS gdp_growth_10yr
FROM latest l
JOIN v_energy_base p
    ON p.country = 'Nigeria'
   AND p.year = l.year - 10;
