
SELECT TownID,
       Name
FROM Towns
WHERE Name LIKE '[MKBE]%'
ORDER BY Name

GO 

SELECT TownID,
       Name
FROM Towns
WHERE Name LIKE '[^RBD]%'
ORDER BY Name