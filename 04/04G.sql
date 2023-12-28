SELECT date,
       SUM(new_statuses) OVER (ORDER BY date)       AS number_of_new,
       SUM(completed_statuses) OVER (ORDER BY date) AS number_of_completed
FROM (SELECT STRFTIME('%Y-%m-%d', timestamp)             AS date,
             CASE WHEN last_status = 1 THEN 1 ELSE 0 END AS new_statuses,
             CASE WHEN last_status = 2 THEN 1 ELSE 0 END AS completed_statuses
      -- Подсчёт статусов
      FROM (SELECT id as ID,
                   LAST_VALUE(status_type) OVER (
                       PARTITION BY STRFTIME('%d', timestamp), task_id
                       ORDER BY timestamp
                       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                       -- Используется весь раздел
                       )
                      AS last_status,
                   timestamp,
                   task_id
            -- Выборка последнего состояния для каждой записи
            FROM incident_table)
      GROUP BY timestamp, task_id
      ORDER BY timestamp)
GROUP BY date;
-- Финальный подсчёт
