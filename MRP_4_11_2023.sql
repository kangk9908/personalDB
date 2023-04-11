USE [master]
GO
/****** Object:  Database [MRP]    Script Date: 4/11/2023 11:47:15 AM ******/
CREATE DATABASE [MRP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MRP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MRP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MRP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MRP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MRP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MRP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MRP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MRP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MRP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MRP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MRP] SET ARITHABORT OFF 
GO
ALTER DATABASE [MRP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MRP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MRP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MRP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MRP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MRP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MRP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MRP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MRP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MRP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MRP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MRP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MRP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MRP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MRP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MRP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MRP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MRP] SET RECOVERY FULL 
GO
ALTER DATABASE [MRP] SET  MULTI_USER 
GO
ALTER DATABASE [MRP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MRP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MRP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MRP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MRP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MRP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MRP', N'ON'
GO
ALTER DATABASE [MRP] SET QUERY_STORE = OFF
GO
USE [MRP]
GO
/****** Object:  Table [dbo].[bill_of_materials]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_of_materials](
	[bom_id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [int] NOT NULL,
	[rm_id] [int] NOT NULL,
	[build_item_id] [int] NOT NULL,
	[consumable_id] [int] NOT NULL,
	[resource_id] [int] NOT NULL,
	[quantity_used] [int] NOT NULL,
	[quantity_needed] [int] NOT NULL,
	[time_needed] [time](7) NOT NULL,
	[manufactured_product_id] [int] NOT NULL,
 CONSTRAINT [PK_bill_of_materials] PRIMARY KEY CLUSTERED 
(
	[bom_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bin]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bin](
	[bin_id] [int] IDENTITY(1,1) NOT NULL,
	[location] [varchar](50) NOT NULL,
	[contents] [varchar](50) NOT NULL,
 CONSTRAINT [PK_bin] PRIMARY KEY CLUSTERED 
(
	[bin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[build_item]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[build_item](
	[build_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[serial_number] [int] NOT NULL,
 CONSTRAINT [PK_build_item] PRIMARY KEY CLUSTERED 
(
	[build_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[consumables]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consumables](
	[consumable_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_consumables] PRIMARY KEY CLUSTERED 
(
	[consumable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_order]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[item_id] [int] NOT NULL,
	[shipment_method] [varchar](50) NOT NULL,
	[shipment_date] [date] NOT NULL,
	[sales_tax] [decimal](18, 0) NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[credit_limit] [decimal](10, 2) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[notes] [varchar](50) NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [varchar](50) NOT NULL,
	[account_name] [varchar](50) NOT NULL,
	[bill_to_address] [varchar](50) NOT NULL,
	[shipping_address] [varchar](50) NOT NULL,
	[default_credit_card_number] [varchar](20) NOT NULL,
	[credit_reference_name_1] [varchar](50) NOT NULL,
	[credit_reference_account_1] [varchar](50) NOT NULL,
	[credit_reference_balance_1] [int] NOT NULL,
	[credit_reference_name_2] [varchar](50) NOT NULL,
	[credit_reference_account_2] [varchar](50) NOT NULL,
	[credit_reference_balance_2] [int] NOT NULL,
	[credit_reference_name_3] [varchar](50) NOT NULL,
	[credit_reference_account_3] [varchar](50) NOT NULL,
	[credit_reference_balance_3] [int] NOT NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hilo_drivers]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hilo_drivers](
	[driver_id] [int] IDENTITY(1,1) NOT NULL,
	[driver_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_hilo_drivers] PRIMARY KEY CLUSTERED 
(
	[driver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[item_name] [varchar](50) NOT NULL,
	[item_description] [varchar](50) NOT NULL,
	[unit_description] [varchar](50) NOT NULL,
	[price] [money] NOT NULL,
	[resource_used] [varchar](50) NULL,
	[type] [varchar](50) NOT NULL,
	[on_hand] [int] NOT NULL,
	[on_order] [int] NOT NULL,
	[committed] [int] NULL,
	[vendor_item_id] [int] NULL,
	[built_in_house] [binary](1) NULL,
	[stock_safety_level] [int] NULL,
	[stock_max_level] [int] NULL,
	[order_lead_time] [time](7) NULL,
 CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufactured_products]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufactured_products](
	[id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[location] [varchar](50) NOT NULL,
 CONSTRAINT [PK_manufactured_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_line_items]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_line_items](
	[line_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_order_line_item] PRIMARY KEY CLUSTERED 
(
	[line_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pending_order]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pending_order](
	[pending_order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[date] [date] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pending_order] PRIMARY KEY CLUSTERED 
(
	[pending_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[raw_material]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[raw_material](
	[rm_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_raw_material] PRIMARY KEY CLUSTERED 
(
	[rm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[received_products]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[received_products](
	[id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[PO_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[received_date] [date] NOT NULL,
	[location_id] [int] NOT NULL,
 CONSTRAINT [PK_received_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resources]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resources](
	[resource_id] [int] IDENTITY(1,1) NOT NULL,
	[location] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[num_operator] [int] NOT NULL,
	[maintenance_descr] [varchar](50) NOT NULL,
	[maintenance_freq] [varchar](50) NOT NULL,
	[replace_date] [date] NOT NULL,
 CONSTRAINT [PK_resources] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipments]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipments](
	[shipment_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[shipment_date] [date] NOT NULL,
 CONSTRAINT [PK_shipments] PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip_plans]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip_plans](
	[trip_id] [int] NOT NULL,
	[driver_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_trip_plans] PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[update_order]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[update_order](
	[update_id] [int] IDENTITY(1,1) NOT NULL,
	[line_item_id] [int] NOT NULL,
	[update_type] [varchar](50) NOT NULL,
	[update_quantity] [int] NOT NULL,
	[update_date] [date] NOT NULL,
	[update_price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_update_order] PRIMARY KEY CLUSTERED 
(
	[update_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendor_accounts]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendor_accounts](
	[vendor_accounts_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[contact] [varchar](50) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[payment_addr] [varchar](50) NOT NULL,
	[vendor_rating] [varchar](50) NOT NULL,
 CONSTRAINT [PK_vendor_accounts] PRIMARY KEY CLUSTERED 
(
	[vendor_accounts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendor_items]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendor_items](
	[vendor_item_id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_accounts_id] [int] NOT NULL,
	[vendor_item_name] [varchar](50) NOT NULL,
	[vendor_item_descr] [varchar](50) NOT NULL,
	[vendor_item_price] [decimal](18, 0) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_vendor_items] PRIMARY KEY CLUSTERED 
(
	[vendor_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warehouse_locations]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouse_locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [varchar](50) NOT NULL,
	[location_address] [varchar](50) NOT NULL,
	[driver_id] [int] NOT NULL,
	[shipment_id] [int] NOT NULL,
	[bin_id] [int] NOT NULL,
 CONSTRAINT [PK_warehouse_locations] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[work_order]    Script Date: 4/11/2023 11:47:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[work_order](
	[work_order_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[current_location] [int] NOT NULL,
	[destination_location] [int] NOT NULL,
	[trip_id] [int] NOT NULL,
 CONSTRAINT [PK_work_order] PRIMARY KEY CLUSTERED 
(
	[work_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill_of_materials]  WITH CHECK ADD  CONSTRAINT [FK_bill_of_materials_consumables] FOREIGN KEY([consumable_id])
REFERENCES [dbo].[consumables] ([consumable_id])
GO
ALTER TABLE [dbo].[bill_of_materials] CHECK CONSTRAINT [FK_bill_of_materials_consumables]
GO
ALTER TABLE [dbo].[bill_of_materials]  WITH CHECK ADD  CONSTRAINT [FK_bill_of_materials_items] FOREIGN KEY([item_id])
REFERENCES [dbo].[items] ([item_id])
GO
ALTER TABLE [dbo].[bill_of_materials] CHECK CONSTRAINT [FK_bill_of_materials_items]
GO
ALTER TABLE [dbo].[bill_of_materials]  WITH CHECK ADD  CONSTRAINT [FK_bill_of_materials_manufactured_products] FOREIGN KEY([manufactured_product_id])
REFERENCES [dbo].[manufactured_products] ([id])
GO
ALTER TABLE [dbo].[bill_of_materials] CHECK CONSTRAINT [FK_bill_of_materials_manufactured_products]
GO
ALTER TABLE [dbo].[bill_of_materials]  WITH CHECK ADD  CONSTRAINT [FK_bill_of_materials_raw_material] FOREIGN KEY([rm_id])
REFERENCES [dbo].[raw_material] ([rm_id])
GO
ALTER TABLE [dbo].[bill_of_materials] CHECK CONSTRAINT [FK_bill_of_materials_raw_material]
GO
ALTER TABLE [dbo].[bill_of_materials]  WITH CHECK ADD  CONSTRAINT [FK_bill_of_materials_resources] FOREIGN KEY([resource_id])
REFERENCES [dbo].[resources] ([resource_id])
GO
ALTER TABLE [dbo].[bill_of_materials] CHECK CONSTRAINT [FK_bill_of_materials_resources]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [FK_customer_order_items] FOREIGN KEY([item_id])
REFERENCES [dbo].[items] ([item_id])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [FK_customer_order_items]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [FK_orders_customers]
GO
ALTER TABLE [dbo].[items]  WITH CHECK ADD  CONSTRAINT [FK_items_vendor_items] FOREIGN KEY([vendor_item_id])
REFERENCES [dbo].[vendor_items] ([vendor_item_id])
GO
ALTER TABLE [dbo].[items] CHECK CONSTRAINT [FK_items_vendor_items]
GO
ALTER TABLE [dbo].[order_line_items]  WITH CHECK ADD  CONSTRAINT [FK_order_line_item_customer_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[customer_order] ([order_id])
GO
ALTER TABLE [dbo].[order_line_items] CHECK CONSTRAINT [FK_order_line_item_customer_order]
GO
ALTER TABLE [dbo].[order_line_items]  WITH CHECK ADD  CONSTRAINT [FK_order_line_item_items] FOREIGN KEY([item_id])
REFERENCES [dbo].[items] ([item_id])
GO
ALTER TABLE [dbo].[order_line_items] CHECK CONSTRAINT [FK_order_line_item_items]
GO
ALTER TABLE [dbo].[pending_order]  WITH CHECK ADD  CONSTRAINT [FK_pending_order_items] FOREIGN KEY([item_id])
REFERENCES [dbo].[items] ([item_id])
GO
ALTER TABLE [dbo].[pending_order] CHECK CONSTRAINT [FK_pending_order_items]
GO
ALTER TABLE [dbo].[received_products]  WITH CHECK ADD  CONSTRAINT [FK_received_products_items] FOREIGN KEY([item_id])
REFERENCES [dbo].[items] ([item_id])
GO
ALTER TABLE [dbo].[received_products] CHECK CONSTRAINT [FK_received_products_items]
GO
ALTER TABLE [dbo].[received_products]  WITH CHECK ADD  CONSTRAINT [FK_received_products_manufactured_products] FOREIGN KEY([item_id])
REFERENCES [dbo].[build_item] ([build_id])
GO
ALTER TABLE [dbo].[received_products] CHECK CONSTRAINT [FK_received_products_manufactured_products]
GO
ALTER TABLE [dbo].[received_products]  WITH CHECK ADD  CONSTRAINT [FK_received_products_pending_order] FOREIGN KEY([PO_id])
REFERENCES [dbo].[pending_order] ([pending_order_id])
GO
ALTER TABLE [dbo].[received_products] CHECK CONSTRAINT [FK_received_products_pending_order]
GO
ALTER TABLE [dbo].[received_products]  WITH CHECK ADD  CONSTRAINT [FK_received_products_warehouse_locations] FOREIGN KEY([location_id])
REFERENCES [dbo].[warehouse_locations] ([location_id])
GO
ALTER TABLE [dbo].[received_products] CHECK CONSTRAINT [FK_received_products_warehouse_locations]
GO
ALTER TABLE [dbo].[shipments]  WITH CHECK ADD  CONSTRAINT [FK_shipments_orders1] FOREIGN KEY([order_id])
REFERENCES [dbo].[customer_order] ([order_id])
GO
ALTER TABLE [dbo].[shipments] CHECK CONSTRAINT [FK_shipments_orders1]
GO
ALTER TABLE [dbo].[trip_plans]  WITH CHECK ADD  CONSTRAINT [FK_trip_plans_trip_plans] FOREIGN KEY([driver_id])
REFERENCES [dbo].[hilo_drivers] ([driver_id])
GO
ALTER TABLE [dbo].[trip_plans] CHECK CONSTRAINT [FK_trip_plans_trip_plans]
GO
ALTER TABLE [dbo].[update_order]  WITH CHECK ADD  CONSTRAINT [FK_update_order_update_order] FOREIGN KEY([line_item_id])
REFERENCES [dbo].[order_line_items] ([line_item_id])
GO
ALTER TABLE [dbo].[update_order] CHECK CONSTRAINT [FK_update_order_update_order]
GO
ALTER TABLE [dbo].[vendor_items]  WITH CHECK ADD  CONSTRAINT [FK_vendor_items_vendor_accounts] FOREIGN KEY([vendor_accounts_id])
REFERENCES [dbo].[vendor_accounts] ([vendor_accounts_id])
GO
ALTER TABLE [dbo].[vendor_items] CHECK CONSTRAINT [FK_vendor_items_vendor_accounts]
GO
ALTER TABLE [dbo].[warehouse_locations]  WITH CHECK ADD  CONSTRAINT [FK_warehouse_locations_bin] FOREIGN KEY([bin_id])
REFERENCES [dbo].[bin] ([bin_id])
GO
ALTER TABLE [dbo].[warehouse_locations] CHECK CONSTRAINT [FK_warehouse_locations_bin]
GO
ALTER TABLE [dbo].[warehouse_locations]  WITH CHECK ADD  CONSTRAINT [FK_warehouse_locations_hilo_drivers] FOREIGN KEY([driver_id])
REFERENCES [dbo].[hilo_drivers] ([driver_id])
GO
ALTER TABLE [dbo].[warehouse_locations] CHECK CONSTRAINT [FK_warehouse_locations_hilo_drivers]
GO
ALTER TABLE [dbo].[warehouse_locations]  WITH CHECK ADD  CONSTRAINT [FK_warehouse_locations_shipments] FOREIGN KEY([shipment_id])
REFERENCES [dbo].[shipments] ([shipment_id])
GO
ALTER TABLE [dbo].[warehouse_locations] CHECK CONSTRAINT [FK_warehouse_locations_shipments]
GO
ALTER TABLE [dbo].[work_order]  WITH CHECK ADD  CONSTRAINT [FK_work_order_trip_plans] FOREIGN KEY([trip_id])
REFERENCES [dbo].[trip_plans] ([trip_id])
GO
ALTER TABLE [dbo].[work_order] CHECK CONSTRAINT [FK_work_order_trip_plans]
GO
USE [master]
GO
ALTER DATABASE [MRP] SET  READ_WRITE 
GO
