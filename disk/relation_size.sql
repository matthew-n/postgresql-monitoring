PREPARE relation_sizes AS
SELECT relname AS "relation",
    pg_relation_size(C.oid) AS "size"
FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname = 'public'
ORDER BY pg_relation_size(C.oid) DESC;
