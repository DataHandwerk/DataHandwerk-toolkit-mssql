Create   View configT.numbers_0_2047
As
Select
    [number]
  , [type]
  , [low]
  , [high]
  , [status]
From
    [configT].[spt_values]
Where
    [type] = 'P';