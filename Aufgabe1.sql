CREATE TABLE Studenten(
    MatrNr      INTEGER PRIMARY KEY,
    Name        CHAR(25),
    Semester    INT DEFAULT 1
);

CREATE TABLE Vorlesungen(
    VorlNr      INTEGER PRIMARY KEY,
    Titel       CHAR(30),
    SWS         INT NOT NULL,
    gelesenVon  INTEGER
);

CREATE TABLE Assistenten(
    PersNr      INTEGER PRIMARY KEY,
    Name        char(25),
    Fachgebiet  char(20),
    Boss        INTEGER
);

CREATE TABLE pruefen(
    MatrNr      INTEGER PRIMARY KEY,
    VorlNr      INTEGER PRIMARY KEY,
    PersNr      INTEGER,
    Note        DECIMAL NOT NULL
);

CREATE TABLE hoeren(
    MatrNr      INTEGER PRIMARY KEY,
    VorlNr      INTEGER PRIMARY KEY
);

CREATE TABLE voraussetzen(
    Vorgaenger  INTEGER PRIMARY KEY,
    Nachfolger  INTEGER PRIMARY KEY
);

CREATE TABLE Professoren(
    PersNr      INTEGER PRIMARY KEY,
    Name        char(25),
    Rang        char(10),
    Raum        INTEGER NOT NULL,
    HauptVL     INTEGER
);

-- Fremdschlüssel für gelesenVon

ALTER TABLE Vorlesungen
ADD CONSTRAINT FK_gelesenVon
FOREIGN KEY (gelesenVon)
    REFERENCES Professoren(PersNr)
ON DELETE NO ACTION;

-- Fremdschlüssel für HauptVL

ALTER TABLE Professoren
ADD CONSTRAINT FK_Vorlesungen
FOREIGN KEY (HauptVL)
    REFERENCES Vorlesungen(VorlNr)
ON DELETE NO ACTION;


