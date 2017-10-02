SELECT TOP (1000) [CountryCode]
      ,[IsoCode]
      ,[CountryName]
      ,[CurrencyCode]
      ,[ContinentCode]
      ,[Population]
      ,[AreaInSqKm]
      ,[Capital]
  FROM [Geography].[dbo].[Countries]

  SELECT TOP(30) CountryName,Population FROM Countries
  WHERE ContinentCode='EU'
  ORDER BY Population DESC