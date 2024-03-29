/*
Tesla is investigating bottlenecks in their production, 
and they need your help to extract the relevant data. 
Write a query that determines which parts have begun the assembly process but are not yet finished.

Assumptions

Table parts_assembly contains all parts in production.
A part with no finish_date is an unfinished part.

parts_assembly Table
Column Name	Type
part	string
finish_date	datetime
assembly_step	integer

parts_assembly Example Input
part	finish_date	assembly_step
battery	01/22/2022 00:00:00	1
battery	02/22/2022 00:00:00	2
battery	03/22/2022 00:00:00	3
bumper	01/22/2022 00:00:00	1
bumper	02/22/2022 00:00:00	2
bumper		3
bumper		4

Example Output
part
bumper
Explanation
The only item in the output is "bumper" because step 3 didn't have a finish date.

The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT 
  DISTINCT(part) 
FROM 
  parts_assembly
WHERE
  finish_date is NULL;