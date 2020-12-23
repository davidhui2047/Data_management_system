/* Assignment.sql
* (KIT102 Data Modelling Assignment)
*
* 16 tables -> inserts 2 values into each (4 values for table - SUPERVISION, 3 values for table - TAKE)
*
* author: Chiu Fan Hui (497790)
* version: 25/10/2019
*/

use cfhui;

drop table if exists PARTAKE;
drop table if exists TEACH;
drop table if exists COVERED;
drop table if exists INVOLVE;
drop table if exists ENGAGE;
drop table if exists PARTICIPATE;
drop table if exists ASSOCIATE;
drop table if exists TAKE;
drop table if exists SUPERVISION;
drop table if exists PHDSTUDENT;
drop table if exists STUDENT;
drop table if exists STAFF;
drop table if exists CLUB;
drop table if exists TUTORIAL;
drop table if exists COURSE;
drop table if exists SHORTCOURSE;

/* =========== create 5 tables with no dependencies =========== */

create table SHORTCOURSE ( /* create a table for entity "SHORTCOURSE" */
	ShortCourseCode varchar(6) NOT NULL, /* code of a short course e.g. 'KIT108' */
	CourseName varchar(30) NOT NULL, /* name of a course, can be a long name, e.g. 'Artificial Intelligence' */
	Period varchar(7) NOT NULL, /* how long does a short course takes, e.g. '1 week' */
	PRIMARY KEY (ShortCourseCode) /* code of a short course is unique, so it should be primary key of a short course*/
	) ENGINE=InnoDB;

create table COURSE ( /* create a table for entity "COURSE" */
	CourseCode varchar(3) NOT NULL, /* code of a course e.g. 'P3T' */
	CourseName varchar(80) NOT NULL, /* name of a course, can be a long name, e.g. 'Information and Communication Technology' */
	CourseType varchar(8) NOT NULL, /* Type of a course, e.g. bachelor  */
	Period varchar(7) NOT NULL, /*how long does a course takes, e.g. '3 years' */
	PRIMARY KEY (CourseCode) /* code of a course is unique, so it should be primary key of a course*/
	) ENGINE=InnoDB;
	
create table TUTORIAL ( /* create a table for entity "TUTORIAL" */
	TutorialId int(5) NOT NULL, /* 5 digit id of a tutorial, e.g. 54285 */
	PRIMARY KEY (TutorialId) /* id of a tutorial is unique, so it should be primary key of a tutorial */
	) ENGINE=InnoDB;
	
create table CLUB ( /* create a table for entity "CLUB" */
	ClubName varchar(20) NOT NULL, /* name of a club, e.g 'Golf' */
	OpenDate date NOT NULL, /* open data of a club, format YYYY-MM-DD, e.g 2008-11-11 */
	Category varchar(17) NOT NULL, /* category of a club, e.g. 'Outdoor sport' */
	HeadMemberName varchar(20) NOT NULL, /* head member of a club, e.g. 'Chiu Fan Hui' */
	PRIMARY KEY (ClubName) /* name of a club is unique, so it should be primary key of a club */
	) ENGINE=InnoDB;
	
create table STAFF ( /* create a table for entity "STAFF" */
	StaffId int(6) NOT NULL, /* 6 digit id of a staff e.g. 432897 */
	StaffName varchar(20) NOT NULL, /* name of a staff, e.g. 'Samuel Horton' */
	Position varchar(19) NOT NULL, /* position of a staff, e.g. 'Associate Professor' */
	Gender varchar(6) NOT NULL, /* gender of a staff, e.g. 'Male', 'Female', 'Other' */
	Role varchar(21) NOT NULL, /* role of a staff, can be teaching or tutoring or both, e.g. 'Teaching and tutoring' */
	ContactNumber varchar(25) NOT NULL, /* contact number of a staff, format (area code)phone number, e.g. (+61)0438794126 */
	PRIMARY KEY (StaffId) /* id of a staff is unique, so it should be primary key of staff */
	) ENGINE=InnoDB;

/* =========== create 3 tables with foreign key dependencies =========== */
	
