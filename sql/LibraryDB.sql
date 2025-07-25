USE [LibraryDB]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](100) NULL,
	[Publisher] [nvarchar](100) NULL,
	[YearPublished] [int] NULL,
	[ISBN] [nvarchar](20) NULL,
	[CategoryID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Available] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[image] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowDetails]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowDetails](
	[BorrowID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrows]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrows](
	[BorrowID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BorrowDate] [date] NOT NULL,
	[ReturnDate] [date] NULL,
	[Status] [nvarchar](20) NOT NULL,
	[ExpectedReturnDate] [date] NULL,
 CONSTRAINT [PK__Borrows__4295F85F1C935A22] PRIMARY KEY CLUSTERED 
(
	[BorrowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FineReasons]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FineReasons](
	[ReasonCode] [varchar](20) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReasonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fines]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fines](
	[FineID] [int] IDENTITY(1,1) NOT NULL,
	[BorrowID] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[Reason] [varchar](20) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[CreatedAt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[FineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FineStatuses]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FineStatuses](
	[StatusCode] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LostBooks]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LostBooks](
	[LostID] [int] IDENTITY(1,1) NOT NULL,
	[BorrowID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedAt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[LostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedAt] [date] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationDetails]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationDetails](
	[ReservationID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[StatusCode] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ReserveDate] [date] NULL,
	[StatusCode] [nvarchar](50) NULL,
	[DeadlineToPickup] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatuses]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatuses](
	[StatusCode] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22/07/2025 8:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Role] [nvarchar](20) NULL,
	[Status] [bit] NULL,
	[verifyCode] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [Title], [Author], [Publisher], [YearPublished], [ISBN], [CategoryID], [Quantity], [Available], [IsDeleted], [image]) VALUES (1, N'The Great Gatsby', N'F. Scott Fitzgerald', N'Scribner', 1925, N'9780743273565', 1, 9, 4, 0, N'The_Great_Gatsby.jpg')
