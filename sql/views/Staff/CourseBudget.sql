CREATE VIEW Course_Buget_Overview AS
SELECT Course_Code, Course_Name, Course_Budget, Enrolment, 
CAST(round(Course_Budget/COURSE_ENROLL.StuNum,2) AS NUMERIC(18,2)) AS Cost_per_Student 

FROM
    (SELECT 
        COURSE_PAY.Ccode AS Course_Code,
        COURSE_INFO.CName AS Course_Name, 
        (NumLec*RateLec + NumTut*RateTut + NumCrd*RateCrd + XtraBdj) AS Course_Budget,
        COURSE_ENROLL.StuNum AS Enrolment   
    FROM COURSE_PAY, COURSE_INFO, COURSE_ENROLL 
    WHERE COURSE_PAY.Ccode = COURSE_INFO.Ccode AND COURSE_INFO.Ccode=COURSE_ENROLL.Ccode
    ) TMP_A,
    COURSE_ENROLL

WHERE TMP_A.Course_Code = COURSE_ENROLL.Ccode;
