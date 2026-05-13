SELECT
    session_id,
    status,
    start_time,
    total_elapsed_time / 1000 AS ElapsedSeconds,
    cpu_time,
    logical_reads,
    reads,
    writes,
    command
FROM sys.dm_exec_requests
WHERE status = 'running'
ORDER BY total_elapsed_time DESC;
