Insert values
• Insert into Student values(1,’Alice’, 20);
• Insert into Courses values(101,’Database Management’);
• Insert into Enrollments values(1,1,101,’A’);
Students Table: Courses Table:
| StudentID | Name | Age | | CourseID | CourseName |
| | | | | | |
| 1 | Alice | 20 | | 1 | Math |
| 2 | Bob | 22 | | 2 | English |
| 3 | Charlie | 21 | | 3 | History |
Enrollments Table:
EnrollmentID | StudentID | CourseID | Grade
1 | 1 | 1 | A
2 | 1 | 2 | B
3 | 2 | 1 | A-
4 | 3 | 3 | B+
5 | 3 | 2 | A
Inner Join to Get Student's Enrollments with Course Details
SELECT Student.StudentID, Student.Name, Student.Age, Courses.CourseID, 
Courses.CourseName, Enrollments.Grade FROM Student INNER JOIN Enrollments 
ON Student.StudentID = Enrollments.StudentID INNER JOIN Courses ON 
Enrollments.CourseID = Courses.CourseID;
StudentID | Name | Age | CourseID | CourseName | Grade
1 | Alice | 20 | 1 | Math | A
1 | Alice | 20 | 2 | English | B
2 | Bob | 22 | 1 | Math | A-
3 | Charlie | 21 | 3 | History | B+
3 | Charlie | 21 | 2 | English | A
Left Join to Get All Students and Their Enrollments (Including Students with No 
Enrollments)
SELECT Student.StudentID, Student.Name, Student.Age, Courses.CourseID, 
Courses.CourseName, Enrollments.Grade FROM Student LEFT JOIN Enrollments ON 
Student.StudentID = Enrollments.StudentID LEFT JOIN Courses ON 
Enrollments.CourseID = Courses.CourseID;
StudentID | Name | Age | CourseID | CourseName | Grade
1 | Alice | 20 | 1 | Math | A
1 | Alice | 20 | 2 | English | B
2 | Bob | 22 | 1 | Math | A-
2 | Bob | 22 | NULL | NULL | NULL
3 | Charlie | 21 | 3 | History | B+
3 | Charlie | 21 | 2 | English | A
Right Join to Get All Courses and Their Enrollments (Including Courses with No 
Enrollments)
SELECT Student.StudentID, Student.Name, Student.Age, Courses.CourseID, 
Courses.CourseName, Enrollments.Grade FROM Courses RIGHT JOIN Enrollments ON 
Courses.CourseID = Enrollments.CourseID RIGHT JOIN Student ON 
Enrollments.StudentID = Student.StudentID;
StudentID | Name | Age | CourseID | CourseName | Grade
1 | Alice | 20 | 1 | Math | A
1 | Alice | 20 | 2 | English | B
3 | Charlie | 21 | 3 | History | B+
2 | Bob | 22 | 1 | Math | A-
3 | Charlie | 21 | 2 | English | A
