SELECT RecId, COURSE_INFO.Ccode, CName, Task, Unit 
  FROM TL_ASSIGN, COURSE_INFO, ACTIVITY_TYPE
  WHERE Pid = 382551 AND 
        COURSE_INFO.Ccode = TL_ASSIGN.Ccode AND
        ACTIVITY_TYPE.Type = TL_ASSIGN.Type

/* Bulk revoke RecId for resigning colleague */
 
INSERT INTO REVOKE_LIST (RecID, Reason)
  SELECT RecID, 
  "Wong Has resigned. He's now a banker in JPM. What a stupid guy, too bad!!!" AS Reason
  FROM TL_ASSIGN WHERE Pid = 382551;

/* Update teaching assignments that are revoked.
   The entr point for this functionality should be kept out of 
   the reach of the teaching load manager. */
UPDATE TL_ASSIGN
  SET isValid = 0 
  WHERE RecId in (
    SELECT RecID FROM REVOKE_LIST
  );
