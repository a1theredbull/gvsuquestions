/* ----- Facts ----- */

student('Jim').
student('Pam').
student('Kara Thrace').
student('Gaius Baltar').

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

course_scheduled(467,['Monday','Wednesday','Friday'],10:00,10:50,'MAK B1118').
course_scheduled(463,['Monday','Wednesday','Friday'],14:00,14:50,'MAK D2123').
course_scheduled(460,['Tuesday','Thursday'],10:00,11:15,'MAK B1116').
course_scheduled(457,['Monday','Wednesday','Friday'],14:00,14:50,'MAK D1117').
course_scheduled(452,['Monday','Wednesday','Friday'],13:00,13:50,'MAK D1117').
course_scheduled(451,['Monday','Wednesday','Friday'],10:00,10:50,'MAK B1118').
course_scheduled(450,['Monday','Wednesday','Friday'],12:00,12:50,'MAK D1117').
course_scheduled(443,['Monday','Wednesday','Friday'],11:00,11:50,'MAK B1124').
course_scheduled(437,['Monday','Wednesday','Friday'],10:00,10:50,'MAK B1118').
course_scheduled(375,['Thursday'],18:00,19:50,'EC 612').
course_scheduled(371,['Monday','Wednesday'],16:00,17:15,'MAK D1117').
course_scheduled(365,['Tuesday','Thursday'],10:00,11:15,'MAK D1117').
course_scheduled(361,['Tuesday','Thursday'],16:00,17:15,'MAK B1116').
course_scheduled(358,['Monday','Wednesday','Friday'],15:00,15:50,'MAK A1105').
course_scheduled(353,['Monday','Wednesday','Friday'],12:00,12:50,'MAK B1118').
course_scheduled(350,['Monday','Wednesday','Friday'],10:00,10:50,'MAK D1117').
course_scheduled(343,['Monday','Wednesday','Friday'],13:00,13:50,'MAK B1124').
course_scheduled(339,['Tuesday','Thursday'],13:00,14:15,'MAK A1105').
course_scheduled(337,['Tuesday','Thursday'],15:00,15,50,'MAK B1124').
course_scheduled(333,['Wednesday'],18:00,20:50,'MAK D1117').
course_scheduled(330,['Monday','Wednesday','Friday'],9:00,9:50,'MAK D1117').
course_scheduled(661,['Tuesday'],18:00,20:50,'EC 612').
course_scheduled(671,['Thursday'],18:00,20:50,'EC 612').
course_scheduled(691,['Monday'],18:00,20:50,'EC 612').

/* ----- Rules ----- */

course_types_taken_by_student(CourseType, Student) :-
	student_enrolled_in(Student, CourseNum),
	course(CourseType, CourseNum, CourseName).

course_schedule_taught_by(CourseType, CourseNum, CourseName, Teacher, Days, StartTime, EndTime, Location) :- 
	course_taught_by(CourseNum, Teacher),
	course_scheduled(CourseNum, Days, StartTime, EndTime, Location),
	course(CourseType, CourseNum, CourseName).

common_taken_courses(StudentA, StudentB, CourseType, CourseNum, CourseName) :-
  student_enrolled_in(StudentA, CourseNum),
  student_enrolled_in(StudentB, CourseNum),
  course(CourseType, CourseNum, CourseName).

time_conflict(DaysA, StartTimeA, EndTimeA, DaysB, StartTimeB, EndTimeB, DayConflict, TimeConflict) :-
  member(Day, DaysA),
  member(Day, DaysB),

/* ----- Goals ----- */

print_solution :-
  /* Find the classes taught by Dr. J. Leidig */
    write('What does Dr. J. Leidig teach?'), nl,
    findall((CourseType, CourseNum, CourseName), course_schedule_taught_by(CourseType, CourseNum, CourseName, 'Dr. J Leidig', _, _, _, _), R1),
    write(R1), nl, nl,

	/* Does Dr. J. Leidig teach Database? */
		write('Does Dr. J. Leidig teach Database?'), nl,
    findall((CourseNum, Teacher), course_taught_by(353, 'Dr. J Leidig'), R2),
    write(R2), nl, nl,
		
	/* What is Dr. J. Leidigs schedule? */
		write('What is Dr. J. Leidig\'s schedule?'), nl,
		findall((CourseType, CourseNum, CourseName, Days, StartTime, EndTime, Location),
			course_schedule_taught_by(CourseType, CourseNum, CourseName, 'Dr. J Leidig', Days, StartTime, EndTime, Location),
			R3),
		write(R3), nl, nl,
		
  /* Who is scheduled to teach what subject on TTH, 10am? */
    write('Who is scheduled to teach what subject on TTH, 10am?'), nl,
    findall((CourseType, CourseNum, CourseName, Teacher),
      course_schedule_taught_by(CourseType, CourseNum, CourseName, Teacher, ['Tuesday','Thursday'], 10:00, _, _),
      R4),
    write(R4), nl, nl,

  /* What courses do Jim and Pam have in common? */
    write('What courses do Jim and Pam have in common?'), nl,
    findall((CourseType, CourseNum, CourseName),
      common_taken_courses('Jim', 'Pam', CourseType, CourseNum, CourseName),
      R7),
    write(R7), nl, nl,

	/* Who is taking CS courses? */
		write('Who is taking CS courses?'), nl,
		setof((Student),
			course_types_taken_by_student('CS',Student),
			R8),
		write(R8), nl, nl,
		
	/* What types of courses are Gaius Baltar taking? */
		write('What types of courses are Gaius Baltar taking?'), nl,
		setof((CourseType),
			course_types_taken_by_student(CourseType, 'Gaius Baltar'),
			R9),
		write(R9), nl, nl.

/* Run it */
?- print_solution.