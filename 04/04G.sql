SELECT substr(max_id_filter.timestamp, 0, 10 + 1)    as date,
       COUNT(max_id_filter.status_type == 1) as number_of_new,
       COUNT(max_id_filter.status_type == 2) as number_of_completed
FROM incident_table
         JOIN(SELECT MAX(ID) AS ID, task_id, timestamp as date, status_type
              FROM incident_table
              GROUP BY timestamp, task_id
              HAVING status_type in (1, 2)) AS max_id_filter
GROUP BY max_id_filter.timestamp, max_id_filter.task_id
ORDER BY max_id_filter.timestamp;