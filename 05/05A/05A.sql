-- Требуется подсчитать количество постояльцев (врачей и пациентов) больницы, у которых есть актуальные полисы ОМС.
-- (TotalPeopleWithMI), где TotalPeopleWithMI - количество постояльцев больницы с актуальными полисами ОМС.
WITH ActiveInsurance AS (SELECT DISTINCT PersonalData.ID
                         FROM MedicalInsurance
                                  JOIN PersonalData ON MedicalInsurance.ID = PersonalData.MedicalInsuranceID
                         WHERE Status = 'active')
SELECT COUNT(*) AS TotalPeopleWithMI
FROM (SELECT ActiveInsurance.ID
      FROM ActiveInsurance
               LEFT JOIN Doctors ON ActiveInsurance.ID = Doctors.PersonalDataID
               LEFT JOIN Patients ON ActiveInsurance.ID = Patients.PersonalDataID
      WHERE Doctors.ID IS NOT NULL
         OR Patients.ID IS NOT NULL);
