DECLARE @StartDate datetime
DECLARE @EndDate datetime

SET @StartDate = '03/01/2020'
SET @EndDate = '12/31/2035' 

DECLARE @LoopDate datetime
SET @LoopDate = @StartDate
WHILE @LoopDate <= @EndDate
BEGIN
 INSERT INTO [marimba_tfs].dbo.Dates VALUES (
  @LoopDate,
  Year(@LoopDate),
  Month(@LoopDate), 
  Day(@LoopDate), 
  CASE WHEN Month(@LoopDate) IN (1, 2, 3) THEN 1
   WHEN Month(@LoopDate) IN (4, 5, 6) THEN 2
   WHEN Month(@LoopDate) IN (7, 8, 9) THEN 3
   WHEN Month(@LoopDate) IN (10, 11, 12) THEN 4
  END 
   
 )  
 SET @LoopDate = DateAdd(d, 1, @LoopDate)
END
