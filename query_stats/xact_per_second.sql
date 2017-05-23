PREPARE query_per_second
SELECT sum(xact_commit+xact_rollback) FROM pg_stat_database;
