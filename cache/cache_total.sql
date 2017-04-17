PREPARE cache_total AS
SELECT sum(heap_blks_read) AS heap_read,
       sum(heap_blks_hit)  AS heap_hit,
       (sum(heap_blks_hit)*100 / NULLIF((sum(heap_blks_hit) + sum(heap_blks_read)),0)) AS ratio
FROM pg_statio_user_tables;
