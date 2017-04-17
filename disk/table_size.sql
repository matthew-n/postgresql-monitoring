PREPARE table_sizes AS
SELECT relname AS "relation",
       pg_total_relation_size(C.oid) AS "total_size"
FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname NOT IN ('pg_catalog', 'information_schema')
      AND C.relkind <> 'i'
      AND nspname ='public'
ORDER BY pg_total_relation_size(C.oid) DESC;
