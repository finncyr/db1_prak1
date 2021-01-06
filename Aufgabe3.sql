-- Query 7
select
    MatrNr
from
    (
        select
            MatrNr,
            count(vorlnr) as Anzahl
        from
            hoeren
        group by
            MatrNr
    ) as t2,
    (
        select
            count(VorlNr) as Anzahl
        from
            vorlesungen
    ) as t1
where
    t1.Anzahl = t2.Anzahl;

-- Successfully run. Total query runtime: 63 msec.
-- 1 rows affected.


create index ho1 on hoeren(matrnr,vorlnr);

-- CREATE INDEX
-- Query returned successfully in 88 msec.

select
    MatrNr
from
    (
        select
            MatrNr,
            count(vorlnr) as Anzahl
        from
            hoeren
        group by
            MatrNr
    ) as t2,
    (
        select
            count(VorlNr) as Anzahl
        from
            vorlesungen
    ) as t1
where
    t1.Anzahl = t2.Anzahl;

-- Successfully run. Total query runtime: 52 msec.
-- 1 rows affected.

-- Vorher:
-- Seq Scan	2	0.019 ms	56.25%

-- Nachher:
-- Seq Scan	2	0.015 ms	50%