SELECT substr(max_id_filter.date, 0, 10 + 1)                      AS date,
--        SUM(CASE WHEN max_id_filter) as number_of_new
       SUM(CASE WHEN max_id_filter.status == 1 THEN 1 ELSE 0 END) AS number_of_completed
FROM incident_table
         JOIN(SELECT MAX(ID)     AS ID,
                     task_id,
                     timestamp   as date,
                     status_type as status
              FROM incident_table
              WHERE status_type in (1, 2)
              GROUP BY timestamp
              ORDER BY timestamp) AS max_id_filter
GROUP BY substr(max_id_filter.date, 0, 10 + 1)
ORDER BY max_id_filter.date;

SELECT MAX(ID)                               AS ID,
       task_id,
       substr(timestamp, 0, 10 + 1)          as date,
--        COUNt(status_type) as total_count,
       COUNT(IIF(status_type == 1, 1, NULL)) as count_true,
       COUNT(IIF(status_type == 2, 1, NULL)) as count_false
FROM incident_table
WHERE status_type in (1, 2)
GROUP BY substr(timestamp, 0, 10 + 1)
ORDER BY timestamp;