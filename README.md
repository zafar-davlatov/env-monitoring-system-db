# Environmental Monitoring Database

This project represents a physical database implementation based on a 3NF logical model.

## 📌 Description

The system is designed to store environmental monitoring data, including:
- Countries and cities
- Monitoring stations
- Sensors
- Measurements
- Users and roles

## 🧱 Structure

The database includes:
- 10+ tables
- Primary and foreign keys
- Many-to-many relationship (user_role)

## ⚙️ Constraints

- Measurement date must be greater than 2000-01-01
- Measurement values cannot be negative
- Gender is restricted to predefined values
- Unique constraints applied where necessary
- NOT NULL constraints used

## 📊 Data

- Each table contains at least 2 rows
- Total data exceeds 20 rows
- Data is meaningful and realistic

## 🕒 Additional

- `record_ts` field added using ALTER TABLE
- Default value: CURRENT_DATE

## ▶️ How to run

Execute SQL files in the following order:

1. 01_create_schema.sql  
2. 02_create_tables.sql  
3. 03_constraints.sql  
4. 04_insert_data.sql  
5. 05_alter_tables.sql  
