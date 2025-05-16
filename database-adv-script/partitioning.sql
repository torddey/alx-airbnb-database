ALTER TABLE Booking RENAME TO Booking_old;

-- Creating the partitioned Booking table
CREATE TABLE BOOKING (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date) -- Include the partitioning column
) PARTITION BY RANGE (start_date);

-- Createing partitions for different year ranges
CREATE TABLE booking_y2023 PARTITION OF Booking FOR VALUES FROM ('2023-01-01') TO ('2023-12-31');
CREATE TABLE booking_y2024 PARTITION OF Booking FOR VALUES FROM ('2024-01-01') TO ('2024-12-31');
CREATE TABLE booking_y2025 PARTITION OF Booking FOR VALUES FROM ('2025-01-01') TO ('2025-12-31');
-- Creatinge a partition for future bookings
CREATE TABLE booking_future PARTITION OF Booking FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);
-- Create a default partition for any data that doesn't fit into the ranges (optional but recommended)
CREATE TABLE booking_other PARTITION OF Booking DEFAULT;

-- Indexes on the partitioned tables as needed
CREATE INDEX idx_booking_y2023_property_id ON booking_y2023 (property_id);
CREATE INDEX idx_booking_y2024_property_id ON booking_y2024 (property_id);
CREATE INDEX idx_booking_y2025_property_id ON booking_y2025 (property_id);
CREATE INDEX idx_booking_future_property_id ON booking_future (property_id);
CREATE INDEX idx_booking_other_property_id ON booking_other (property_id);

