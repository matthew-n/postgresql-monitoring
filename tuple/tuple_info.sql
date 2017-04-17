PREPARE tuple_info AS
SELECT relname as "relation", EXTRACT (EPOCH FROM current_timestamp-last_autovacuum) as since_last_av,
       autovacuum_count as av_count, n_tup_ins, n_tup_upd, n_tup_del, n_live_tup, n_dead_tup
FROM pg_stat_all_tables
WHERE schemaname = 'public'
ORDER BY relname;
