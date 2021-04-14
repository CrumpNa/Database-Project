
/* create table for student info here */
DROP TABLE IF EXISTS `STUDENTS`;
CREATE TABLE `STUDENTS` (
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`StudentID`)
);

/* students listed below- name and major */
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Jack', 'Sparrow', 'TV/Film'),
('Doore', 'Ree', 'Social Work'),
('Mu', 'Fasa', 'Music'),
('Shrek', 'Onion', 'Philosophy'),
('King', 'Kong', 'Culinary Arts'),
('Harley', 'Quinn', 'Psychology'),
('The', 'Grinch', 'Dentistry'),
('Ma', 'Deah', 'Criminal Justice'),
('Princess', 'Shuri', 'Computer Science'),
('Nacho', 'Libre', 'Art');

select * from STUDENTS; /*display student table*/
/* create the table for the courses list */
DROP TABLE IF EXISTS `COURSES`;
CREATE TABLE `COURSES` (
    `CourseID` int(11) NOT NULL AUTO_INCREMENT,
    `CourseName` varchar(255) DEFAULT NULL,
    `Department` varchar(255) DEFAULT NULL,
    `CourseNumber` varchar(255) DEFAULT NULL,
    `Semester` varchar(255) DEFAULT NULL,
    `SchoolYear` int(4) DEFAULT NULL,
    PRIMARY KEY (`CourseID`)
 );
  select * from COURSES;/*display courses table*/

 /* class list for students to take */

INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES  (CourseID, 'Calculus I', 'MATH', '100', 'Spring', 2021),
(CourseID, 'English', 'ENG', '200', 'Spring', 2021),
(CourseID, 'Biology', 'BIOL', '300', 'Spring', 2021),
(CourseID, 'Character Building', 'CHAR', '400', 'Spring', 2021),
(CourseID, 'Spanish I', 'SPAN', '500', 'Spring', 2021);

/* create table to enroll students */
DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (StudentID, CourseID)
);


select * from ENROLLMENT;/*display enrollment table*/

/*enrolling students in classes (all take Character Building class 4)*/
INSERT INTO `ENROLLMENT` (StudentID, CourseID)
VALUES (1,4),(1,2),(1,1),(2,1),(2,3),(2,4),(3,5),(3,2),(3,4),
(4,5),(4,4),(4,1),(5,5),(5,4),(5,3),(6,4),(6,2),(6,1),
(7,2),(7,4),(7,1),(8,4),(8,2),(8,1),(9,3),(9,1),(9,4),
(10,1),(10,4),(10,3);

/* create disrubution table here  */
DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
  `DistribID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Percent` int(3) DEFAULT NULL,
  PRIMARY KEY (`DistribID`),
  FOREIGN KEY (`CourseID`) REFERENCES COURSES(CourseID)
  
);
/* insert data into disrubution table here */
INSERT INTO `DISTRIBUTION` (DistribID, CourseID, Type, Percent)
VALUES (DistribID, 1, 'Participation', 50),(DistribID, 1, 'Homework', 10),(DistribID, 1, 'Tests', 20),(DistribID, 1, 'Projects', 20),
(DistribID, 2, 'Participation', 30),(DistribID, 2, 'Homework', 30),(DistribID, 2, 'Tests', 20),(DistribID, 2, 'Projects', 20),
(DistribID, 3, 'Participation', 10),(DistribID, 3, 'Homework', 30),(DistribID, 3, 'Tests', 20),(DistribID, 3, 'Projects', 40),
(DistribID, 4, 'Participation', 15),(DistribID, 4, 'Homework', 35),(DistribID, 4, 'Tests', 30),(DistribID, 4, 'Projects', 20),
(DistribID, 5, 'Participation', 10),(DistribID, 5, 'Homework', 20),(DistribID, 5, 'Tests', 40),(DistribID, 5, 'Projects', 30);

/* create assignment table here*/
DROP TABLE IF EXISTS `ASSIGNMENTS`;
CREATE TABLE `ASSIGNMENTS` (
  `AssignID` int(11) NOT NULL AUTO_INCREMENT,
  `DistribID` int(11) DEFAULT NULL,
  `Instance` int(11) DEFAULT NULL,
  `MaxPoints` int(3) DEFAULT NULL,
  PRIMARY KEY (`AssignID`),
  FOREIGN KEY (`DistribID`) REFERENCES DISTRIBUTION(DistribID)
);

