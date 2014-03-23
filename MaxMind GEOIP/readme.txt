Recently I implemented a GEOIP solution on a client site; however, the site was built on a 
Microsoft SQL database engine and I could not find a solution for looking up the country 
name easily.  Through some quick Google searches I had tripped on the site for which I 
started at ( http://dev.maxmind.com/geoip/csv ).  The site maxmind.com gave me the MySQL 
solution and the mathematical solution for creating the integer.  Based on this information, 
I created my own function in MS SQL to retrieve me the calculated IP integer for easier use. 

How to use the function in a SQL statement:

select country_name from GEOIP where dbo.fetchCountryINT('174.36.207.186') between begin_ip_num AND end_ip_num

- See more at: http://www.unlatched.com/blog_MaxMind_GEOIP_Look-up_for_Microsoft_SQL.aspx