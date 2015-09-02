﻿
--Create the Insert Proc
CREATE PROCEDURE [dbo].[app_Event_Insert] (
	@EventTitle VARCHAR(150),
	@EventDate DATETIME,
	@EventTime VARCHAR(15),
	@HTML TEXT,
	@SecretCode VARCHAR(50),
	@NumberPoints INT,
	@BadgeID INT,
	@BranchID INT,
	@Custom1 VARCHAR(50),
	@Custom2 VARCHAR(50),
	@Custom3 VARCHAR(50),
	@LastModDate DATETIME,
	@LastModUser VARCHAR(50),
	@AddedDate DATETIME,
	@AddedUser VARCHAR(50),
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
	@ShortDescription TEXT,
	@EndDate DATETIME,
	@EndTime VARCHAR(50),
	@EID INT OUTPUT
	)
AS
BEGIN
	INSERT INTO Event (
		EventTitle,
		EventDate,
		EventTime,
		HTML,
		SecretCode,
		NumberPoints,
		BadgeID,
		BranchID,
		Custom1,
		Custom2,
		Custom3,
		LastModDate,
		LastModUser,
		AddedDate,
		AddedUser,
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
		ShortDescription,
		EndDate,
		EndTime
		)
	VALUES (
		@EventTitle,
		@EventDate,
		@EventTime,
		@HTML,
		@SecretCode,
		@NumberPoints,
		@BadgeID,
		@BranchID,
		@Custom1,
		@Custom2,
		@Custom3,
		@LastModDate,
		@LastModUser,
		@AddedDate,
		@AddedUser,
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
		@ShortDescription,
		@EndDate,
		@EndTime
		)

	SELECT @EID = SCOPE_IDENTITY()
END
