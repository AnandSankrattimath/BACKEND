use FutureStars;

create table FutureStars(
FSId tinyint PRIMARY KEY,
FirstName varchar(25) NOT NULL,
MiddleName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
DOB date DEFAULT (GETDATE()) NOT NULL,
IsMarried bit ,
HeightInCM tinyint NOT NULL,
MotherLaunguage nvarchar(10) NOT NULL,
);

sp_help FuTureStars;

insert into FutureStars(FSId,FirstName,MiddleName,LastName,IsMarried,HeightInCM,MotherLaunguage) values(1,'ANAND','MURAGAYYA','SANKRATTIMATH',0,166,N'ಕನ್ನಡ');

select * from FutureStars;

create table FutureStarsEducation(
EID tinyint primary key,
EducationDetails varchar(150) NOT NULL,
FSId tinyint Foreign key references FutureStars(FSId)
);

insert into FutureStarsEducation values(1,'SSLC -- 2012, PUC -- 2014, Degree -- 2017 -- BCA -- RaniChannammaUniversityBelgaum, Master -- 2019 -- MCA -- Reva_University_Bangalore',1);

select * from FutureStarsEducation;
