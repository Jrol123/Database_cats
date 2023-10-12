UPDATE Animals
SET Sex = CASE
    WHEN Sex = 'male' THEN 'm'
    WHEN Sex = 'female' THEN 'w'
    WHEN SEX is NULL THEN NULL
    ELSE 'unknown'
    END;