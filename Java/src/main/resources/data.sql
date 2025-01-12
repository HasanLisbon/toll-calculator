DROP TABLE IF EXISTS toll_dates;
DROP TABLE IF EXISTS car_dates;
DROP TABLE IF EXISTS vehicles;
CREATE TABLE vehicles (
  vehicle_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  reg_number VARCHAR(255),
  vehicle_type VARCHAR(255),
  type VARCHAR(255),
  is_toll_free BOOLEAN
);

CREATE TABLE toll_dates (
  vehicle_id BIGINT NOT NULL,
  crossed_date TIMESTAMP,
  CONSTRAINT FK_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);


-- Re-enable foreign key constraints if disabled
SET REFERENTIAL_INTEGRITY TRUE;

INSERT INTO vehicles (vehicle_id, reg_number, vehicle_type, type, is_toll_free)
VALUES
    (1001, 'SSL259', 'CAR', 'Car', false),
    (1002, 'QST667', 'DIPLOMAT', 'Diplomat', false),
    (1003, 'SUI167', 'EMERGENCY', 'Emergency', false),
    (1004, 'YUI898', 'FOREIGN', 'Foreign', false),
    (1005, 'WER767', 'MILITARY', 'Military', false),
    (1006, 'POI231', 'MOTORBIKE', 'Motorbike', false),
    (1007, 'WQE098', 'TRACTOR', 'Tractor', false);

INSERT INTO toll_dates (vehicle_id, crossed_date)
    VALUES (1001, parsedatetime('01-01-2025 00:00:00', 'dd-MM-yyyy hh:mm:ss')),
    (1001, parsedatetime('01-01-2025 00:00:00', 'dd-MM-yyyy hh:mm:ss')),
    (1002, parsedatetime('01-01-2025 00:00:00', 'dd-MM-yyyy hh:mm:ss')),
    (1003, parsedatetime('01-01-2025 00:00:00', 'dd-MM-yyyy hh:mm:ss')),
    (1004, parsedatetime('01-01-2025 00:00:00', 'dd-MM-yyyy hh:mm:ss')),
    (1005, parsedatetime('01-01-2025 00:00:00', 'dd-MM-yyyy hh:mm:ss')),
    (1006, parsedatetime('01-01-2025 00:00:00', 'dd-MM-yyyy hh:mm:ss'));

