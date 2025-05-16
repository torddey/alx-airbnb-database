-- INDEXES FOR THE USER TABLE--
CREATE INDEX idx_user_email ON "USER" (email);      --Index on the email column--



-- INDEXES FOR THE BOOKING TABLE--
CREATE INDEX idx_booking_property_id ON BOOKING (property_id);      -- Index on the property_id column --

CREATE INDEX idx_booking_user_id ON BOOKING (user_id);      -- Index on the user_id column --

CREATE INDEX idx_booking_start_date ON BOOKING (start_date);        -- Index on the start_date column --

CREATE INDEX idx_booking_end_date ON BOOKING (end_date);        -- Index on the end_date column --

CREATE INDEX idx_booking_property_start ON BOOKING (property_id, start_date);       -- Composite index on property_id and start_date --



-- INDEXES FOR THE PROPERTY TABLE --
CREATE INDEX idx_property_host_id ON PROPERTY (host_id);        -- Index on the host_id column --

CREATE INDEX idx_property_name ON PROPERTY (name);      -- Index on the name column --
