USE [marimba_tfs]
GO
/****** Object:  Table [dbo].[user]    Script Date: 04/28/2020 13:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userid] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](20) NULL,
	[usertype] [nvarchar](20) NULL,
	[Team] [varchar](100) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dates]    Script Date: 04/28/2020 13:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dates](
	[DateID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[QuarterNumber] [int] NOT NULL,
 CONSTRAINT [PK_Dates] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usertask]    Script Date: 04/28/2020 13:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertask](
	[taskid] [int] NOT NULL,
	[taskname] [nvarchar](100) NULL,
	[hour] [float] NULL,
	[description] [nvarchar](200) NULL,
	[date] [date] NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_usertask] PRIMARY KEY CLUSTERED 
(
	[taskid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_usertask_user]    Script Date: 04/28/2020 13:25:29 ******/
ALTER TABLE [dbo].[usertask]  WITH CHECK ADD  CONSTRAINT [FK_usertask_user] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([userid])
GO
ALTER TABLE [dbo].[usertask] CHECK CONSTRAINT [FK_usertask_user]
GO
