/****** Object: UserDefinedFunction [dbo].[isFound] Script Date: 05/03/2013 11:54:23 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
-- ============================================= 
-- Author:	 Andrew Pallant 
-- Create date: 03/05/2013 
-- Description:	Find a value in a comma delimited string of values 
-- ============================================= 
CREATE FUNCTION [dbo].[isFound] 
( 
	@SearchString as varchar(200), 
	@SearchValue as varchar(10) 
) 
RETURNS bit 
AS 

BEGIN 
declare @rtn int 
set @rtn = 0 

-- Declare the return variable here 
set @SearchString=rtrim(ltrim(@SearchString)) 
set @SearchValue=rtrim(ltrim(@SearchValue)) 
set @SearchString = @SearchString + ',' 

declare @i int 
set @i=charindex(',',@SearchString) 
declare @compValue varchar(10) 

while @i>=1 BEGIN 
	set @compValue = left(@SearchString,@i-1) 
	set @compValue=rtrim(ltrim(@compValue)) 
	set @SearchString=substring(@SearchString,@i+1,len(@SearchString)-@i)
	set @SearchString=rtrim(ltrim(@SearchString)) 
	set @i=charindex(',',@SearchString) 
	if @compValue = @SearchValue BEGIN 
		set @rtn = 1 
	END 
END 

-- Return the result of the function 
RETURN @rtn 

END