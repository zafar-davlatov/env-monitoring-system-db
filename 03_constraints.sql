-- Measurements
CREATE TABLE IF NOT EXISTS measurement (
    measurement_id BIGSERIAL PRIMARY KEY,
    sensor_id BIGINT NOT NULL,
    measured_value NUMERIC(10,2) NOT NULL,
    measured_at DATE NOT NULL,
    
    -- constraints
    CONSTRAINT fk_measurement_sensor FOREIGN KEY (sensor_id) REFERENCES sensor(sensor_id),
    CONSTRAINT chk_measurement_value CHECK (measured_value >= 0),
    CONSTRAINT chk_measurement_date CHECK (measured_at > DATE '2000-01-01')
);

-- Users
CREATE TABLE IF NOT EXISTS app_user (
    user_id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    
    CONSTRAINT chk_gender CHECK (gender IN ('male', 'female'))
);

-- Roles
CREATE TABLE IF NOT EXISTS role (
    role_id BIGSERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

-- Many-to-many: user_roles
CREATE TABLE IF NOT EXISTS user_role (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    
    PRIMARY KEY (user_id, role_id),
    
    CONSTRAINT fk_ur_user FOREIGN KEY (user_id) REFERENCES app_user(user_id),
    CONSTRAINT fk_ur_role FOREIGN KEY (role_id) REFERENCES role(role_id)
);

-- Alerts
CREATE TABLE IF NOT EXISTS alert (
    alert_id BIGSERIAL PRIMARY KEY,
    measurement_id BIGINT NOT NULL,
    message TEXT NOT NULL,
    
    CONSTRAINT fk_alert_measurement FOREIGN KEY (measurement_id) REFERENCES measurement(measurement_id)
);

-- Devices
CREATE TABLE IF NOT EXISTS device (
    device_id BIGSERIAL PRIMARY KEY,
    serial_number VARCHAR(100) NOT NULL UNIQUE,
    station_id BIGINT NOT NULL,
    
    CONSTRAINT fk_device_station FOREIGN KEY (station_id) REFERENCES station(station_id)
);
