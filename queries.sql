select * from `DISTRIBUTION`;
select * from `COURSES`;
/*task #3*/
/*distribution by course*/
select COURSES.CourseName, Type, Percent  from `DISTRIBUTION`, `COURSES`
where (COURSES.courseID = DISTRIBUTION.CourseID)
order by CourseName;

/*assignments by distribution*/
select AssignID, COURSES.CourseName, Instance, MaxPoints, DISTRIBUTION.Type
from `ASSIGNMENTS`

left join `DISTRIBUTION` on (DISTRIBUTION.distribID = ASSIGNMENTS.distribID)

left join `COURSES` on (COURSES.CourseID = DISTRIBUTION.courseID);

/*student grades by assignment*/
select SCORE.AssignID, SCORE.StudentID, FirstName, LastName, Points, MaxPoints, Instance
from `SCORE`
right JOIN `ASSIGNMENTS` ON (ASSIGNMENTS.AssignID = SCORE.AssignID)

LEFT JOIN `STUDENTS` ON (STUDENTS.StudentID = SCORE.StudentID);

/*task #4 query:=*/
select a.AssignID, a.MaxPoints, avg(s.POINTS) AS PointAVG, max(s.POINTS) AS BestScore, min(s.POINTS) AS WorstScore
from ASSIGNMENTS a, SCORE s
where a.AssignID=2 AND s.AssignID=a.AssignID;

/*task #5 query:*/
select LastName, FirstName, CourseName from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.StudentID = ENROLLMENT.StudentID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 2)
order by LastName asc;

/* task #6 query:  */
select LastName, FirstName, CourseName, ASSIGNMENTS.AssignID, Points, MaxPoints from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.StudentID = ENROLLMENT.StudentID)

inner join `SCORE` on (SCORE.StudentID = ENROLLMENT.StudentID)

inner join `ASSIGNMENTS` on (ASSIGNMENTS.AssignID = SCORE.AssignID)

inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 1)

order by AssignID, LastName asc;

/* task #7 query:*/
insert into ASSIGNMENTS(DistribID, Instance, MaxPoints)
VALUES (1, 3, 100);

SELECT * FROM ASSIGNMENTS;

/* #8 query:*/

update DISTRIBUTION set Percent = 30

where DistribID = 1;

update DISTRIBUTION set Percent = 40

where DistribID = 3;


SELECT * FROM DISTRIBUTION;

/* task #9 query:*/
UPDATE SCORE SET Points = Points + 2

WHERE AssignID = 4;

SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) WHERE (SCORE.AssignID = 4)
order by StudentID;

/*#10 query:*/
SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) 
WHERE (SCORE.StudentID = 6)
order by StudentID;

update `SCORE`
left join `STUDENTS` 
on (SCORE.StudentID = STUDENTS.StudentID)
set Points = Points + 2
where (STUDENTS.LastName LIKE '%q%')

or (STUDENTS.LastName LIKE '%Q%')
and (STUDENTS.StudentID = 6);

SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) 
WHERE (SCORE.StudentID = 6)
order by StudentID;


/* task #11 query: compute final grade for Jack Sparrow*/
Select SUM(((sg.Points * 100) / a.MaxPoints) * (Percent / 100)) AS FINALGRADE

FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg

WHERE d.DistribID = a.DistribID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND StudentID = 1;

/* task #12 query: */
Select SUM(((sg.Points * 100) / a.MaxPoints) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg

WHERE d.DistribID = a.DistribID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND StudentID = 1;                

SELECT min(s.Points) as WorstGrade FROM SCORE s
left join `ASSIGNMENTS` a on (s.AssignID = a.AssignID)

left join `DISTRIBUTION` d on (d.distribID = a.distribID)
left join `COURSES` c on (c.CourseID = d.courseID)
WHERE  s.StudentID = 1

and d.CourseID = 3
order by s.StudentID asc;
SELECT * FROM SCORE where StudentID = 1;

Delete from `SCORE` 
where StudentID = 1 and AssignID = 9;


Select SUM(((sg.Points * 100) / a.MaxPoints) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg

WHERE d.DistribID = a.DistribID
AND sg.AssignID = a.AssignID

AND d.CourseID = 3
AND StudentID = 1;
                                                
SELECT s.AssignID, s.StudentID,d.CourseID, s.Points  FROM SCORE s
left join `ASSIGNMENTS` a on (s.AssignID = a.AssignID)

left join `DISTRIBUTION` d on (d.distribID = a.distribID)

left join `COURSES` c on (c.CourseID = d.courseID)
WHERE  s.StudentID = 1
and d.CourseID = 3
order by s.StudentID asc;

                                                
                                                

