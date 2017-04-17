PREPARE queries AS
SELECT LEFT(query,50) AS query,
       calls, total_time, rows, shared_blks_hit,
       local_blks_hit, blk_read_time, blk_write_time
FROM pg_stat_statements
WHERE EXISTS(SELECT * FROM pg_available_extensions
             WHERE name = 'pg_stat_statements')
ORDER BY calls DESC;
