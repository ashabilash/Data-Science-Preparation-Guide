/*
Leetcode ID: 1501
Leetcode URL: https://leetcode.com/problems/countries-you-can-safely-invest-in/description/
*/
SELECT
    Country.name
FROM
    Calls INNER JOIN Person
    ON Calls.caller_id = Person.id
    INNER JOIN Country
    SUBSTRING(phone_number, 1, 3) = country_code;
GROUP BY Country.name
HAVING SUM(duration) > SELECT(AVG(duration) FROM Calls)


