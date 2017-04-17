PREPARE cache_tables AS
SELECT relname AS "relation",
       heap_blks_read AS heap_read,
       heap_blks_hit AS heap_hit,
       ( (heap_blks_hit*100) / NULLIF((heap_blks_hit + heap_blks_read), 0)) AS ratio
FROM pg_statio_user_tables;
