CREATE OR REPLACE VIEW v_energy_base AS
SELECT
    -- identifiers
    country,
    iso_code,
    year::INT,

    -- macro
    population::NUMERIC,
    gdp::NUMERIC,

    -- energy totals
    total_energy_twh::NUMERIC,
    energy_per_capita_kwh::NUMERIC,
    energy_intensity::NUMERIC,

    -- fossil fuels
    oil_consumption_twh::NUMERIC,
    oil_production::NUMERIC,
    gas_consumption_twh::NUMERIC,
    gas_production::NUMERIC,
    coal_consumption_twh::NUMERIC,
    coal_production::NUMERIC,
    fossil_consumption_twh::NUMERIC,
    fossil_share_energy::NUMERIC,

    -- low carbon
    biofuel_consumption_twh::NUMERIC,
    renewables_consumption_twh::NUMERIC,
    low_carbon_consumption_twh::NUMERIC,
    low_carbon_share_energy::NUMERIC,

    -- trade
    net_elec_imports::NUMERIC,
    net_elec_imports_share_demand::NUMERIC,

    -- emissions
    co2_emissions::NUMERIC

FROM energy_master
WHERE iso_code IN ('NGA','ZAF','BRA','IDN','MEX');