/* 
In this illustrative example we will revoke the teaching
assignments of the colleague "Billy Wong" who resigned. 
This is a query for looking up current assignments that 
are still active. So to record the RecId If necessary
*/
SELECT RecId, COURSE_INFO.Ccode, CName, Task, Unit 
  FROM TL_ASSIGN, COURSE_INFO, ACTIVITY_TYPE
  WHERE Pid = 382551 AND 
        isValid = 1 AND
        COURSE_INFO.Ccode = TL_ASSIGN.Ccode AND
        ACTIVITY_TYPE.Type = TL_ASSIGN.Type

/* Here bulk revoke RecId for resigning colleague */
INSERT INTO REVOKE_LIST (RecId, Reason)
  SELECT RecId, 
  "Wong Has resigned. He's now a banker in JPM. What a stupid guy, too bad!!!" AS Reason
  FROM TL_ASSIGN WHERE Pid = 382551;

/* 
Update validity for teaching assignments that are revoked.
Should not allow any functionality doing modification to the 
table TL_ASSIGN other than this one.
*/
UPDATE TL_ASSIGN
  SET isValid = 0 
  WHERE RecId in (
    SELECT RecId FROM REVOKE_LIST
  );
