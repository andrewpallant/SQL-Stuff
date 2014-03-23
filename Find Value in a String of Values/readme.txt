In a table I have a field that you can use comma delimited value (example 1,2,3,22). When I tried to filtering use a “LIKE” statement on the value 2, I was being returned 2 and 22. ARG!

So what do you do? You create a simple function the returns a 1 or 0. 1 being successfully found and a 0 meaning failed to find. Seems simple enough? Well it was and the function can be easily tweaked to match the solution you need!

Now I can do a simple select statement and get the correct results.

select * [table1] where dbo.isFound([fieldname],2) = 1
I have also used it successfully in select with as a join.

SELECT * FROM [table1] t1 
   INNER JOIN [table2] t2 on .dbo.isFound(t1.[fiedldname],t2.[fieldname]) = 1

- See more at: http://www.unlatched.com/blog_SQL_Function_%E2%80%93_Find_a_Value_in_a_String_of_Values.aspx