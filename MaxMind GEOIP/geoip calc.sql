SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
-- ============================================= 
-- Author: Andrew Pallant ( www.ldndeveloper.com ) 
-- Create date: 19 / 04 / 2013 
-- Description: Used as a reference: http://dev.maxmind.com/geoip/csv 
-- ============================================= 
CREATE FUNCTION fetchCountryINT 
( 
	@IP as varchar(30) 
) 
RETURNS numeric(16,0) 
AS 
BEGIN 
	declare @o1 numeric(16,0) 
	declare @o2 numeric(16,0) 
	declare @o3 numeric(16,0) 
	declare @o4 numeric(16,0) 
	declare @CountryInt numeric (16,0) 
	declare @LastIndex int 

-- Get 1st Segment 
set @LastIndex = CHARINDEX('.',@IP) 
select @o1 = SUBSTRING(@IP,1, @LastIndex-1) 

-- Get 2nd Segment 
set @IP = SUBSTRING(@IP,@LastIndex+1, LEN(@IP) - @LastIndex) 
set @LastIndex = CHARINDEX('.',@IP) 
select @o2 = SUBSTRING(@IP,1, @LastIndex-1) 

-- Get 3rd Segment 
set @IP = SUBSTRING(@IP,@LastIndex+1, LEN(@IP) - @LastIndex) 
set @LastIndex = CHARINDEX('.',@IP) 
select @o3 = SUBSTRING(@IP,1, @LastIndex-1) 

-- Get 4th Segment 
set @IP = SUBSTRING(@IP,@LastIndex+1, LEN(@IP) - @LastIndex) 
set @LastIndex = CHARINDEX('.',@IP) 
select @o4 = @IP 

-- Calculate Integer 
select @CountryInt = (@o1 * 16777216 ) + (@o2 * 65536) + (@o3 * 256) + @o4 

RETURN @CountryInt 

END 
GO