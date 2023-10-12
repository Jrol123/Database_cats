SELECT Value,
       CASE
           WHEN Value > 0 THEN 'positive'
           WHEN Value < 0 THEN 'negative'
           ELSE 'zero'
       End As Classification
From Numbers;