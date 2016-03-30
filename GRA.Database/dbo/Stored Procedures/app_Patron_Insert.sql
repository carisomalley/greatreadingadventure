﻿
CREATE PROCEDURE [dbo].[app_Patron_Insert] (
	@IsMasterAccount BIT,
	@MasterAcctPID INT,
	@Username VARCHAR(50),
	@Password VARCHAR(255),
	@DOB DATETIME,
	@Age INT,
	@SchoolGrade VARCHAR(5),
	@ProgID INT,
	@FirstName VARCHAR(50),
	@MiddleName VARCHAR(50),
	@LastName VARCHAR(50),
	@Gender VARCHAR(1),
	@EmailAddress VARCHAR(150),
	@PhoneNumber VARCHAR(20),
	@StreetAddress1 VARCHAR(80),
	@StreetAddress2 VARCHAR(80),
	@City VARCHAR(20),
	@State VARCHAR(2),
	@ZipCode VARCHAR(10),
	@Country VARCHAR(50),
	@County VARCHAR(50),
	@ParentGuardianFirstName VARCHAR(50),
	@ParentGuardianLastName VARCHAR(50),
	@ParentGuardianMiddleName VARCHAR(50),
	@PrimaryLibrary INT,
	@LibraryCard VARCHAR(20),
	@SchoolName VARCHAR(50),
	@District VARCHAR(50),
	@Teacher VARCHAR(20),
	@GroupTeamName VARCHAR(20),
	@SchoolType INT,
	@LiteracyLevel1 INT,
	@LiteracyLevel2 INT,
	@ParentPermFlag BIT,
	@Over18Flag BIT,
	@ShareFlag BIT,
	@TermsOfUseflag BIT,
	@Custom1 VARCHAR(50),
	@Custom2 VARCHAR(50),
	@Custom3 VARCHAR(50),
	@Custom4 VARCHAR(50),
	@Custom5 VARCHAR(50),
	@SDistrict INT,
	@Goal INT,
	@AvatarState VARCHAR(50),
	@GoalCache INT,
	@TenID INT = 0,
	@FldInt1 INT = 0,
	@FldInt2 INT = 0,
	@FldInt3 INT = 0,
	@FldBit1 BIT = 0,
	@FldBit2 BIT = 0,
	@FldBit3 BIT = 0,
	@FldText1 TEXT = '',
	@FldText2 TEXT = '',
	@FldText3 TEXT = '',
	@Score1 INT = 0,
	@Score2 INT = 0,
	@Score1Pct DECIMAL(18, 2) = 0,
	@Score2Pct DECIMAL(18, 2) = 0,
	@Score1Date DATETIME,
	@Score2Date DATETIME,
	@PID INT OUTPUT
	)
AS
BEGIN
	INSERT INTO Patron (
		IsMasterAccount,
		MasterAcctPID,
		Username,
		Password,
		DOB,
		Age,
		SchoolGrade,
		ProgID,
		FirstName,
		MiddleName,
		LastName,
		Gender,
		EmailAddress,
		PhoneNumber,
		StreetAddress1,
		StreetAddress2,
		City,
		STATE,
		ZipCode,
		Country,
		County,
		ParentGuardianFirstName,
		ParentGuardianLastName,
		ParentGuardianMiddleName,
		PrimaryLibrary,
		LibraryCard,
		SchoolName,
		District,
		Teacher,
		GroupTeamName,
		SchoolType,
		LiteracyLevel1,
		LiteracyLevel2,
		ParentPermFlag,
		Over18Flag,
		ShareFlag,
		TermsOfUseflag,
		Custom1,
		Custom2,
		Custom3,
		Custom4,
		Custom5,
		SDistrict,
		Goal,
		AvatarState,
		GoalCache,
		TenID,
		FldInt1,
		FldInt2,
		FldInt3,
		FldBit1,
		FldBit2,
		FldBit3,
		FldText1,
		FldText2,
		FldText3,
		Score1,
		Score2,
		Score1Pct,
		Score2Pct,
		Score1Date,
		Score2Date
		)
	VALUES (
		@IsMasterAccount,
		@MasterAcctPID,
		@Username,
		@Password,
		@DOB,
		@Age,
		@SchoolGrade,
		@ProgID,
		@FirstName,
		@MiddleName,
		@LastName,
		@Gender,
		@EmailAddress,
		@PhoneNumber,
		@StreetAddress1,
		@StreetAddress2,
		@City,
		@State,
		@ZipCode,
		@Country,
		@County,
		@ParentGuardianFirstName,
		@ParentGuardianLastName,
		@ParentGuardianMiddleName,
		@PrimaryLibrary,
		@LibraryCard,
		@SchoolName,
		@District,
		@Teacher,
		@GroupTeamName,
		@SchoolType,
		@LiteracyLevel1,
		@LiteracyLevel2,
		@ParentPermFlag,
		@Over18Flag,
		@ShareFlag,
		@TermsOfUseflag,
		@Custom1,
		@Custom2,
		@Custom3,
		@Custom4,
		@Custom5,
		@SDistrict,
		@Goal,
		@AvatarState,
		@GoalCache,
		@TenID,
		@FldInt1,
		@FldInt2,
		@FldInt3,
		@FldBit1,
		@FldBit2,
		@FldBit3,
		@FldText1,
		@FldText2,
		@FldText3,
		@Score1,
		@Score2,
		@Score1Pct,
		@Score2Pct,
		@Score1Date,
		@Score2Date
		)

	SELECT @PID = SCOPE_IDENTITY()
END