INSERT [dbo].[Books] ([BookID], [Title], [Author], [Publisher], [YearPublished], [ISBN], [CategoryID], [Quantity], [Available], [IsDeleted], [image]) VALUES (2, N'A Brief History of Time', N'Stephen Hawking', N'Bantam Books', 1988, N'9780553380163', 2, 5, 1, 0, N'A_Brief_History_of_Time.jpg')
INSERT [dbo].[Books] ([BookID], [Title], [Author], [Publisher], [YearPublished], [ISBN], [CategoryID], [Quantity], [Available], [IsDeleted], [image]) VALUES (3, N'Sapiens', N'Yuval Noah Harari', N'Harvill Secker', 2011, N'9780062316097', 3, 7, 7, 0, N'Sapiens.jpg')
INSERT [dbo].[Books] ([BookID], [Title], [Author], [Publisher], [YearPublished], [ISBN], [CategoryID], [Quantity], [Available], [IsDeleted], [image]) VALUES (4, N'Clean Code', N'Robert C. Martin', N'Prentice Hall', 2008, N'9780132350884', 4, 6, 3, 0, N'Clean_Code.jpg')
INSERT [dbo].[Books] ([BookID], [Title], [Author], [Publisher], [YearPublished], [ISBN], [CategoryID], [Quantity], [Available], [IsDeleted], [image]) VALUES (5, N'Charlotte''s Web', N'E.B. White', N'Harper & Brothers', 1952, N'9780064400558', 5, 12, 10, 0, N'Charlotte.jpg')
INSERT [dbo].[Books] ([BookID], [Title], [Author], [Publisher], [YearPublished], [ISBN], [CategoryID], [Quantity], [Available], [IsDeleted], [image]) VALUES (6, N'math', N'Phong', N'Phong', 2025, N'123', 2, 10, 10, 1, N'6.jpg')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (1, 1, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (1, 2, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (2, 3, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (3, 4, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (4, 5, 2)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (6, 1, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (7, 1, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (8, 2, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (10, 2, 4)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (13, 1, 6)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (14, 1, 5)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (24, 1, 2)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (25, 2, 2)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (26, 1, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (27, 2, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (28, 3, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (28, 4, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (29, 3, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (29, 4, 1)
INSERT [dbo].[BorrowDetails] ([BorrowID], [BookID], [Quantity]) VALUES (30, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Borrows] ON 

INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (1, 1, CAST(N'2025-07-01' AS Date), CAST(N'2025-07-10' AS Date), N'Returned', CAST(N'2025-07-08' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (2, 2, CAST(N'2025-07-03' AS Date), NULL, N'Overdue', CAST(N'2025-07-10' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (3, 3, CAST(N'2025-06-20' AS Date), CAST(N'2025-07-05' AS Date), N'Returned', CAST(N'2025-06-27' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (4, 4, CAST(N'2025-07-05' AS Date), CAST(N'2025-07-13' AS Date), N'Returned', CAST(N'2025-07-12' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (5, 5, CAST(N'2025-06-15' AS Date), CAST(N'2025-07-18' AS Date), N'Returned', CAST(N'2025-06-22' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (6, 1, CAST(N'2025-07-13' AS Date), CAST(N'2025-07-13' AS Date), N'Returned', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (7, 1, CAST(N'2025-07-13' AS Date), CAST(N'2025-07-17' AS Date), N'Returned', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (8, 1, CAST(N'2025-07-13' AS Date), CAST(N'2025-07-17' AS Date), N'Returned', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (9, 1, CAST(N'2025-07-01' AS Date), NULL, N'Overdue', CAST(N'2025-07-08' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (10, 1, CAST(N'2025-07-14' AS Date), CAST(N'2025-07-17' AS Date), N'Returned', CAST(N'2025-07-21' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (12, 1, CAST(N'2025-07-01' AS Date), NULL, N'Overdue', CAST(N'2025-07-08' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (13, 1, CAST(N'2025-07-16' AS Date), CAST(N'2025-07-17' AS Date), N'Returned', CAST(N'2025-07-23' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (14, 1, CAST(N'2025-07-17' AS Date), CAST(N'2025-07-22' AS Date), N'Returned', CAST(N'2025-07-24' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (24, 1, CAST(N'2025-07-18' AS Date), CAST(N'2025-07-18' AS Date), N'Lost', CAST(N'2025-07-25' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (25, 1, CAST(N'2025-07-18' AS Date), CAST(N'2025-07-18' AS Date), N'Lost', CAST(N'2025-07-25' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (26, 1, CAST(N'2025-07-18' AS Date), NULL, N'Lost', CAST(N'2025-07-25' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (27, 1, CAST(N'2025-07-18' AS Date), CAST(N'2025-07-22' AS Date), N'Returned', CAST(N'2025-07-25' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (28, 6, CAST(N'2025-07-22' AS Date), NULL, N'Partially Lost', CAST(N'2025-07-29' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (29, 6, CAST(N'2025-07-22' AS Date), NULL, N'Partially Lost', CAST(N'2025-07-29' AS Date))
INSERT [dbo].[Borrows] ([BorrowID], [UserID], [BorrowDate], [ReturnDate], [Status], [ExpectedReturnDate]) VALUES (30, 6, CAST(N'2025-07-22' AS Date), NULL, N'Borrowing', CAST(N'2025-07-29' AS Date))
SET IDENTITY_INSERT [dbo].[Borrows] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (1, N'Fiction')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (2, N'Science')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (3, N'History')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (4, N'Technology')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (5, N'Children')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[FineReasons] ([ReasonCode], [DisplayName], [Description]) VALUES (N'DAMAGED', N'Damaged Book', N'The book is damaged.')
INSERT [dbo].[FineReasons] ([ReasonCode], [DisplayName], [Description]) VALUES (N'LOST', N'Lost Book', N'The borrowed book cannot be returned')
INSERT [dbo].[FineReasons] ([ReasonCode], [DisplayName], [Description]) VALUES (N'OTHER', N'Other Reasons', N'Reason not covered by the predefined categories')
INSERT [dbo].[FineReasons] ([ReasonCode], [DisplayName], [Description]) VALUES (N'OVERDUE', N'Overdue Return', N'The borrower returned the book after the due date')
GO
SET IDENTITY_INSERT [dbo].[Fines] ON 

INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (1, 5, CAST(130000.00 AS Decimal(10, 2)), N'OVERDUE', N'Paid', CAST(N'2025-07-18' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (2, 24, CAST(100000.00 AS Decimal(10, 2)), N'LOST', N'Paid', CAST(N'2025-07-18' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (3, 13, CAST(5000.00 AS Decimal(10, 2)), N'DAMAGED', N'Paid', CAST(N'2025-07-18' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (4, 25, CAST(100000.00 AS Decimal(10, 2)), N'LOST', N'Paid', CAST(N'2025-07-18' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (5, 13, CAST(10000.00 AS Decimal(10, 2)), N'DAMAGED', N'Waived', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (6, 26, CAST(100000.00 AS Decimal(10, 2)), N'LOST', N'Waived', CAST(N'2025-07-22' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (7, 28, CAST(100000.00 AS Decimal(10, 2)), N'LOST', N'Paid', CAST(N'2025-07-22' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (8, 26, CAST(100000.00 AS Decimal(10, 2)), N'LOST', N'Unpaid', CAST(N'2025-07-22' AS Date))
INSERT [dbo].[Fines] ([FineID], [BorrowID], [Amount], [Reason], [StatusCode], [CreatedAt]) VALUES (9, 29, CAST(100000.00 AS Decimal(10, 2)), N'LOST', N'Unpaid', CAST(N'2025-07-22' AS Date))
SET IDENTITY_INSERT [dbo].[Fines] OFF
GO
INSERT [dbo].[FineStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'Paid', N'Paid', N'The fine has been paid')
INSERT [dbo].[FineStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'Unpaid', N'Unpaid', N'The user has not paid the fine')
INSERT [dbo].[FineStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'Waived', N'Waived', N'The fine was waived by an administrator')
GO
SET IDENTITY_INSERT [dbo].[LostBooks] ON 

INSERT [dbo].[LostBooks] ([LostID], [BorrowID], [BookID], [Quantity], [CreatedAt]) VALUES (1, 26, 1, 1, CAST(N'2025-07-22' AS Date))
INSERT [dbo].[LostBooks] ([LostID], [BorrowID], [BookID], [Quantity], [CreatedAt]) VALUES (2, 28, 3, 1, CAST(N'2025-07-22' AS Date))
INSERT [dbo].[LostBooks] ([LostID], [BorrowID], [BookID], [Quantity], [CreatedAt]) VALUES (3, 26, 1, 1, CAST(N'2025-07-22' AS Date))
INSERT [dbo].[LostBooks] ([LostID], [BorrowID], [BookID], [Quantity], [CreatedAt]) VALUES (4, 29, 4, 1, CAST(N'2025-07-22' AS Date))
SET IDENTITY_INSERT [dbo].[LostBooks] OFF
GO
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (1, 1, N'Canceled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (2, 2, N'Canceled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (3, 1, N'Fulfilled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (4, 2, N'Canceled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (5, 2, N'Canceled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (6, 1, N'Canceled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (7, 2, N'Canceled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (8, 1, N'Fulfilled', 2)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (9, 2, N'Fulfilled', 2)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (10, 1, N'Expired', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (11, 1, N'Fulfilled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (12, 2, N'Fulfilled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (13, 1, N'ReadyToPickup', 2)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (14, 1, N'Canceled', 1)
INSERT [dbo].[ReservationDetails] ([ReservationID], [BookID], [StatusCode], [Quantity]) VALUES (15, 1, N'Fulfilled', 1)
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (1, 1, CAST(N'2025-07-17' AS Date), N'Canceled', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (2, 1, CAST(N'2025-07-17' AS Date), N'Canceled', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (3, 1, CAST(N'2025-07-17' AS Date), N'Fulfilled', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (4, 1, CAST(N'2025-07-17' AS Date), N'Canceled', NULL)
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (5, 1, CAST(N'2025-07-17' AS Date), N'Canceled', NULL)
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (6, 1, CAST(N'2025-07-17' AS Date), N'Canceled', NULL)
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (7, 1, CAST(N'2025-07-17' AS Date), N'Canceled', NULL)
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (8, 1, CAST(N'2025-07-17' AS Date), N'Fulfilled', CAST(N'2025-07-20' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (9, 1, CAST(N'2025-07-17' AS Date), N'Fulfilled', CAST(N'2025-07-21' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (10, 1, CAST(N'2025-07-10' AS Date), N'Expired', CAST(N'2025-07-13' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (11, 1, CAST(N'2025-07-18' AS Date), N'Fulfilled', CAST(N'2025-07-21' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (12, 1, CAST(N'2025-07-18' AS Date), N'Fulfilled', CAST(N'2025-07-21' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (13, 1, CAST(N'2025-07-20' AS Date), N'ReadyToPickup', CAST(N'2025-07-25' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (14, 6, CAST(N'2025-07-22' AS Date), N'Canceled', NULL)
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ReserveDate], [StatusCode], [DeadlineToPickup]) VALUES (15, 6, CAST(N'2025-07-22' AS Date), N'Fulfilled', CAST(N'2025-07-25' AS Date))
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
INSERT [dbo].[ReservationStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'Canceled', N'Canceled', N'The reservation request has been canceled')
INSERT [dbo].[ReservationStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'Expired', N'Expired', N'The reservation was not picked up on time')
INSERT [dbo].[ReservationStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'Fulfilled', N'Fulfilled', N'The user has borrowed the book')
INSERT [dbo].[ReservationStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'Pending', N'Pending', N'The user has reserved the book')
INSERT [dbo].[ReservationStatuses] ([StatusCode], [DisplayName], [Description]) VALUES (N'ReadyToPickup', N'Ready to Pick Up', N'The book is available for the user')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Email], [Role], [Status], [verifyCode]) VALUES (1, N'john_doe', N'189f40034be7a199f1fa9891668ee3ab6049f82d38c68be70f596eab2e1857b7', N'John Do', N'john@example.com', N'member', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Email], [Role], [Status], [verifyCode]) VALUES (2, N'jane_admin', N'189f40034be7a199f1fa9891668ee3ab6049f82d38c68be70f596eab2e1857b7', N'Jane Smith', N'jane@example.com', N'admin', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Email], [Role], [Status], [verifyCode]) VALUES (3, N'bob123', N'3e23e8160039594a33894f6564e1b1348bbd7a0088d42c4acb73eeaed59c009d', N'Bob Johnson', N'bob@example.com', N'member', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Email], [Role], [Status], [verifyCode]) VALUES (4, N'alice88', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', N'Alice Brown', N'alice@example.com', N'member', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Email], [Role], [Status], [verifyCode]) VALUES (5, N'tom_mod', N'e3b98a4da31a127d4bde6e43033f66ba274cab0eb7eb1c70ec41402bf6273dd8', N'Tom Clark', N'tom@example.com', N'member', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Email], [Role], [Status], [verifyCode]) VALUES (6, N'phong', N'148de9c5a7a44d19e56cd9ae1a554bf67847afb0c58f6e12fa29ac7ddfca9940', N'phong', N'phongltv0104@gmail.com', N'member', 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E45BD2E00D]    Script Date: 22/07/2025 8:17:00 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Borrows] ADD  DEFAULT (dateadd(day,(7),getdate())) FOR [ExpectedReturnDate]
GO
ALTER TABLE [dbo].[Fines] ADD  DEFAULT ('Unpaid') FOR [StatusCode]
GO
ALTER TABLE [dbo].[Fines] ADD  CONSTRAINT [DF_Fines_CreatedAt]  DEFAULT (CONVERT([date],getdate())) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[LostBooks] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF_Notifications_CreatedAt]  DEFAULT (CONVERT([date],getdate())) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[ReservationDetails] ADD  DEFAULT ('Pending') FOR [StatusCode]
GO
ALTER TABLE [dbo].[ReservationDetails] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF_Reservations_ReserveDate]  DEFAULT (CONVERT([date],getdate())) FOR [ReserveDate]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT ('Pending') FOR [StatusCode]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('member') FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[BorrowDetails]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BorrowDetails]  WITH CHECK ADD  CONSTRAINT [FK__BorrowDet__Borro__44FF419A] FOREIGN KEY([BorrowID])
REFERENCES [dbo].[Borrows] ([BorrowID])
GO
ALTER TABLE [dbo].[BorrowDetails] CHECK CONSTRAINT [FK__BorrowDet__Borro__44FF419A]
GO
ALTER TABLE [dbo].[Borrows]  WITH CHECK ADD  CONSTRAINT [FK__Borrows__UserID__412EB0B6] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Borrows] CHECK CONSTRAINT [FK__Borrows__UserID__412EB0B6]
GO
ALTER TABLE [dbo].[Fines]  WITH CHECK ADD FOREIGN KEY([BorrowID])
REFERENCES [dbo].[Borrows] ([BorrowID])
GO
ALTER TABLE [dbo].[Fines]  WITH CHECK ADD FOREIGN KEY([StatusCode])
REFERENCES [dbo].[FineStatuses] ([StatusCode])
GO
ALTER TABLE [dbo].[Fines]  WITH CHECK ADD  CONSTRAINT [FK_Fines_FineReasons] FOREIGN KEY([Reason])
REFERENCES [dbo].[FineReasons] ([ReasonCode])
GO
ALTER TABLE [dbo].[Fines] CHECK CONSTRAINT [FK_Fines_FineReasons]
GO
ALTER TABLE [dbo].[LostBooks]  WITH CHECK ADD  CONSTRAINT [FK_LostBooks_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[LostBooks] CHECK CONSTRAINT [FK_LostBooks_Books]
GO
ALTER TABLE [dbo].[LostBooks]  WITH CHECK ADD  CONSTRAINT [FK_LostBooks_Borrows] FOREIGN KEY([BorrowID])
REFERENCES [dbo].[Borrows] ([BorrowID])
GO
ALTER TABLE [dbo].[LostBooks] CHECK CONSTRAINT [FK_LostBooks_Borrows]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD FOREIGN KEY([StatusCode])
REFERENCES [dbo].[ReservationStatuses] ([StatusCode])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([StatusCode])
REFERENCES [dbo].[ReservationStatuses] ([StatusCode])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Borrows]  WITH CHECK ADD  CONSTRAINT [CK_Borrows_Status] CHECK  (([Status]='Partially Lost' OR [Status]='Overdue' OR [Status]='Lost' OR [Status]='Returned' OR [Status]='Borrowing'))
GO
ALTER TABLE [dbo].[Borrows] CHECK CONSTRAINT [CK_Borrows_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='member' OR [Role]='admin'))
GO
