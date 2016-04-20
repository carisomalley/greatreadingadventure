﻿
CREATE PROCEDURE [dbo].[app_Award_Update] (
	@AID INT,
	@AwardName VARCHAR(80),
	@BadgeID INT,
	@NumPoints INT,
	@BranchID INT,
	@ProgramID INT,
	@District VARCHAR(50),
	@SchoolName VARCHAR(50),
	@BadgesAchieved INT,
	@BadgeList VARCHAR(500),
	@LastModDate DATETIME,
	@LastModUser VARCHAR(50),
	@AddedDate DATETIME,
	@AddedUser VARCHAR(50),
	@GoalPercent INT = 0,
	@TenID INT = 0,
	@FldInt1 INT = 0,
	@FldInt2 INT = 0,
	@FldInt3 INT = 0,
	@FldBit1 BIT = 0,
	@FldBit2 BIT = 0,
	@FldBit3 BIT = 0,
	@FldText1 TEXT = '',
	@FldText2 TEXT = '',
	@FldText3 TEXT = ''
	)
AS
UPDATE Award
SET AwardName = @AwardName,
	BadgeID = @BadgeID,
	NumPoints = @NumPoints,
	BranchID = @BranchID,
	ProgramID = @ProgramID,
	District = @District,
	SchoolName = @SchoolName,
	BadgesAchieved = @BadgesAchieved,
	BadgeList = @BadgeList,
	LastModDate = @LastModDate,
	LastModUser = @LastModUser,
	AddedDate = @AddedDate,
	AddedUser = @AddedUser,
	GoalPercent = @GoalPercent,
	TenID = @TenID,
	FldInt1 = @FldInt1,
	FldInt2 = @FldInt2,
	FldInt3 = @FldInt3,
	FldBit1 = @FldBit1,
	FldBit2 = @FldBit2,
	FldBit3 = @FldBit3,
	FldText1 = @FldText1,
	FldText2 = @FldText2,
	FldText3 = @FldText3
WHERE AID = @AID
	AND TenID = @TenID
