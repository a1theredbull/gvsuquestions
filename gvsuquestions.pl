/*********************************************************
* Author: Alex Chau & Conner Fallone
* Class: CIS-365
* Winter 2014
* Answers questions based mybanner data from GVSU.
* This data includes students enrolled in which classes
* and which clases each professor teaches and where.
**********************************************************/

/* ----- Facts ----- */

/* Students in our dataset */
/* Student */
student('Jim').
student('Pam').
student('Kara Thrace').
student('Gaius Baltar').

/* Courses that students are enrolled in */
/* Student - Course Number */
student_enrolled_in('Jim',467).
student_enrolled_in('Jim',452).
student_enrolled_in('Jim',457).
student_enrolled_in('Pam',437).
student_enrolled_in('Pam',457).
student_enrolled_in('Pam',452).
student_enrolled_in('Kara Thrace',467).
student_enrolled_in('Kara Thrace',452).
student_enrolled_in('Kara Thrace',365).
student_enrolled_in('Gaius Baltar',463).
student_enrolled_in('Gaius Baltar',460).
student_enrolled_in('Gaius Baltar',375).
student_enrolled_in('Pam',463).

/* Teachers in our dataset. */
/* Teacher */
teacher('Dr. Schymik').
teacher('Ms. Peterman').
teacher('Dr. Engelsma').
teacher('Dr. El-Said').
teacher('Dr. Scripps').
teacher('Dr. J Leidig').
teacher('Dr. P Leidig').
teacher('Dr. Trefftz').
teacher('Dr. Kalafut').
teacher('Dr. Alsabbagh').
teacher('Dr. Jorgensen').
teacher('Dr. Nandigam').
teacher('Mr. Lange').
teacher('Ms. Posada').
teacher('Dr. Du').

/* All of the coures in our dataset. */
/* Course Type - Course Number - Course Name */
course('CS',467,'CS Project').
course('IS',463,'IS Project').
course('IS',460,'MIS').
course('CS',457,'Data Communications').
course('CS',452,'OS Concepts').
course('CS',451,'Computer Architecture').
course('IS',450,'IS Project Management').
course('IS',443,'Software Development Tools').
course('CS',437,'Distributed Computing').
course('IS',375,'Wireless Networking Systems').
course('CS',371,'Web Application Programming').
course('CS',365,'AI').
course('CS',361,'System Programming').
course('CS',358,'Information Assurance').
course('CS',353,'Database').
course('CS',350,'Software Engineering').
course('CS',343,'Structure of Programming Languages').
course('IS',339,'IT Project Management').
course('IS',337,'Network Systems Management').
course('IS',333,'DB Management and Implementation').
course('IS',330,'Systems Analysis and Design').
course('CIS',661,'Medical and Bioinformatics').
course('CIS',671,'Information Visualization').
course('CIS',691,'MBI Capstone').

/* Which courses are taught by which professors. */
/* Course Number - Teacher */
course_taught_by(467,'Dr. Engelsma').
course_taught_by(463,'Mr. Lange').
course_taught_by(460,'Dr. P Leidig').
course_taught_by(457,'Dr. Kalafut').
course_taught_by(452,'Dr. Wolffe').
course_taught_by(451,'Dr. Kurmas').
course_taught_by(450,'Dr. Schymik').
course_taught_by(443,'Ms. Peterman').
course_taught_by(437,'Dr. Engelsma').
course_taught_by(375,'Dr. El-Said').
course_taught_by(371,'Dr. Scripps').
course_taught_by(365,'Dr. J Leidig').
course_taught_by(361,'Dr. Trefftz').
course_taught_by(358,'Dr. Kalafut').
course_taught_by(353,'Dr. Alsabbagh').
course_taught_by(350,'Dr. Jorgensen').
course_taught_by(343,'Dr. Nandigam').
course_taught_by(339,'Mr. Lange').
course_taught_by(337,'Dr. El-Said').
course_taught_by(333,'Ms. Posada').
course_taught_by(330,'Dr. Du').
course_taught_by(661,'Dr. J Leidig').
course_taught_by(671,'Dr. J Leidig').
course_taught_by(691,'Dr. J Leidig').

