PREPARE cache_table_agg AS
SELECT
  	round(sum(heap_blks_hit*100)/ NULLIF( SUM(heap_blks_hit + heap_blks_read), 0),2) as rel_data_hit_pct,
    round((COUNT (ratio)*100) / NULLIF(COUNT (relname),0),2)  rel_chaced_pct,
    COUNT (ratio) as rel_cached,
    COUNT (relname) FILTER (WHERE ratio >= 69) as rel_cached_68_cnt,
    COUNT (relname) FILTER (WHERE ratio >= 93) as rel_cahced_93_cnt

from (
    select
       relname,
       heap_blks_read,
       heap_blks_hit,
        NULLIF((heap_blks_hit + heap_blks_read), 0) as heap_total,
        ((heap_blks_hit*100) / NULLIF((heap_blks_hit + heap_blks_read), 0)) AS ratio
    from pg_statio_user_tables
) as s1;
