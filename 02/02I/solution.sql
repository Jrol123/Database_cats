UPDATE Animals
SET Sex = 'm'
where Sex = 'male';

UPDATE Animals
SET Sex = 'w'
where Sex = 'female';

UPDATE Animals
SET Sex = 'unknown'
where SEX is not null
  and Sex not in ('m', 'w');