create table STUDENT ( /* create a table for entity "STUDENT" */
	StudentNumber int(6) NOT NULL, /* 6 digit number of a student, e.g. 497790 */
	StudentName varchar(20) NOT NULL, /* name of a student, e.g. 'Chiu Fan Hui' */
	PreferredName varchar(10) NOT NULL, /* preferred name of a student, e.g. 'David' */
	DateOfBirth date NOT NULL, /* date of a student birth, format YYYY-MM-DD, e.g 1998-06-25 */
	Gender varchar(6) NOT NULL, /* gender of a student, e.g. 'Male', 'Female', 'Other' */
	InternationalStudent varchar(3) NOT NULL, /* whether a student is an international student, e.g. 'Yes' */
	ContactNumber varchar(25) NOT NULL, /* contact number of a student, format (area code)phone number, e.g. (+61)0477029395 */
	MainCourse varchar(8) NOT NULL, /* what kind of main course that a student is studying, e.g. 'bachelor'  */
	ShortCourseOneName varchar(27), /* name of the first short course that a student takes, can be a long name, e.g. 'Artificial Intelligence' */
	ShortCourseTwoName varchar(27), /* name of the second short course that a student takes, can be a long name, e.g. 'Data Science' */
	ShortCourseThreeName varchar(27), /* name of the third short course that a student takes, can be a long name, e.g. 'Computer Vision' */
	CourseCode varchar(3) NOT NULL, /* code of a course e.g. 'P3T' */
	PRIMARY KEY (StudentNumber), /* number of a student is unique, so it should be primary key of student */
	FOREIGN KEY (CourseCode) references COURSE (CourseCode)
	) ENGINE=InnoDB;
	
create table PHDSTUDENT ( /* create a table for entity "PHDSTUDENT" */
	PhdStudentNumber int(6) NOT NULL, /* 6 digit number of a PhD student, e.g. 486681 */
	StudentName varchar(20) NOT NULL, /* name of a PhD student, e.g. 'Jiahao Diao' */
	PreferredName varchar(10) NOT NULL, /* preferred name of a PhD student, e.g. 'JD' */
	DateOfBirth date NOT NULL, /* date of a PhD student birth, format YYYY-MM-DD, e.g 1992-04-20 */
	Gender varchar(6) NOT NULL, /* gender of a PhD student, e.g. 'Male', 'Female', 'Other' */
	InternationalStudent varchar(3) NOT NULL, /* whether a PhD student is an international student, e.g. 'No' */
	ContactNumber varchar(25) NOT NULL, /* contact number of a PhD student, format (area code)phone number, e.g. (+61)0466139455 */
	MainCourse varchar(3) NOT NULL, /* what kind of main course that a PhD student is studying, e.g. 'PhD'  */
	RearchTopic varchar(50) NOT NULL, /* topic that a PhD student need to do reach, e.g. 'Mathematics' */
	SupervisorOneName varchar(20) NOT NULL, /* name of the first supervisor of a PhD student, e.g. 'Samuel Horton' */
	SupervisorTwoName varchar(20), /* name of the second supervisor of a PhD student, e.g. 'Shea Bunge' */
	SupervisorThreeName varchar(20), /* name of the third supervisor of a PhD student, e.g. 'Julian Dermoudy' */
	ShortCourseCode varchar(6), /* code of a short course e.g. 'KIT108' */
	PRIMARY KEY (PhdStudentNumber), /* number of a PhD student is unique, so it should be primary key of PhD student */
	FOREIGN KEY (ShortCourseCode) references SHORTCOURSE (ShortCourseCode)
	) ENGINE=InnoDB;
		
create table SUPERVISION ( /* create a table for entity "SUPERVISION" */
	SupervisionId int(6) NOT NULL, /* 6 digit number of a supervision, e.g. 354481 */
	Role int(1) NOT NULL, /* which supervisor is a staff doing for PhD student, 1 represent 1st supervisor of a PhD student, e.g. 1 */
	StartingDate date NOT NULL, /* a data that a staff start supervising a PhD student, format YYYY-MM-DD, e.g 2015-04-20 */
	ExpectedEndDate date NOT NULL, /* a data that a staff expect ending supervising a PhD student, format YYYY-MM-DD, e.g 2018-04-20 */
	StaffId int(6) NOT NULL, /* 6 digit id of a staff that supervising a PhD student e.g. 432897 */
	PhdStudentNumber int(6) NOT NULL, /* 6 digit number of a PhD student that a staff is going to supervise, e.g. 486681 */
	PRIMARY KEY (SupervisionId), /* supervision id is unique, so it should be primary key of supervision */
	FOREIGN KEY (StaffId) references STAFF (StaffId),
	FOREIGN KEY (PhdStudentNumber) references PHDSTUDENT (PhdStudentNumber)
	) ENGINE=InnoDB;

