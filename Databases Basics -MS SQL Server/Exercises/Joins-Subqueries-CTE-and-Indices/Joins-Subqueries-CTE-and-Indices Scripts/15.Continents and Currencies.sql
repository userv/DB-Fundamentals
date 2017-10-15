
SELECT DISTINCT
       ContinentCode,
       CurrencyCode,
       CurrencyUsage
FROM
(
    SELECT ContinentCode,
           CurrencyCode,
           CurrencyUsage,
           DENSE_RANK() OVER(PARTITION BY(ContinentCode) ORDER BY CurrencyUsage DESC) AS [Rank]
    FROM
    (
        SELECT ContinentCode,
               CurrencyCode,
               COUNT(CurrencyCode) AS CurrencyUsage
        FROM Countries
        GROUP BY CurrencyCode,
                 ContinentCode
    ) AS c
) AS r
WHERE Rank = 1
      AND CurrencyUsage > 1;
  
  
 