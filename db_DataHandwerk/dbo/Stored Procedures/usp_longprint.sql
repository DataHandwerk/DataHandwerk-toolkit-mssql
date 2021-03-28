--code idea from analyticscreator.com
CREATE   PROCEDURE [dbo].[usp_longprint] @Sql nvarchar(max) AS
BEGIN
	DECLARE
		@len int,
		@CRpos int,
		@SqlOut nvarchar(4000)

	SET @len =2000
	WHILE @Sql IS NOT NULL
	BEGIN
		IF LEN(@SQL) <= @len
		BEGIN
			PRINT @SQL
			BREAK
		END ELSE
		BEGIN
			SET @CRpos = CHARINDEX(CHAR(10), @Sql, @len)
			IF @CRpos - @len < 2000
				SET @SqlOut = LEFT(@Sql, @CRpos)
			ELSE BEGIN
				RAISERROR ('OOPS! The game is over :(', 16, 1)
			END
			PRINT @SqlOut
			SET @Sql = RIGHT(@Sql, LEN(@Sql) - @CRpos)
		END
	END
END
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '63b8b46b-a08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'usp_longprint';