/* =========== create 8 tables to show each many-to-many relationship =========== */
	
create table TAKE ( /* a student takes a short course */
	StudentNumber int(6) NOT NULL, /* 6 digit number of a student, e.g. 497790 */
	ShortCourseCode varchar(6) NOT NULL, /* code of a short course e.g. 'KIT108' */
	PRIMARY KEY (StudentNumber, ShortCourseCode),
	FOREIGN KEY (ShortCourseCode) references SHORTCOURSE (ShortCourseCode),
	FOREIGN KEY (StudentNumber) references STUDENT (StudentNumber)
	) ENGINE=InnoDB;
	
create table ASSOCIATE ( /* a student associate a tutorial */
	StudentNumber int(6) NOT NULL, /* 6 digit number of a student, e.g. 497790 */
	TutorialId int(5) NOT NULL, /* 5 digit id of a tutorial, e.g. 15498 */
	PRIMARY KEY (StudentNumber, TutorialId),
	FOREIGN KEY (StudentNumber) references STUDENT (StudentNumber),
	FOREIGN KEY (TutorialId) references TUTORIAL (TutorialId)
	) ENGINE=InnoDB;
	
create table PARTICIPATE ( /* a student participate a club */
	StudentNumber int(6) NOT NULL, /* 6 digit number of a student, e.g. 497790 */
	ClubName varchar(20) NOT NULL, /* name of a club, e.g 'Golf' */
	PRIMARY KEY (StudentNumber, ClubName),
	FOREIGN KEY (StudentNumber) references STUDENT (StudentNumber),
	FOREIGN KEY (ClubName) references CLUB (ClubName)
	) ENGINE=InnoDB;	
	
create table ENGAGE ( /* a PhD student engage a tutorial */
	PhdStudentNumber int(6) NOT NULL, /* 6 digit number of a PhD student, e.g. 486681 */
	TutorialId int(5) NOT NULL, /* 5 digit id of a tutorial, e.g. 54285 */
	PRIMARY KEY (PhdStudentNumber, TutorialId),
	FOREIGN KEY (PhdStudentNumber) references PHDSTUDENT (PhdStudentNumber),
	FOREIGN KEY (TutorialId) references TUTORIAL (TutorialId)
	) ENGINE=InnoDB;

create table INVOLVE ( /* a PhD student involve a club */
	PhdStudentNumber int(6) NOT NULL, /* 6 digit number of a PhD student, e.g. 486681 */
	ClubName varchar(20) NOT NULL, /* name of a club, e.g 'Golf' */
	PRIMARY KEY (PhdStudentNumber, ClubName),
	FOREIGN KEY (PhdStudentNumber) references PHDSTUDENT (PhdStudentNumber),
	FOREIGN KEY (ClubName) references CLUB (ClubName)
	) ENGINE=InnoDB;

create table COVERED ( /* a staff covered a tutorial */
	StaffId int(6) NOT NULL, /* 6 digit id of a staff e.g. 432897 */
	TutorialId int(5) NOT NULL, /* 5 digit id of a tutorial, e.g. 54285 */
	PRIMARY KEY (StaffId, TutorialId),
	FOREIGN KEY (StaffId) references STAFF (StaffId),
	FOREIGN KEY (TutorialId) references TUTORIAL (TutorialId)
	) ENGINE=InnoDB;

create table TEACH ( /* a staff teach a course */
	StaffId int(6) NOT NULL, /* 6 digit id of a staff e.g. 432897 */
	CourseCode varchar(3) NOT NULL, /* code of a course e.g. 'P3T' */
	PRIMARY KEY (StaffId, CourseCode),
	FOREIGN KEY (StaffId) references STAFF (StaffId),
	FOREIGN KEY (CourseCode) references COURSE (CourseCode)
	) ENGINE=InnoDB;

