The Booking table is large, and queries that filter or group by date ranges on the start_date column are slow due to full table scans.
The goal is to partition the Booking table by start_date to improve query performance for date-based queries.
The partitioning strategy utilized is Range partitioning.