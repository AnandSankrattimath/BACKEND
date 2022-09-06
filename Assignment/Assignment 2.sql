USE FutureStarsDB

CREATE TABLE dbo.FutureStarsInfo(
FSId TINYINT PRIMARY KEY,
FirstName VARCHAR(25) NOT NULL,
MiddleName VARCHAR(25) NOT NULL,
LastName VARCHAR(25) NOT NULL,
DOB DATE DEFAULT (GETDATE()) NOT NULL,
IsMarried BIT ,
HeightInCM TINYINT NOT NULL,
MotherLaunguage NVARCHAR(10) NOT NULL,
);



INSERT INTO dbo.FutureStarsInfo(FSId,FirstName,MiddleName,LastName,IsMarried,HeightInCM,MotherLaunguage) VALUES(1,'ANAND','MURAGAYYA','SANKRATTIMATH',0,166,N'ಕನ್ನಡ');

INSERT INTO dbo.FutureStarsInfo(FSId,FirstName,MiddleName,LastName,IsMarried,HeightInCM,MotherLaunguage) VALUES(2,'MANIKANTHA','GURUSIDDAYYA','SUGARAYYAMATH',0,166,N'ಕನ್ನಡ');

INSERT INTO dbo.FutureStarsInfo(FSId,FirstName,MiddleName,LastName,IsMarried,HeightInCM,MotherLaunguage) VALUES(3,'MANISH','KUMAR','MULLUR',0,166,N'தமிழ்');

SELECT * FROM dbo.FutureStarsInfo;


CREATE TABLE dbo.FutureStarsEducation(
EID TINYINT PRIMARY KEY,
EducationDetails VARCHAR(150) NOT NULL,
FSId TINYINT FOREIGN KEY REFERENCES dbo.FutureStarsInfo(FSID)
);


INSERT INTO dbo.FutureStarsEducation VALUES(1,'SSLC -- 2012, PUC -- 2014, Degree -- 2017 -- BCA -- RaniChannammaUniversityBelgaum, Master -- 2019 -- MCA -- Reva_University_Bangalore',1);

INSERT INTO dbo.FutureStarsEducation VALUES(2,'SSLC -- 2015, DIP -- 2018, Degree -- 2021 -- BE -- RVCE University Bangalore ',2);


SELECT Info.FirstName,Info.MotherLaunguage,Edu.EducationDetails FROM 
dbo.FutureStarsInfo AS Info 
INNER JOIN 
dbo.FutureStarsEducation AS Edu
ON Info.FSId=Edu.FSId