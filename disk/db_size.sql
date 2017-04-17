PREPARE db_size AS
SELECT pg_database_size(current_database());
