USE [i2084700_Project4]
GO

ALTER TABLE [dbo].[Dim_Ship]
ADD CONSTRAINT PK_Ship PRIMARY KEY CLUSTERED (RowID);

ALTER TABLE [dbo].[Dim_Port]
ADD CONSTRAINT PK_Port PRIMARY KEY CLUSTERED (RowID);

ALTER TABLE [dbo].[Dim_Item]
ADD CONSTRAINT PK_Item PRIMARY KEY CLUSTERED (RowID);

ALTER TABLE [dbo].[Dim_Date]
ADD CONSTRAINT UN_Date UNIQUE (Date);

ALTER TABLE [dbo].[Dim_Container]
ADD CONSTRAINT PK_Container PRIMARY KEY CLUSTERED (RowID);

ALTER TABLE [dbo].[Dim_Consignor]
ADD CONSTRAINT PK_Consignor PRIMARY KEY CLUSTERED (RowID);


ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (ShipId) REFERENCES Dim_Ship(RowId);

ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (ContainerId) REFERENCES Dim_Container(RowId);

ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (ConsignorId) REFERENCES Dim_Consignor(RowId);

ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (ItemId) REFERENCES Dim_Item(RowId);

ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (PortIdCurrent) REFERENCES Dim_Port(RowId);

ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (PortIdNext) REFERENCES Dim_Port(RowId);

ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (LegDateArrival) REFERENCES Dim_Date(Date);

ALTER TABLE [dbo].[Fact_Shipment]
ADD FOREIGN KEY (LegDateDepart) REFERENCES Dim_Date(Date);




--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (ShipId) REFERENCES Dim_Ship(Id);

--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (ContainerId) REFERENCES Dim_Container(Id);

--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (ConsignorId) REFERENCES Dim_Consignor(Id);

--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (ItemId) REFERENCES Dim_Item(Id);

--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (PortIdCurrent) REFERENCES Dim_Port(Id);

--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (PortIdNext) REFERENCES Dim_Port(Id);

--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (LegDateArrival) REFERENCES Dim_Date(Date);

--ALTER TABLE [dbo].[Fact_Shipment]
--ADD FOREIGN KEY (LegDateDepart) REFERENCES Dim_Date(Date);