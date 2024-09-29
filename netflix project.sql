show databases;
create database netflix;
use netflix;

create table netflix1(
show_id varchar(6),	
type	varchar(10),
title	varchar(150),
director varchar(208),
cast varchar(1000),	
country	varchar(150),
date_added	varchar(50),
release_year	int,
rating	varchar(10),
duration varchar(15),	
listed_in	varchar(100),
description varchar(250)
);

select * from netflix1;
select count(*) from netflix1;

-- problem 1
-- count the number of movies vs TV shows
select type,count(*) from netflix1 group by type;

-- problem 2
-- list all movies released in a specific time (i.g 2021)
select *  from netflix1 where type = 'Movie' and release_year = 2021; 

-- problem 3
-- find the most common rating for movies and TV shows
select type,rating,count(*),rank() over(partition by type order by count(*)desc) as max_rating from netflix1 group by 1,2 ;

-- problem 4
-- identify the longest movie
select * from netflix1 where type = 'Movie' and duration = (select max(duration) from netflix1) ;


-- problem 5 
-- find the top 5 countries with the most content on netflix
select country,count(show_id) from netflix1 group by country limit 5;

-- problem 6 
-- find all the movies/TV shows by director 'Kirsten Johnson'
select * from netflix1 where director like  '%Kirsten Johnson%';

-- problem 7
-- find the total number of TV shows relesed per year
select release_year,count(show_id) as total_tv_shows from netflix1 where type = 'TV Show'
group by release_year;

-- problem 8
-- count the number of content items in each genre
select listed_in,count(show_id) from netflix1 group by listed_in;

-- problem 9
-- find each year and the average numbers of content release by india on netlfix,return top 5 year with highest avg content release;
select release_year ,avg(show_id) from netflix1 where country = 'India' ;

-- problem 10
-- list all the movies that are documentaries
select * from netflix1 where listed_in like '%Documentaries%';

-- problem 11
-- find all content without a director
select * from netflix1 where director is null;

-- problem 12
-- find how many movies actor 'salman khan' appeared in last 10 yeares;
select * from netflix1 where cast like '%Salman khan%'  and release_year >extract(year from current_date)-10;

-- problem 13 
-- find the top 10 actors who have appeared in the highest number of movies produced in indea.
select actor,count(*) as total_content from (select substring_index2(substring_index2(cast,',',1),',',-1) as actor from netflix1 where country like '%India%'
union all
select substring_index2(substring_index2(cast,',',2),',',-1) as actor from netflix1 where country like '%India%'
union all
select substring_index2(substring_index2(cast,',',3),',',-1) as actor from netflix1 where country like '%India%'
union all
select substring_index2(substring_index2(cast,',',4),',',-1) as actor from netflix1 where country like '%India%'
union all
select substring_index2(substring_index2(cast,',',5),',',-1) as actor from netflix1 where country like '%India%'
union all
select substring_index2(substring_index2(cast,',',6),',',-1) as actor from netflix1 where country like '%India%'
union all
select substring_index2(substring_index2(cast,',',7),',',-1) as actor from netflix1 where country like '%India%'
) as actors group by actor order by total_content desc limit 10;

-- problem 14 
-- find the top 5 most popular genres in netflix content
select listed_in,count(*) as total_content from netflix1 group by listed_in order by total_content desc limit 5;

-- problem 15
-- get the number of movies and tv shows produced each country
select country,type,count(*) as total_content from netflix1 group by country,type order by total_content desc;

-- problem 16
-- list all titles with a rating of 'PG-13' relesased after 2015
select title,rating,release_year from netflix1 where rating = 'PG-13' and release_year >2015 order by release_year desc;

-- problem 17
-- list all directors who have directed more than 3 netflix titles
select director,count(*) as total_content from netflix1 group by director having total_content>3;