/* Course schedules. */
/* Course Number - Days - Start Time(Army) - End Time(Army) - Location */
course_scheduled(467,['Monday','Wednesday','Friday'],1000,1050,'MAK B1118').
course_scheduled(463,['Monday','Wednesday','Friday'],1400,1450,'MAK D2123').
course_scheduled(460,['Tuesday','Thursday'],1000,1115,'MAK B1116').
course_scheduled(457,['Monday','Wednesday','Friday'],1400,1450,'MAK D1117').
course_scheduled(452,['Monday','Wednesday','Friday'],1300,1350,'MAK D1117').
course_scheduled(451,['Monday','Wednesday','Friday'],1000,1050,'MAK B1118').
course_scheduled(450,['Monday','Wednesday','Friday'],1200,1250,'MAK D1117').
course_scheduled(443,['Monday','Wednesday','Friday'],1100,1150,'MAK B1124').
course_scheduled(437,['Monday','Wednesday','Friday'],1000,1050,'MAK B1118').
course_scheduled(375,['Thursday'],1800,1950,'EC 612').
course_scheduled(371,['Monday','Wednesday'],1600,1715,'MAK D1117').
course_scheduled(365,['Tuesday','Thursday'],1000,1115,'MAK D1117').
course_scheduled(361,['Tuesday','Thursday'],1600,1715,'MAK B1116').
course_scheduled(358,['Monday','Wednesday','Friday'],1500,1550,'MAK A1105').
course_scheduled(353,['Monday','Wednesday','Friday'],1200,1250,'MAK B1118').
course_scheduled(350,['Monday','Wednesday','Friday'],1000,1050,'MAK D1117').
course_scheduled(343,['Monday','Wednesday','Friday'],1300,1350,'MAK B1124').
course_scheduled(339,['Tuesday','Thursday'],1300,1415,'MAK A1105').
course_scheduled(337,['Tuesday','Thursday'],1500,1550,'MAK B1124').
course_scheduled(333,['Wednesday'],1800,2050,'MAK D1117').
course_scheduled(330,['Monday','Wednesday','Friday'],900,950,'MAK D1117').
course_scheduled(661,['Tuesday'],1800,2050,'EC 612').
course_scheduled(671,['Thursday'],1800,2050,'EC 612').
course_scheduled(691,['Monday'],1800,2050,'EC 612').

/* ----- Rules ----- */

/* Used to retrieve types of courses a student is taking */
course_types_taken_by_student(CourseType, Student) :-
	student_enrolled_in(Student, CourseNum),
	course(CourseType, CourseNum, CourseName).

/* Get a professor's schedule */
course_schedule_taught_by(CourseType, CourseNum, CourseName, Teacher, Days, StartTime, EndTime, Location) :- 
	course_taught_by(CourseNum, Teacher),
	course_scheduled(CourseNum, Days, StartTime, EndTime, Location),
	course(CourseType, CourseNum, CourseName).

/* Same courses taken by different students */
common_taken_courses(StudentA, StudentB, CourseType, CourseNum, CourseName) :-
  student_enrolled_in(StudentA, CourseNum),
  student_enrolled_in(StudentB, CourseNum),
  course(CourseType, CourseNum, CourseName).

/* Time conflicts */
time_conflict(DaysA, StartTimeA, EndTimeA, DaysB, StartTimeB, EndTimeB) :-
  member(Day, DaysA),
  member(Day, DaysB),
  StartTimeA =< EndTimeB, StartTimeB =< StartTimeA.

/* Time conflicts between professors */
teaching_time_conflict(TeacherA, TeacherB, CourseNumA, DaysA, StartTimeA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB) :-
  course_taught_by(CourseNumA, TeacherA),
  course_taught_by(CourseNumB, TeacherB),
  course_scheduled(CourseNumA, DaysA, StartTimeA, EndTimeA, _),
  course_scheduled(CourseNumB, DaysB, StartTimeB, EndTimeB, _),
  time_conflict(DaysA, StartTimeA, StartTimeA, DaysB, StartTimeB, EndTimeB),
  TeacherA \= TeacherB.

/* Time and location conflicts */
teaching_time_location_conflict(TeacherA, TeacherB, CourseNumA, DaysA, StartTimeA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB, Location) :-
  course_taught_by(CourseNumA, TeacherA),
  course_taught_by(CourseNumB, TeacherB),
  course_scheduled(CourseNumA, DaysA, StartTimeA, EndTimeA, Location),
  course_scheduled(CourseNumB, DaysB, StartTimeB, EndTimeB, Location),
  time_conflict(DaysA, StartTimeA, StartTimeA, DaysB, StartTimeB, EndTimeB),
  TeacherA \= TeacherB.

