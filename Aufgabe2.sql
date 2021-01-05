-- Query 1
SELECT
    MatrNr
FROM
    hoeren
WHERE
    VorlNr = 5041;

-- Ergebnis
-- "matrnr"
-- 28106
-- 29120
----------------------------------------------------------------------
-- Query 2
select
    distinct Studenten.name
from
    Studenten
where
    MatrNr in (
        select
            MatrNr
        from
            hoeren
        where
            VorlNr IN (
                select
                    VorlNr
                from
                    hoeren
                where
                    hoeren.MatrNr = (
                        select
                            MatrNr
                        from
                            Studenten
                        where
                            name = 'Schopenhauer'
                    )
            )
    )
    and not MatrNr = (
        select
            MatrNr
        from
            Studenten
        where
            name = 'Schopenhauer'
    );

-- Ergebnis
-- "name"
-- "Theophrastos             "
-- "Fichte                   "
-- "Feuerbach                "
---------------------------------------------------------
-- Query 2 & 3 identical?
---------------------------------------------------------
-- Query 4
select
    nachfolger
from
    voraussetzen
group by
    nachfolger
having
    count(nachfolger) >= 2;

-- Ergebnis
-- "nachfolger"
-- 5052
---------------------------------------------------------
-- Query 5
select
    Vorlnr,
    count(*) as Anzahl
from
    pruefen
group by
    vorlnr
order by
    vorlnr asc;

-- Ergebnis
-- "vorlnr","anzahl"
-- 4630,1
-- 5001,1
-- 5041,1
---------------------------------------------------------
-- Query 6
select
    name
from
    professoren
where
    persnr in (
        select
            boss
        from
            (
                select
                    count(*) as Anzahl,
                    boss
                from
                    assistenten
                group by
                    boss
            ) as t2
        where
            t2.Anzahl = (
                select
                    max(Anzahl) as MaxAnzahl
                from
                    (
                        select
                            count(*) as Anzahl,
                            boss
                        from
                            assistenten
                        group by
                            boss
                    ) as t1
            )
    )

-- Ergebnis
-- "name"
-- "Sokrates"
-- "Kopernikus"
---------------------------------------------------------
-- Query 7
select MatrNr from (select MatrNr, count(vorlnr) as Anzahl from hoeren group by MatrNr) as t2, (select count(VorlNr) as Anzahl from vorlesungen) as t1 where t1.Anzahl = t2.Anzahl;

-- Ergebnis
-- "matrnr"

---------------------------------------------------------
-- Query 8
