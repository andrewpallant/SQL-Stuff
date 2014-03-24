SET ANSI_NULLS ON 
GO SET QUOTED_IDENTIFIER ON 
GO 
-- ============================================= 
-- Author:	 Andrew Pallant 
-- Create date: August 27, 2013 
-- Description:	Get Numeric Value Prior to a String within a String. 
-- ============================================= 
CREATE FUNCTION f_read_num_before_some_string 
(  
	@stringValue varchar(max), 
	@search varchar(max) 
) 
RETURNS varchar(100) 
AS 
BEGIN 

DECLARE @intval as varchar(100) 
-- Value to be returned 
DECLARE @RECORDINGVALUE bit 

-- Flag to indicate the recording of the value to be returned 
declare @newvalue as varchar(100) 

-- Working String Value -- 
Set Defaults set @newvalue = '' 
set @RECORDINGVALUE = 0 
set @intval = null 

-- Start Looping and Building	 
IF len(isnull(@stringValue,'')) > 0 BEGIN 
	declare @startIndex as int 
	set @startIndex = CHARINDEX(@search,@stringValue) 
	declare @counter int 
	set @counter = @startIndex 

	WHILE @counter > 0 BEGIN 
		declare @temp as varchar(1) 
		set @temp = substring(@stringValue,@counter,1) 
		if @temp = ' ' and LEN(@newvalue)> 0 BEGIN 
			-- STOP - Drop and Roll 
				set @counter = -1 
		END 
		
		-- If we have a space - do work! 
		IF @temp <> ' ' BEGIN 
			IF @RECORDINGVALUE = 1 and isnumeric(@temp) = 0 BEGIN 
				set @counter = -1 
					-- STOP - Drop and Roll 
			END ELSE IF isnumeric(@temp) = 1 BEGIN 
				set @RECORDINGVALUE = 1 
				-- Build Return Value 
				set @newvalue = @temp + @newvalue; 
			END 
		END 

		set @counter = @counter - 1 
	END 
END 

IF @newvalue = '' BEGIN 
	SET @newvalue = '0' 
END 

-- Return the result of the function 
RETURN @newvalue 

END 

GO