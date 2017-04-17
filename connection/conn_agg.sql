PREPARE conn_agg AS
SELECT
	count(*) as conn_count,
	count(*) FILTER (where state = 'active') as conn_active,
	count(*) FILTER (where state ~ 'idle') as conn_idle,
	count(*) FILTER (where waiting) as conn_blocked
from pg_stat_activity ;
