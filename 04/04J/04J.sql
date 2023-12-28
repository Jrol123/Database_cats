-- Надо брать последнюю и предпоследнюю поездки и смотреть на их пробег
-- Если пробег последней меньше пробега предпоследней  — БАН

WITH records AS (SELECT sellrecord.id                                           AS 'sale id',
                        a.id                                                    AS 'car id',
                        odometer,
                        LAG(odometer) OVER (PARTITION BY auto_id ORDER BY date) AS prev_odometer
                 FROM sellrecord
                          JOIN main.auto a on a.id = sellrecord.auto_id
                 ORDER BY date)
SELECT a.model,
       SUM(
               CASE WHEN rec.odometer < rec.prev_odometer THEN rec.prev_odometer - rec.odometer ELSE 0 END
       ) as probeg
FROM auto a
         JOIN records rec ON a.id = rec."car id"
GROUP BY a.model
ORDER BY probeg DESC;
