SELECT TOP 10
    qs.total_worker_time / qs.execution_count AS AvgCPUTime,
    qs.execution_count,
    qs.total_worker_time,
    SUBSTRING(qt.text,
        (qs.statement_start_offset/2)+1,
        ((CASE qs.statement_end_offset
            WHEN -1 THEN DATALENGTH(qt.text)
            ELSE qs.statement_end_offset
        END - qs.statement_start_offset)/2)+1) AS QueryText,
    DB_NAME(qt.dbid) AS DatabaseName
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
ORDER BY AvgCPUTime DESC;
