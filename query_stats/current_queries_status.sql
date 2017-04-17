PREPARE current_queries_status AS
SELECT count(pid), query, waiting from pg_stat_activity group by query, waiting;
