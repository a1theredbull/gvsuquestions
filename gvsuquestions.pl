/* ----- Facts ----- */

student(jim).
student(pam).
student(karaThrace).
student(gaiusBaltar).

student_enrolled_in(jim,467).
student_enrolled_in(jim,452).
student_enrolled_in(jim,457).
student_enrolled_in(pam,437).
student_enrolled_in(pam,457).
student_enrolled_in(pam,452).
student_enrolled_in(karaThrace,467).
student_enrolled_in(karaThrace,452).
student_enrolled_in(karaThrace,365).
student_enrolled_in(gaiusBaltar,463).
student_enrolled_in(gaiusBaltar,460).
student_enrolled_in(gaiusBaltar,375).

teacher(drSchymik).
teacher(msPeterman).
teacher(drEngelsma).
teacher(drElSaid).
teacher(drScripps).
teacher(drJLeidig).
teacher(drPLeidig).
teacher(drTrefftz).
teacher(drKalafut).
teacher(drAlsabbagh).
teacher(drJorgensen).
teacher(drNandigam).
teacher(mrLange).
teacher(msPosada).
teacher(drDu).

course(cs,467,cs_project).
course(is,463,is_project).
course(is,460,mis).
course(cs,457,data_communications).
course(cs,452,os_concepts).
course(cs,451,computer_architecture).
course(is,450,is_project_management).
course(is,443,software_development_tools).
course(cs,437,distributed_computing).
course(is,375,wireless_networking_systems).
course(cs,371,web_application_programming).
course(cs,365,ai).
course(cs,361,system_programming).
course(cs,358,information_insurance).
course(cs,353,database).
course(cs,350,software_engineering).
course(cs,343,structure_of_programming_languages).
course(is,339,it_project_management).
course(is,337,network_systems_management).
course(is,333,db_management_and_implementation).
course(is,330,systems_analysis_and_design).
course(cis,661,medical_and_bioinformatics).
course(cis,671,information_visualization).
course(cis,691,mbi_capstone).

course_taught_by(467,drEngelsma).
course_taught_by(463,mrLange).
course_taught_by(460,drPLeidig).
course_taught_by(457,drKalafut).
course_taught_by(452,drWolffe).
course_taught_by(451,drKurmas).
course_taught_by(450,drSchymik).
course_taught_by(443,msPeterman).
course_taught_by(437,drEngelsma).
course_taught_by(375,drElSaid).
course_taught_by(371,drScripps).
course_taught_by(365,drJLeidig).
course_taught_by(361,drTrefftz).
course_taught_by(358,drKalafut).
course_taught_by(353,drAlsabbagh).
course_taught_by(350,drJorgensen).
course_taught_by(343,drNandigam).
course_taught_by(339,mrLange).
course_taught_by(337,drElSaid).
course_taught_by(333,msPosada).
course_taught_by(330,drDu).
course_taught_by(661,drJLeidig).
course_taught_by(671,drJLeidig).
course_taught_by(691,drJLeidig).

course_scheduled(467,[monday,wednesday,friday],10:00,10:50,mak_b1118).
course_scheduled(463,[monday,wednesday,friday],14:00,14:50,mak_d2123).
course_scheduled(460,[tuesday,thursday],10:00,11:15,mak_b1116).
course_scheduled(457,[monday,wednesday,friday],14:00,14:50,mak_d1117).
course_scheduled(452,[monday,wednesday,friday],13:00,13:50,mak_d1117).
course_scheduled(451,[monday,wednesday,friday],10:00,10:50,mak_b1118).
course_scheduled(450,[monday,wednesday,friday],12:00,12:50,mak_d1117).
course_scheduled(443,[monday,wednesday,friday],11:00,11:50,mak_b1124).
course_scheduled(437,[monday,wednesday,friday],10:00,10:50,mak_b1118).
course_scheduled(375,[thursday],18:00,19:50,ec_612).
course_scheduled(371,[monday,wednesday],16:00,17:15,mak_d1117).
course_scheduled(365,[tuesday,thursday],10:00,11:15,mak_d1117).
course_scheduled(361,[tuesday,thursday],16:00,17:15,mak_b1116).
course_scheduled(358,[monday,wednesday,friday],15:00,15:50,mak_a1105).
course_scheduled(353,[monday,wednesday,friday],12:00,12:50,mak_b1118).
course_scheduled(350,[monday,wednesday,friday],10:00,10:50,mak_d1117).
course_scheduled(343,[monday,wednesday,friday],13:00,13:50,mak_b1124).
course_scheduled(339,[tuesday,thursday],13:00,14:15,mak_a1105).
course_scheduled(337,[tuesday,thursday],15:00,15,50,mak_b1124).
course_scheduled(333,[wednesday],18:00,20:50,mak_d1117).
course_scheduled(330,[monday,wednesday,friday],9:00,9:50,mak_d1117).
course_scheduled(661,[tuesday],18:00,20:50,ec_612).
course_scheduled(671,[thursday],18:00,20:50,ec_612).
course_scheduled(691,[monday],18:00,20:50,ec_612).

/* ----- Rules ----- */

course_types_taken_by_student(CourseType, Student) :-
	student_enrolled_in(Student, CourseNum),
	course(CourseType, CourseNum, CourseName).

course_schedule_taught_by(CourseType, CourseNum, CourseName, Teacher, Days, StartTime, EndTime, Location) :- 
	course_taught_by(CourseNum, Teacher),
	course_scheduled(CourseNum, Days, StartTime, EndTime, Location),
	course(CourseType, CourseNum, CourseName).


/* ----- Goals ----- */

print_solution :-
  /* Find the classes taught by Dr. J. Leidig */
    write('What does Dr. J. Leidig teach?'), nl,
    findall((CourseType, CourseNum, CourseName), course_schedule_taught_by(CourseType, CourseNum, CourseName, drJLeidig, _, _, _, _), R1),
    write(R1), nl, nl,

	/* Does Dr. J. Leidig teach Database? */
		write('Does Dr. J. Leidig teach Database?'), nl,
    findall((CourseNum, Teacher), course_taught_by(353, drJLeidig), R2),
    write(R2), nl, nl,
		
	/* What is Dr. J. Leidigs schedule? */
		write('What is Dr. J. Leidig\'s schedule?'), nl,
		findall((CourseType, CourseNum, CourseName, Days, StartTime, EndTime, Location),
			course_schedule_taught_by(CourseType, CourseNum, CourseName, drJLeidig, Days, StartTime, EndTime, Location),
			R3),
		write(R3), nl, nl,
		
  /* Who is scheduled to teach what subject on TTH, 10am? */
    write('Who is scheduled to teach what subject on TTH, 10am?'), nl,
    findall((CourseType, CourseNum, CourseName, Teacher),
      course_schedule_taught_by(CourseType, CourseNum, CourseName, Teacher, [tuesday,thursday], 10:00, _, _),
      R4),
    write(R4), nl, nl,

	/* Who is taking CS courses? */
		write('Who is taking CS courses?'), nl,
		setof((Student),
			course_types_taken_by_student(cs,Student),
			R8),
		write(R8), nl, nl,
		
	/* What types of courses are Gaius Baltar taking? */
		write('What types of courses are Gaius Baltar taking?'), nl,
		setof((CourseType),
			course_types_taken_by_student(CourseType, gaiusBaltar),
			R9),
		write(R9), nl, nl.
		

/* Run it */
?- print_solution.