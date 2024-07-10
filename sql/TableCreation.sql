CREATE TABLE PERSONNEL (
    Pid       integer     PRIMARY KEY NOT NULL,
    Name      char(50)    NOT NULL,
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

CREATE TABLE TL_ASSIGN (
    RecId     integer     PRIMARY KEY AUTOINCREMENT,
    Pid       integer     NOT NULL,
    Ccode     char(10)    NOT NULL,
    Type      char(1)     NOT NULL,
    XtraPay   real        NOT NULL CHECK(XtraPay>=0),
    AsmtNote  char(100)
);

