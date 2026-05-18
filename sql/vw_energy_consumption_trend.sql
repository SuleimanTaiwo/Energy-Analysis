CREATE OR REPLACE VIEW vw_energy_consumption_trend AS
SELECT
    country,
    year,
    

    -- macro
    population,
    gdp,

    -- energy totals
	total_energy_twh AS energy_consumption_twh,
    energy_per_capita_kwh,
    energy_intensity,

    -- fossil fuels
    oil_consumption_twh,
    oil_production,
    gas_consumption_twh,
    gas_production,
    coal_consumption_twh,
    coal_production,
    fossil_consumption_twh,
    fossil_share_energy,

    -- low carbon
    biofuel_consumption_twh,
    renewables_consumption_twh,
    low_carbon_consumption_twh,
    low_carbon_share_energy,

    -- trade
    net_elec_imports,
    net_elec_imports_share_demand,

    -- emissions
    co2_emissions

	
FROM v_energy_base
WHERE country IN (
    'Nigeria',
    'South Africa',
    'Brazil',
    'Indonesia',
    'Mexico'
)

AND year BETWEEN 2000 AND 2024;
