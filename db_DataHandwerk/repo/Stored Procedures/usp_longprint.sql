--code idea from analyticscreator.com
create   PROCEDURE [repo].[usp_longprint] @Sql nvarchar(max) AS
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