USE [i2084700_Project4]
GO

/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 6/24/2020 2:17:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Consignor](
	[RowID] [int] IDENTITY NOT NULL,
	[Id] [int] NOT NULL,
	[Consignor] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Discount] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Container](
	[RowID] [int] IDENTITY NOT NULL,
	[Id] [int] NOT NULL,
	[Type] [varchar](50) NULL,
	[RefrigerationFlag] [varchar](50) NULL,
	[PowerFlag] [varchar](50) NULL,
	[Length] [varchar](50) NULL,
	[Cubes] [int] NULL,
	[EuroPricePerKm] [decimal](6, 2) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Date](
	[RowID] [int] IDENTITY NOT NULL,
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[FullDate] [char](10) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeek] [char](1) NULL,
	[DayOfWeekInMonth] [varchar](2) NULL,
	[DayOfWeekInYear] [varchar](2) NULL,
	[DayOfQuarter] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHoliday] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[HolidayName] [varchar](50) NULL,
	[FiscalDayOfYear] [varchar](3) NULL,
	[FiscalWeekOfYear] [varchar](3) NULL,
	[FiscalMonth] [varchar](2) NULL,
	[FiscalQuarter] [char](1) NULL,
	[FiscalQuarterName] [varchar](9) NULL,
	[FiscalYear] [char](4) NULL,
	[FiscalYearName] [char](7) NULL,
	[FiscalMonthYear] [char](10) NULL,
	[FiscalMMYYYY] [char](6) NULL,
	[FiscalFirstDayOfMonth] [date] NULL,
	[FiscalLastDayOfMonth] [date] NULL,
	[FiscalFirstDayOfQuarter] [date] NULL,
	[FiscalLastDayOfQuarter] [date] NULL,
	[FiscalFirstDayOfYear] [date] NULL,
	[FiscalLastDayOfYear] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Item](
	[RowID] [int] IDENTITY NOT NULL,
	[Id] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[StorageType] [nvarchar](50) NULL,
	[HazardFlag] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Port](
	[RowID] [int] IDENTITY NOT NULL,
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Ship](
	[RowID] [int] IDENTITY NOT NULL,
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[MaxNumberContain] [int] NULL,
	[SpeedInKnots] [int] NULL,
	[SpeedInKm_H] [int] NULL,
	[Country] [nvarchar](50) NULL,
	[Yearcost] [money] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Fact_Shipment](
	[RowID] [int] IDENTITY NOT NULL,
	[ShipId] [int] NOT NULL,
	[ContainerId] [int] NOT NULL,
	[ConsignorId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[ContainerNr] [nvarchar](50) NULL,
	[PortIdCurrent] [int] NOT NULL,
	[PortIdNext] [int] NOT NULL,
	[LegDateArrival] [datetime] NOT NULL,
	[LegDateDepart] [datetime] NOT NULL,
	[TrajectDistance] [int] NULL,
	[NumberContainers] [int] NULL,
	[ActiveStatus] [nvarchar](10) NULL
) ON [PRIMARY]
GO

