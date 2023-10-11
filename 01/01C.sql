SELECT ABS(A + B) FROM ListOfNumbers as tab1;
SELECT C FROM OtherTable as tab2;

INSERT INTO OtherTable (C) VALUES (tab1 + tab2)
-- INSERT INTO OtherTable (C) VALUES ((SELECT ABS(A + B) FROM ListOfNumbers) + (SELECT C FROM OtherTable))