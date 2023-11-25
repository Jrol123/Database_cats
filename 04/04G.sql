SELECT substr(max_id_filter.date, 0, 10 + 1) as date
--        SUM(CASE WHEN max_id_filter) as number_of_new
--        COUNT(max_id_filter.status_type == 2) as number_of_completed
FROM incident_table
         JOIN(SELECT MAX(ID)   AS ID,
                     task_id,
                     timestamp as date,
                     status_type as status
              FROM incident_table
              WHERE status_type in (1, 2)
              GROUP BY timestamp) AS max_id_filter
GROUP BY max_id_filter.date, max_id_filter.task_id
ORDER BY max_id_filter.date;