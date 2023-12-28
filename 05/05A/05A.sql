WITH ActiveInsurance AS (
    -- Выбор людей с активной мед-страховкой
    SELECT DISTINCT PersonalData.ID
    FROM MedicalInsurance
             JOIN PersonalData ON MedicalInsurance.ID = PersonalData.MedicalInsuranceID
    WHERE Status = 'active')
SELECT COUNT(*) AS TotalPeopleWithMI
FROM (
     -- Берём уникальность
     SELECT ActiveInsurance.ID
     FROM ActiveInsurance
              LEFT JOIN Doctors ON ActiveInsurance.ID = Doctors.PersonalDataID
              LEFT JOIN Patients ON ActiveInsurance.ID = Patients.PersonalDataID
     WHERE Doctors.ID IS NOT NULL
        OR Patients.ID IS NOT NULL);
