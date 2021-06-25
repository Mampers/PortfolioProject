-- This query is to show all the columns

SELECT *
FROM MarvelMovies

-- This is the query that shows the shows the top 10 Marvel movies through Box Office Total 

SELECT TOP(10) name, [BoxOfficeOverall(millions)]
FROM Marvelmovies
ORDER BY [BoxOfficeOverall(millions)] DESC;

-- This is the query that shows the top ten most expensive Marvel Movies budget 

SELECT TOP (10) name, [Budget(millions)]
FROM Marvelmovies
ORDER BY [Budget(millions)] DESC;

ALTER TABLE Marvelmovies
DROP COLUMN F8
 
 -- Calculating the basic profit by deleting Budget(millions) from BoxOFficeOverall(Millions)
 
 SELECT TOP (10) name, 
 [BoxOfficeOverall(millions)], 
 [Budget(millions)], 
 ([BoxOfficeOverall(millions)]-[Budget(millions)]) as [Profit(millions)]
 FROM Marvelmovies
 ORDER BY [Profit(millions)] DESC

 ALTER TABLE MarvelMovies
 Add [Profit(millions)] float

UPDATE Marvelmovies
SET [Profit(millions)]  = ([BoxOfficeOverall(millions)]-[Budget(millions)])



 -- Did Disney Acquisition provide more profit?
 -- Disney Acuired Marvel for $4Bn. So what movie did Disney break even?

 SELECT * 
 FROM Marvelmovies
 WHERE [year ] >= 2010

 
SELECT  name,
		[year ],
		[Profit(millions)],
		SUM([Profit(millions)]) 
		OVER (ORDER BY [IdNo]) AS ProfitRunTotal
FROM MarvelMovies
WHERE [year ] >= 2010

 