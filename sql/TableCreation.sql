CREATE TABLE PERSONNEL (
    Pid       integer     PRIMARY KEY NOT NULL,
    Name      char(50)    NOT NULL,
    Intro_Pub char(500),
    Note      char(500),
    Capacity  real        NOT NULL CHECK(Capacity>=0)
);

CREATE TABLE COURSE_PAY (
    Ccode     char(10)    UNIQUE NOT NULL,
    NumLec    integer     NOT NULL CHECK(NumLec>-1),
    NumTut    integer     NOT NULL CHECK(NumTut>-1),
    NumCrd    integer     NOT NULL CHECK(NumCrd>-1),
    RateLec   real        NOT NULL CHECK(RateLec>=0),
    RateTut   real        NOT NULL CHECK(RateTut>=0),
    RateCrd   real        NOT NULL CHECK(RateCrd>=0),   
    XtraBdj   real        NOT NULL CHECK(XtraBdj>=0)
);

CREATE TABLE COURSE_INFO (
    Ccode     char(10)    UNIQUE NOT NULL,
    CName     char(50)    NOT NULL,
    CDesc     char(500)
);

CREATE TABLE COURSE_ENROLL (
    Ccode     char(10)    UNIQUE NOT NULL,
    StuNum    integer     NOT NULL CHECK(StuNum>0)
);

CREATE TABLE TL_ASSIGN (
    RecId     integer     PRIMARY KEY AUTOINCREMENT,
    Pid       integer     NOT NULL,
    Ccode     char(10)    NOT NULL,
    Type      char(1)     NOT NULL,
    /*
    Coding List:
    ----------------
    L: Lecture
    T: Tutorial
    C: Coordination
    X: None of the three above 
        (i.e. only other tasks, to be compensated from XtraPay budget).
    ----------------
    If a worker is involved in more than one type of activities, for the
    sake of clarity it should be entered for multiple times. 
    E.g. if a worker is teaching three groups of tutorials and is receiving
    another 30 hours of working credits for supervising students' projects,
    it should be entered into two records, one for code T, with 3 units, and 
    another with code X, and 30.0 for XtraPay. For the second record the Unit
    field can be left as zero, or used to store other information, like the
    assigned number of teams which can be ad-hoc for the specific task (and 
    to be clarified in the AsmtNote field).
    */
    Unit      integer     NOT NULL,
    XtraPay   real        NOT NULL CHECK(XtraPay>=0),
    AsmtNote  char(100)
);