create table PARTAKE ( /* a staff partake a club */
	StaffId int(6) NOT NULL, /* 6 digit id of a staff e.g. 432897 */
	ClubName varchar(20) NOT NULL, /* name of a club, e.g 'Golf' */
	PRIMARY KEY (StaffId, ClubName),
	FOREIGN KEY (StaffId) references STAFF (StaffId),
	FOREIGN KEY (ClubName) references CLUB (ClubName)
	) ENGINE=InnoDB;
	
	
/* =========== insert 2 values in each independent table =========== */
insert into SHORTCOURSE values ('KIT108', 'Artificial Intelligence', '1 week');
insert into SHORTCOURSE values ('KIT102', 'Data Science', '2 weeks');
	
insert into COURSE values ('P3T', 'Information and Communication Technology', 'bachelor', '3 years');
insert into COURSE values ('P3B', 'Information and Communication Technology and Bachelor of Science', 'bachelor', '4 years');
	
insert into TUTORIAL values (54285);
insert into TUTORIAL values (78625);
	
insert into CLUB values ('Golf', '2016-12-13', 'Outdoor sport', 'Shea Bunge');
insert into CLUB values ('Basketball', '2018-10-9', 'Indoor sport', 'Chiu Fan Hui');
	
insert into STAFF values (432897, 'Samuel Horton', 'Tutor', 'Male', 'tutoring', '(+61)0438794126');
insert into STAFF values (682058, 'Shea Bunge', 'Tutor', 'Male', 'tutoring', '(+61)0495783215');
	
/* =========== insert 2 values in each key-dependent table (4 values for table - SUPERVISION) =========== */
insert into STUDENT values (497790, 'Chiu Fan Hui', 'David', '1998-06-25', 'Male', 'Yes', '(+61)0477029395', 'bachelor', 'Artificial Intelligence', 'Data Science', NULL, 'P3T');
insert into STUDENT values (192990, 'Joshua Martin', 'Josh', '1993-08-22', 'Male', 'No', '(+61)0431715913', 'bachelor', 'Artificial Intelligence', NULL, NULL, 'P3B');
	
insert into PHDSTUDENT values (486681, 'Jiahao Diao', 'JD', '1992-04-20', 'Male', 'Yes', '(+61)0466139455', 'PhD', 'Mathematics', 'Samuel Horton', 'Shea Bunge', NULL, 'KIT108');
insert into PHDSTUDENT values (453372, 'Woody Leung', 'Woody', '1998-09-02', 'Male', 'Yes', '(+61)0475235466', 'PhD', 'Sports', 'Shea Bunge', 'Samuel Horton', NULL, NULL);
	
insert into SUPERVISION values (354481, 1, '2015-04-20', '2018-04-20', 432897, 486681);
insert into SUPERVISION values (541532, 2, '2015-04-20', '2018-04-20', 682058, 486681);	
insert into SUPERVISION values (655471, 1, '2016-05-25', '2019-05-25', 682058 , 453372);
insert into SUPERVISION values (294252, 2, '2016-05-25', '2019-05-25', 432897 , 453372);
	
/* =========== insert 2 values in each many-to-many relationship table (3 values for table - TAKE) =========== */
insert into TAKE values (497790, 'KIT108');
insert into TAKE values (497790, 'KIT102');
insert into TAKE values (192990, 'KIT108');
	
insert into ASSOCIATE values (497790, 54285);
insert into ASSOCIATE values (192990, 78625);
	
insert into PARTICIPATE values (497790, 'Basketball');
insert into PARTICIPATE values (192990, 'Golf');
	
insert into ENGAGE values (486681, 54285);
insert into ENGAGE values (453372, 78625);
	
insert into INVOLVE values (486681, 'Golf');
insert into INVOLVE values (453372, 'Basketball');
	
insert into COVERED values (432897, 54285);	
insert into COVERED values (682058, 78625);	
	
insert into TEACH values (432897, 'P3B');	
insert into TEACH values (682058, 'P3T');
	
insert into PARTAKE values (432897, 'Basketball');	
insert into PARTAKE values (682058, 'Golf');
	