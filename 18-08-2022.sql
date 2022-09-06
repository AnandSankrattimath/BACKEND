

--declare @value char(10) = 'ABC'
--print @value
--print datalength(@value)
--print len(@value)

--declare @value char(10) = 'ABC'

--select @value as value, datalength(@value) as MemorySize,len(@value) LengthOfValue 

--declare @BitValue bit = 0;
--print @BitValue
--print datalength(@BitValue)
--print len( @BitValue)

declare @char  char(10)='ANAND'
print @char
print datalength(@char)
print len(@char)

declare @VarChar varchar(10) = 'ANAND'
print @VarChar
print datalength(@VarChar)
print len(@VarChar)

declare @Nchar nchar(10) = N'ಕನ್ನಡ'
declare @Hindi nchar(10) = N'हिन्दी' 
declare @Marathi nchar(10)=N'मराठी' 
declare @Telugu nchar(10) = N'తెలుగు' 
declare @Malayalam nchar(10) = N'മലയാളം'
declare @English nchar(10) = N'ENGLISH'

print @Nchar
print datalength(@Nchar)
print len(@Nchar)

declare @QualificationDetails varchar(200) = 'SSLC -- 2012, PUC -- 2014, Degree -- 2017 -- BCA -- RaniChannammaUniversityBelgaum, Master -- 2019 -- MCA -- Reva_University_Bangalore'
print @QualificationDetails
print datalength(@QualificationDetails)
print len(@QualificationDetails)

declare @TinyInt tinyint = 255;
print @Tinyint
print datalength(@TinyInt)
print len(@TinyInt)

--declare @DOB date = '1996-05-31'
print GETDATE()- @DOB

declare @DOB date = '1996-05-31'
print YEAR(@DOB)
print Month(@DOb)
print Day(@DOB)