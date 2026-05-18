CREATE OR REPLACE VIEW vw_nigeria_energy_gap AS
WITH latest_year AS (
    SELECT year
    FROM v_energy_base
    WHERE country IN ('Nigeria', 'Brazil')
      AND energy_per_capita_kwh > 0
      AND total_energy_twh > 0
    GROUP BY year
    HAVING COUNT(DISTINCT country) = 2
    ORDER BY year DESC
    LIMIT 1
),

brazil AS (
    SELECT 
        energy_per_capita_kwh AS brazil_energy_per_capita
    FROM v_energy_base, latest_year
    WHERE country = 'Brazil'
      AND v_energy_base.year = latest_year.year
),

nigeria AS (
    SELECT 
        country,
        population,
        total_energy_twh AS nigeria_actual_energy,
        energy_per_capita_kwh AS nigeria_energy_per_capita
    FROM v_energy_base, latest_year
    WHERE country = 'Nigeria'
      AND v_energy_base.year = latest_year.year
),

base AS (
    SELECT
        nigeria.country,
        nigeria.population,
        nigeria.nigeria_actual_energy,
        nigeria.nigeria_energy_per_capita,
        brazil.brazil_energy_per_capita,

        (brazil.brazil_energy_per_capita * nigeria.population) / 1e9
            AS nigeria_expected_energy_twh
    FROM nigeria
    CROSS JOIN brazil
)

SELECT
    *,
    -- Actual vs Expected
    CASE 
        WHEN nigeria_expected_energy_twh > 0 
         AND nigeria_actual_energy > 0
        THEN 
            (nigeria_actual_energy / nigeria_expected_energy_twh)
        ELSE NULL
    END AS actual_vs_expected,

    -- Energy gap
    CASE 
        WHEN nigeria_expected_energy_twh > 0 
         AND nigeria_actual_energy > 0
        THEN 
            ((nigeria_expected_energy_twh - nigeria_actual_energy)
             / nigeria_expected_energy_twh)
        ELSE NULL
    END AS energy_gap

FROM base;
