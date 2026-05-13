SELECT
    SUM(user_object_reserved_page_count) * 8 AS UserObjectKB,
    SUM(internal_object_reserved_page_count) * 8 AS InternalObjectKB,
    SUM(version_store_reserved_page_count) * 8 AS VersionStoreKB,
    SUM(unallocated_extent_page_count) * 8 AS FreeSpaceKB
FROM sys.dm_db_file_space_usage;
