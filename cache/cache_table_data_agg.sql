PREPARE cache_table_data_agg AS
SELECT
    COUNT (relname) as cache_rel_cnt,
    COUNT (ratio) as cache_rel_data_any,
    COUNT (relname) FILTER (WHERE ratio >= 69) as cache_rel_data_68,
    COUNT (relname) FILTER (WHERE ratio >= 93) as cache_rel_data_93,
    round(sum(heap_blks_hit)/ NULLIF( SUM(heap_blks_hit + heap_blks_read), 0),2) as cache_data_ratio
from (
    select
       relname,
       heap_blks_read,
       heap_blks_hit,
       ( (heap_blks_hit*100) / NULLIF((heap_blks_hit + heap_blks_read), 0)) AS ratio
    from pg_statio_user_tables
) as s1
