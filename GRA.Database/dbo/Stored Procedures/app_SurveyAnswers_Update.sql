﻿
--Create the Update Proc
CREATE PROCEDURE [dbo].[app_SurveyAnswers_Update] (
	@SAID INT,
	@SRID INT,
	@TenID INT,
	@PID INT,
	@SID INT,
	@QID INT,
	@SQMLID INT,
	@DateAnswered DATETIME,
	@QType INT,
	@FreeFormAnswer TEXT,
	@ClarificationText TEXT,
	@ChoiceAnswerIDs VARCHAR(2000),
	@ChoiceAnswerText TEXT,
	@FldInt1 INT,
	@FldInt2 INT,
	@FldInt3 INT,
	@FldBit1 BIT,
	@FldBit2 BIT,
	@FldBit3 BIT,
	@FldText1 TEXT,
	@FldText2 TEXT,
	@FldText3 TEXT
	)
AS
UPDATE SurveyAnswers
SET SRID = @SRID,
	TenID = @TenID,
	PID = @PID,
	SID = @SID,
	QID = @QID,
	SQMLID = @SQMLID,
	DateAnswered = @DateAnswered,
	QType = @QType,
	FreeFormAnswer = @FreeFormAnswer,
	ClarificationText = @ClarificationText,
	ChoiceAnswerIDs = @ChoiceAnswerIDs,
	ChoiceAnswerText = @ChoiceAnswerText,
	FldInt1 = @FldInt1,
	FldInt2 = @FldInt2,
	FldInt3 = @FldInt3,
	FldBit1 = @FldBit1,
	FldBit2 = @FldBit2,
	FldBit3 = @FldBit3,
	FldText1 = @FldText1,
	FldText2 = @FldText2,
	FldText3 = @FldText3
WHERE SAID = @SAID
