Table Creation
1. Create table Student(StudentID int PRIMARY KEY, Name varchar(30), Age int);
2. Create table Courses (CourseID int PRIMARY KEY, CourseName varchar(20));
3. Create table Enrollments (StudentID int REFERENCES Student(StudentID), CourseID int 
REFERENCES Courses(CourseID));
Insert values
• Insert into Student values(1,'Alice', 20);
• Insert into Courses values (101, 'Database Management');
• Insert into Enrollments values(1,101);
Students Table: Courses Table:
| StudentID | Name | Age | | CourseID | CourseName |
| | | | | | |
| 1 | Alice | 20 | | 101 | Database Managemen|
| 2 | Bob | 22 | | 102 | Algorithms |
| 3 | Charlie | 21 | | 103 | Web Development |
| 4 | David | 19 |
Enrollments Table:
| StudentID | CourseID |
| | |
| 1 | 101 |
| 1 | 102 |
| 2 | 102 |
| 3 | 101 |
| 3 | 103 |
| 4 | 103 |
Simple Queries
• Retrieve all students
SELECT * FROM Student;
| StudentID | Name | Age |
| | | |
| 1 | Alice | 20 |
| 2 | Bob | 22 |
| 3 | Charlie | 21 |
| 4 | David | 19 |
• Retrieve the names and ages of students who are older than 20
SELECT Name, Age FROM Student WHERE Age > 20;
| StudentID | Name | Age |
| | | |
| 2 | Bob | 22 |
| 3 | Charlie | 21 |
Implementing Nested Queries
• Find the names of students who are enrolled in the course 'Database Management'. 
SELECT Name FROM Student WHERE StudentID IN (SELECT StudentID FROM 
Enrollments WHERE CourseID = (SELECT CourseID FROM Courses WHERE 
CourseName = 'Database Management'));
| Name |
|--------- |
| Alice |
| Charlie |
• Retrieve all courses that have more than one student enrolled
SELECT CourseID, CourseName FROM Courses WHERE CourseID IN ( SELECT 
CourseID FROM Enrollments GROUP BY CourseID HAVING COUNT(*) > 1 );
| CourseID | CourseName |
|---------- |--------------------- |
| 101 | Database Management |
| 103 | Web Development |
Implementing Subqueries
• Retrieve the average age of students
SELECT AVG(Age) AS AverageAge FROM Student;
| AverageAge |
| |
| 20.5 |
• Find the students whose age is greater than the average age of all students.
SELECT Name, Age FROM Student WHERE Age > (SELECT AVG(Age) FROM 
Student);
| Name |
|--------- |
| Bob |
| Charlie |
