USE [DGSDATA]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Report_Game_Statistic]
		@LogIdUser=74,
		@prmStartDate='7/20/2017 2:13:57 PM',
		@prmEndDate='7/20/2017 2:13:57 PM',
		@prmBook = '',
		@prmOffice = '',
		@prmPlayer = '',
	    @prmLeague = '',
		@prmGroupby = 0,
		@prmOrderby = 1

SELECT	'Return Value' = @return_value

GO
