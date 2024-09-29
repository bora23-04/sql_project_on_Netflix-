# Netflix movies and TV shows data analysis using sql
## Objective
1. Analyze the distribution of content types (movies and TV shows).
2. List and analyze content based on release years,country and durations.
3. Explore and catagorize content based on specific criteria and keyworks

## Schemas
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

## Business Problems and Solutions
## 1.count the number of movies vs TV shows
select type,count(*) from netflix1 group by type;

## list all movies released in a specific time (i.g 2021)
![image](https://github.com/user-attachments/assets/6669a014-da23-49c0-a9c2-bb992402a10a)

