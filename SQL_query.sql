CREATE DATABASE SALES;

CREATE TABLE [SALES].[dbo].[Customers] (
	customer_id VARCHAR (25) PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL);


--To generate the format file, Open the command prompt and give the below command.
--BCP Sales.dbo.Customers format nul -c -f C:\SQL_data\customers_format.fmt -T

--To generate XML format file, specify the option -x as below
--BCP Sales.dbo.Customers format nul -c -x -f C:\SQL_data\customers_xml_format.xml -T


BULK INSERT [SALES].[dbo].[Customers]   
   FROM 'C:\SQL_data\sales_customer_data.csv'   
   WITH (FORMATFILE = 'C:\SQL_data\customers_xml_format.xml',TABLOCK);  


