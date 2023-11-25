SELECT date        AS date,
       count_true  AS number_of_new,
       count_false AS number_of_completed
FROM (SELECT MAX(ID)                               AS ID,
                     task_id,
                     substr(timestamp, 0, 10 + 1)          as date,
--        COUNt(status_type) as total_count,
                     COUNT(IIF(status_type == 1, 1, NULL)) as count_true,
                     COUNT(IIF(status_type == 2, 1, NULL)) as count_false
              FROM incident_table
              WHERE status_type in (1, 2)
              GROUP BY substr(timestamp, 0, 10 + 1)
              ORDER BY timestamp) as max_id_filter
GROUP BY date
ORDER BY date;

SELECT MAX(ID)                               AS ID,
       task_id,
       substr(timestamp, 0, 10 + 1)          as date,
       COUNT(status_type)                    as total_count,
       COUNT(IIF(status_type == 1, 1, NULL)) as count_true,
       COUNT(IIF(status_type == 2, 1, NULL)) as count_false
FROM incident_table
WHERE status_type in (1, 2)
GROUP BY substr(timestamp, 0, 10 + 1)
ORDER BY timestamp;