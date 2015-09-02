﻿CREATE TABLE [dbo].[Minigame] (
    [MGID]             INT          IDENTITY (1, 1) NOT NULL,
    [MiniGameType]     INT          NULL,
    [MiniGameTypeName] VARCHAR (50) NULL,
    [AdminName]        VARCHAR (50) NULL,
    [GameName]         VARCHAR (50) NULL,
    [isActive]         BIT          NULL,
    [NumberPoints]     INT          NULL,
    [AwardedBadgeID]   INT          NULL,
    [Acknowledgements] TEXT         NULL,
    [LastModDate]      DATETIME     CONSTRAINT [DF_Minigame_LastModDate] DEFAULT (getdate()) NULL,
    [LastModUser]      VARCHAR (50) CONSTRAINT [DF_Minigame_LastModUser] DEFAULT ('N/A') NULL,
    [AddedDate]        DATETIME     CONSTRAINT [DF_Minigame_AddedDate] DEFAULT (getdate()) NULL,
    [AddedUser]        VARCHAR (50) CONSTRAINT [DF_Minigame_AddedUser] DEFAULT ('N/A') NULL,
    [TenID]            INT          NULL,
    [FldInt1]          INT          NULL,
    [FldInt2]          INT          NULL,
    [FldInt3]          INT          NULL,
    [FldBit1]          BIT          NULL,
    [FldBit2]          BIT          NULL,
    [FldBit3]          BIT          NULL,
    [FldText1]         TEXT         NULL,
    [FldText2]         TEXT         NULL,
    [FldText3]         TEXT         NULL,
    CONSTRAINT [PK_Minigame] PRIMARY KEY CLUSTERED ([MGID] ASC)
);

