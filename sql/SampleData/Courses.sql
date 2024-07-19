/*  Insert Sample Courses, Teachers and Teaching assignments*/

INSERT INTO COURSE_PAY 
    (Ccode, NumLec, NumTut, NumCrd, RateLec, RateTut, RateCrd, XtraBdj)
VALUES
    ("ECO001", 1, 12, 1, 70.0,  30.0, 120.0,  0.0),
    ("ECO002", 1, 14, 1, 70.0,  30.0, 160.0,  0.0),
    ("ECO003", 3,  0, 1, 35.0,   0.0,  80.0, 25.0),
    ("MAT001", 1, 18, 1, 70.0,  35.0, 130.0,  0.0),
    ("MAT002", 1,  3, 1, 55.0,  30.0,  50.0,120.0),
    ("CS0001", 1,  2, 1,200.0,  80.0,  25.0,  0.0);


INSERT INTO COURSE_INFO
    (Ccode, CName, CDesc)
VALUES
    ("ECO001", "International Economics", "Do you want to understand the fundermentals of International trade and global finance? Come to this course! In the journey of the teaching period we will xxxxxx and yyyyy..."),
    ("ECO002", "Macroeconomics", "What are the fundermentals behind the operation of a country's economic system? How do different stake holders react to xxxxx and yyyy? And what about zzzzz and aaaaa? ...."),
    ("ECO003", "Development Studies", "Why some countries are rapidly growing, while some others were poor and are stay poor? After this course you will be able to xxxxx"),
    ("MAT001", "Calculus", "Basic Calculus intended for first year university students in Non-math faculties"),
    ("MAT002", "Linear Programming", "This course introduces linear programming and the simplex method. In the end of the course students will apply the knowledge to a real-life project."),
    ("CS0001", "Introduction to Programming", "Attention: This course focuses on control flows and data structure. We do NOT teach any particular language." );
    


INSERT INTO COURSE_ENROLL
    (Ccode, StuNum)
VALUES
    ("ECO001", 455),
    ("ECO002", 520),
    ("ECO003", 135),
    ("MAT001", 525),
    ("MAT002", 105),
    ("CS0001",  60);

     
