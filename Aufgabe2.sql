-- Query 1
SELECT
    MatrNr
FROM
    hoeren
WHERE
    VorlNr = 5041;

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


