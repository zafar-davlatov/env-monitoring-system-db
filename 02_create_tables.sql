-- Countries
CREATE TABLE IF NOT EXISTS country (
    country_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Cities
CREATE TABLE IF NOT EXISTS city (
    city_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country_id BIGINT NOT NULL,
    CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Stations
CREATE TABLE IF NOT EXISTS station (
    station_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city_id BIGINT NOT NULL,
    CONSTRAINT fk_station_city FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- Sensors
CREATE TABLE IF NOT EXISTS sensor (
    sensor_id BIGSERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    station_id BIGINT NOT NULL,
    CONSTRAINT fk_sensor_station FOREIGN KEY (station_id) REFERENCES station(station_id)
);