/* assignments */
INSERT INTO `ASSIGNMENTS` (AssignID, DistribID, Instance, MaxPoints)
VALUES (AssignID, 1, 1, 100),(AssignID, 2, 3, 100),(AssignID, 3, 2, 100),(AssignID, 4, 1, 100),
(AssignID, 5, 1, 100),(AssignID, 6, 5, 100),(AssignID, 7, 2, 100),(AssignID, 8, 2, 100),
(AssignID, 9, 1, 100),(AssignID, 10, 2, 100),(AssignID, 11, 1, 100),(AssignID, 12, 1, 100),
(AssignID, 13, 1, 100),(AssignID, 14, 1, 100),(AssignID, 15, 1, 100),(AssignID, 16, 2, 100),
(AssignID, 17, 1, 100),(AssignID, 18, 1, 100),(AssignID, 19, 1, 100),(AssignID, 20, 1, 100);

select * from ASSIGNMENTS; /*display assignments*/

/* create scores table here */
DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
    `StudentID` int(11) NOT NULL,
    `AssignID` int(11) NOT NULL,
  	`Points` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (StudentID, AssignID),
    FOREIGN KEY (`StudentID`) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (`AssignID`) REFERENCES ASSIGNMENTS(AssignID)
);
/* all student's grade scores here */
INSERT INTO `SCORE` (StudentID, AssignID, Points)
VALUES  (1, 2, 91), (1, 7, 100), (1, 8, 90),(1, 9, 91), (1, 10, 88), (1, 11, 95), (1, 12, 76), (1, 13, 88), (1, 14, 87), (1, 15, 97), (1, 16, 95),
(2, 1, 90), (2, 2, 78), (2, 3, 75), (2, 4, 99), (2, 5, 94), (2, 6, 67), (2, 7, 93), (2, 12, 83), (2, 14, 93), (2, 15, 74), (2, 19, 60), (2, 20, 90),
(3, 1, 94), (3, 2, 92), (3, 3, 91), (3, 4, 97), (3, 5, 93), (3, 6, 82), (3, 7, 95), (3, 8, 83), (3, 9, 73), (3, 14, 89), (3, 15, 90), (3, 16, 90),
(4, 1, 74), (4, 2, 83), (4, 3, 90), (4, 4, 97), (4, 5, 78), (4, 14, 96), (4, 15, 76), (4, 16, 60), (4, 17, 97), (4, 18, 76), (4, 19, 98), (4, 20, 94),
(5, 1, 72), (5, 2, 90), (5, 3, 94), (5, 4, 96), (5, 11, 83), (5, 12, 90), (5, 13, 92), (5, 14, 76), (5, 15, 100), (5, 16, 83), (5, 17, 83), (5, 19, 74),
(6, 1, 78), (6, 2, 91), (6, 3, 95), (6, 4, 88), (6, 13, 87), (6, 14, 60), (6, 15, 92), (6, 16, 90), (6, 17, 91), (6, 18, 89), (6, 19, 91), (6, 20, 98),
(7, 9, 99), (7, 10, 94), (7, 11, 76), (7, 12, 71), (7, 13, 71), (7, 14, 92), (7, 15, 85), (7, 16, 68), (7, 17, 98), (7, 18, 89), (7, 19, 93), (7, 20, 89), 
(8, 5, 89), (8, 6, 93), (8, 7, 83), (8, 8, 78), (8, 9, 82), (8, 10, 67), (8, 11, 90), (8, 12, 93), (8, 17, 84), (8, 18, 56), (8, 19, 78), (8, 20, 99),
(9, 1, 55), (9, 2, 86), (9, 3, 88), (9, 4, 96), (9, 5, 71), (9, 6, 100), (9, 7, 82), (9, 8, 82), (9, 9, 98), (9, 10, 82), (9, 11, 87), (9, 20, 100), (10, 9, 81), 
(10, 10, 97), (10, 11, 84), (10, 12, 90), (10, 13, 98), (10, 14, 78), (10, 15, 56), (10, 16, 100), (10, 17, 100), (10, 18, 81), (10, 19, 97), (10, 20, 100);