/* Time conflicts with same professor */
teaching_time_professor_conflict(Teacher, CourseNumA, DaysA, StartTimeA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB) :-
  course_taught_by(CourseNumA, Teacher),
  course_taught_by(CourseNumB, Teacher),
  course_scheduled(CourseNumA, DaysA, StartTimeA, EndTimeA, _),
  course_scheduled(CourseNumB, DaysB, StartTimeB, EndTimeB, _),
  time_conflict(DaysA, StartTimeA, StartTimeA, DaysB, StartTimeB, EndTimeB),
  CourseNumA \= CourseNumB.

/* ----- Goals ----- */

print_solution :-
  /* 1. Find the classes taught by Dr. J. Leidig */
    write('1. What does Dr. J. Leidig teach?'), nl,
    findall((CourseType, CourseNum, CourseName), course_schedule_taught_by(CourseType, CourseNum, CourseName, 'Dr. J Leidig', _, _, _, _), R1),
    write(R1), nl, nl,

  /* 2. Does Dr. J. Leidig teach Database? */
    write('2. Does Dr. J. Leidig teach Database?'), nl,
    findall((CourseNum, Teacher), course_taught_by(353, 'Dr. J Leidig'), R2),
    write(R2), nl, nl,
		
  /* 3. What is Dr. J. Leidigs schedule? */
    write('3. What is Dr. J. Leidig\'s schedule?'), nl,
    findall((CourseType, CourseNum, CourseName, Days, StartTime, EndTime, Location),
        course_schedule_taught_by(CourseType, CourseNum, CourseName, 'Dr. J Leidig', Days, StartTime, EndTime, Location),
        R3),
    write(R3), nl, nl,
		
  /* 4. Who is scheduled to teach what subject on TTH, 10am? */
    write('4. Who is scheduled to teach what subject on TTH, 10am?'), nl,
    findall((CourseType, CourseNum, CourseName, Teacher),
      course_schedule_taught_by(CourseType, CourseNum, CourseName, Teacher, ['Tuesday','Thursday'], 1000, _, _),
      R4),
    write(R4), nl, nl,

  /* 5. When do Dr. J. Leidig and Dr. El-Said teach at the same time? */
    write('5. When do Dr. J. Leidig and Dr. El-Said teach at the same time?'), nl,
    findall((CourseNumA, StartTimeA, EndTimeA, CourseNumB, StartTimeB, EndTimeB),
      teaching_time_conflict('Dr. J Leidig', 'Dr. El-Said', CourseNumA, DaysA, StartTimeA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB),
      R5),
    write(R5), nl, nl,

  /* 6. Who teaches at the same time as Dr. J Leidig? */
    write('6. Who teaches at the same time as Dr. J Leidig?'), nl,
    setof(('Dr. J Leidig', CourseNumA, DaysA, StartTimeA, EndTimeA, Teacher, CourseNumB, DaysB, StartTimeB, EndTimeB),
      teaching_time_conflict('Dr. J Leidig', Teacher, CourseNumA, DaysA, StartTimeA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB),
      R6),
    write(R6), nl, nl,

  /* 7. What courses do Jim and Pam have in common? */
    write('7. What courses do Jim and Pam have in common?'), nl,
    findall((CourseType, CourseNum, CourseName),
      common_taken_courses('Jim', 'Pam', CourseType, CourseNum, CourseName),
      R7),
    write(R7), nl, nl,

  /* 8. Who is taking CS courses? */
    write('8. Who is taking CS courses?'), nl,
    setof((Student),
      course_types_taken_by_student('CS',Student),
      R8),
    write(R8), nl, nl,
		
  /* 9. What types of courses are Gaius Baltar taking? */
    write('9. What types of courses are Gaius Baltar taking?'), nl,
    setof((CourseType),
      course_types_taken_by_student(CourseType, 'Gaius Baltar'),
      R9),
    write(R9), nl, nl,

  /* 10. Are there any scheduling conflicts of professors and locations? */
    write('10. Are there any scheduling conflicts of professors and locations?'), nl, nl,
    write('Location conflicts!'), nl,
    setof((TeacherA, CourseNumA, DaysA, StartTimeA, EndTimeA, TeacherB, CourseNumB, DaysB, StartTimeB, EndTimeB, Location),
      teaching_time_location_conflict(TeacherA, TeacherB, CourseNumA, DaysA, StartTimeA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB, Location),
      R10),
    write(R10), nl, nl,
    write('Professor conflicts!'), nl,
    setof((Teacher, CourseNumA, StartTimeA, DaysA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB),
      teaching_time_professor_conflict(Teacher, CourseNumA, DaysA, StartTimeA, EndTimeA, CourseNumB, DaysB, StartTimeB, EndTimeB),
      R11),
    write(R11).

/* Run it */
?- print_solution.