SELECT
    event_data.value('(event/@timestamp)[1]', 'datetime') AS DeadlockTime,
    event_data.value('(event/data/value/deadlock)[1]', 'varchar(max)') AS DeadlockGraph
FROM (
    SELECT CAST(target_data AS XML) AS TargetData
    FROM sys.dm_xe_session_targets st
    JOIN sys.dm_xe_sessions s
        ON s.address = st.event_session_address
    WHERE s.name = 'system_health'
) AS Data
CROSS APPLY TargetData.nodes('RingBufferTarget/event') AS XEventData(event_data)
WHERE event_data.value('(event/@name)[1]', 'varchar(50)') = 'xml_deadlock_report';
