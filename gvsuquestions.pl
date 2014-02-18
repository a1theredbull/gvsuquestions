/* ----- Facts ----- */

student(jim).
student(pam).
student(karaThrace).
student(gaiusBaltar).

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

course(cs,467,cs_project,mak_b1118).
course(is,463,is_project,mak_d2123).
course(is,460,mis,mak_b1116).
course(cs,457,data_communications,mak_d1117).
course(cs,452,os_concepts,mak_d1117).
course(cs,451,computer_architecture,mak_b1118).
course(is,450,is_project_management,mak_d1117).
course(is,443,software_development_tools,mak_b1124).
course(cs,437,distributed_computing,mak_b1118).
course(is,375,wireless_networking_systems,ec_612).
course(cs,371,web_application_programming,mak_d1117).
course(cs,365,ai,mak_d1117).
course(cs,361,system_programming,mak_b1116).
course(cs,358,information_insurance,mak_a1105).
course(cs,353,database,mak_b1118).
course(cs,350,software_engineering,mak_d1117).
course(cs,343,structure_of_programming_languages,mak_b1124).
course(is,339,it_project_management,mak_a1105).
course(is,network_systems_management,mak_b1124).
course(is,db_management_and_implementation,mak_d1117).
course(is,systems_analysis_and_design,mak_d1117).
course(cis,661,medical_and_bioinformatics,ec_612).
course(cis,671,information_visualization,ec_612).
course(cis,691,mbi_capstone,ec_612).

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

course_scheduled(467,true,false,true,false,true,10,0,10,50).
course_scheduled(463,true,false,true,false,true,14,0,14,50).
course_scheduled(460,false,true,false,true,false,10,0,11,15).
course_scheduled(457,true,false,true,false,true,14,0,14,50).
course_scheduled(452,true,false,true,false,true,13,0,13,50).
course_scheduled(451,true,false,true,false,true,10,0,10,50).
course_scheduled(450,true,false,true,false,true,12,0,12,50).
course_scheduled(443,true,false,true,false,true,11,0,11,50).
course_scheduled(437,true,false,true,false,true,10,0,10,50).
course_scheduled(375,false,false,false,true,false,18,0,19,50).
course_scheduled(371,true,false,true,false,false,16,0,17,15).
course_scheduled(365,false,true,false,true,false,10,0,11,15).
course_scheduled(361,false,true,false,true,false,16,0,17,15).
course_scheduled(358,true,false,true,false,true,15,0,15,50).
course_scheduled(353,true,false,true,false,true,12,0,12,50).
course_scheduled(350,true,false,true,false,true,10,0,10,50).
course_scheduled(343,true,false,true,false,true,13,0,13,50).
course_scheduled(339,false,true,false,true,false,13,0,14,15).
course_scheduled(337,false,true,false,true,false,15,0,15,50).
course_scheduled(333,false,false,true,false,false,18,0,20,50).
course_scheduled(330,true,false,true,false,true,9,0,9,50).
course_scheduled(661,false,true,false,false,false,18,0,20,50).
course_scheduled(671,false,false,false,true,false,18,0,20,50).
course_scheduled(691,true,false,false,false,false,18,0,20,50).

/* ----- Rules ----- */

/* ----- Goals ----- */
print_solution :-
    /* Find the classes taught by Dr. J. Leidig */
        write('What does Dr. J. Leidig teach?'), nl,
        findall(C,course_taught_by(C,drJLeidig),R),
        write(R), nl.

/* Run it */
?- print_solution.