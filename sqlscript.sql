USE [FeerSSQ]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 23.12.2022 16:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CoursesId] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](150) NOT NULL,
	[numberOfReviews] [int] NULL,
	[courseDescription] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Courses__C8DBA0313303BFB8] PRIMARY KEY CLUSTERED 
(
	[CoursesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.12.2022 16:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[userLogin] [nvarchar](150) NOT NULL,
	[userPassword] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersCourses]    Script Date: 23.12.2022 16:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersCourses](
	[UserId] [int] NOT NULL,
	[CoursesId] [int] NOT NULL,
	[Reviews] [nvarchar](1000) NULL,
	[CourseRate] [float] NULL,
 CONSTRAINT [PK_UsersCourses] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[CoursesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersCourses]  WITH CHECK ADD  CONSTRAINT [FK__UsersCour__Cours__7D0E9093] FOREIGN KEY([CoursesId])
REFERENCES [dbo].[Courses] ([CoursesId])
GO
ALTER TABLE [dbo].[UsersCourses] CHECK CONSTRAINT [FK__UsersCour__Cours__7D0E9093]
GO
ALTER TABLE [dbo].[UsersCourses]  WITH CHECK ADD  CONSTRAINT [FK__UsersCour__UserI__7C1A6C5A] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersCourses] CHECK CONSTRAINT [FK__UsersCour__UserI__7C1A6C5A]
GO
