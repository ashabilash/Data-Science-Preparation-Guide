/*
Leet code ID: 626
Leet code problem: https://leetcode.com/problems/exchange-seats/
*/

SELECT 
    CASE
        WHEN MOD(id,2)=1 THEN LEAD(ID,1, ID) OVER()
        ELSE id-1
    END
    AS id,
    student
FROM 
    Seat
ORDER BY id;
