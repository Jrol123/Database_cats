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
ORDER BY substr(timestamp, 0, 10 + 1);

SELECT MAX(ID)         AS ID,
       task_id,
       DATE(timestamp) as date
--        COUNT(IIF(status_type == 1, 1, NULL)) AS number_of_new,
--        COUNT(IIF(status_type == 2, 1, NULL)) AS number_of_completed
FROM incident_table
-- WHERE status_type in (1, 2)
--   AND DATE(timestamp) >= (SELECT DATE(MAX(DATE(timestamp)), '-30 day') FROM incident_table)
GROUP BY ID, date
ORDER BY date;

-- 1. Смотришь на запись
-- 2. Фильтруешь заявки, которые были до неё на -30 дней
-- 3. Выбираешь последние действия с заявками за весь промежуток
-- 4. Фильтруешь заявки по статусу (1 или 2).
-- 5. Считаешь

SELECT MAX(ID)         AS ID,
       task_id,
       DATE(timestamp) as date
FROM incident_table
         JOIN (SELECT MAX(ID)         AS sub_ID,
                      task_id         as sub_task_id,
                      DATE(timestamp) as sub_date
               FROM incident_table
               GROUP BY ID
               ORDER BY sub_date) AS full_table
WHERE DATE('2017-12-29', '-30 days') <= full_table.sub_date
AND DATE('2017-12-29') >= full_table.sub_date
GROUP BY ID
ORDER BY date;

SELECT 2017 - 12 - 02 <= DATE(DATE(timestamp), '-30 day') as date
FROM incident_table
GROUP BY ID
ORDER BY date;

UPDATE incident_table
SET timestamp = '2023-11-25 18:34:40'
WHERE id = 7;
