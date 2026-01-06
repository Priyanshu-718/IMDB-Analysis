Create database movies;
use movies;
#here we are checking weather the dataset is loaded properly or not
SELECT  *
FROM movies.`imdb-movie-data`;

#1.count of total movies there are total 830 movies
SELECT COUNT(Title)
FROM movies.`imdb-movie-data`;

#2.Top 10 highest rated movies
SELECT Rating,Title
FROM movies.`imdb-movie-data`
ORDER BY Rating DESC LIMIT 10;
#These are the top 10 highest rated movies in IMDB
-- 9	The Dark Knight
-- 8.8	Inception
-- 8.6	The Intouchables
-- 8.6	Kimi no na wa
-- 8.6	Interstellar
-- 8.5	Taare Zameen Par
-- 8.5	The Dark Knight Rises
-- 8.5	The Lives of Others
-- 8.5	The Prestige
-- 8.5	Whiplash

#3.list all the movies which are realesed after 2015 with an IMDB rating of 8
SELECT Title
FROM movies.`imdb-movie-data`
WHERE Year>2015 and Rating>8;
-- La La Land
-- Hacksaw Ridge
-- Lion
-- Zootopia
-- Kimi no na wa
-- Ah-ga-ssi

#4.Show total number of movies by each year
SELECT COUNT(Title),Year
FROM movies.`imdb-movie-data`
Group by Year;
-- 91	2014
-- 62	2012
-- 195	2016
-- 57	2011
-- 107	2015
-- 48	2008
-- 40	2006
-- 44	2007
-- 45	2009
-- 57	2010
-- 84	2013

#5.retrive all the movies that belong to drama gerne
SELECT COUNT( Title) ,Genre
FROM movies.`imdb-movie-data`
WHERE Genre="Drama";
-- --THERE WERE TOTAL 29 MOVIES IN DRAMA GENRE 

#6.Display movies sorted by release year latest first
SELECT Title,Year
from movies.`imdb-movie-data`
order by Year DESC;

#7.What is average IMDB Rating of all movies
SELECT AVG(Rating)
FROM movies.`imdb-movie-data`;
-- 6.813975903614461 avg rating of all movies

#8.Which director has higest number of movies
SELECT COUNT(*) AS total_movies,Director
FROM movies.`imdb-movie-data`
GROUP BY Director
ORDER BY total_movies DESC LIMIT 1;
-- 	Ridley Scott made 8 movies

#9.#Find the highest grossing and lowest grossing movie
SELECT MAX(`Revenue (Millions)`) AS max_revenue
FROM movies.`imdb-movie-data`;
-- 936.63
SELECT MIN(`Revenue (Millions)`)
FROM movies.`imdb-movie-data`;
-- 0

#10.Coutn number of movies released by each gerne
SELECT COUNT(Title),Genre
FROM movies.`imdb-movie-data`
GROUP BY Genre;

#11.identfy the year which has maximun movie release 
SELECT COUNT(Title),Year
FROM movies.`imdb-movie-data`
GROUP BY Year
order by Year DESC LIMIT 1;
-- 195 movies were released in	2016

#12.Find all movies whose title contain 'love'
SELECT Title
FROM movies.`imdb-movie-data`
WHERE Title like'%love%';
#these are the movies which has word love in it
-- 10 Cloverfield Lane
-- Crazy, Stupid, Love.
-- Lovesong
-- Cloverfield
-- The Lovely Bones
-- Love & Other Drugs
-- Love, Rosie
-- Love & Friendship
-- To Rome with Love
-- The Love Witch
-- Endless Love

#13.list director whose name starts with 's'
SELECT COUNT(Director)
FROM movies.`imdb-movie-data`
WHERE Director like'%S%';
-- There were 434 whose name starts with s

#14.Find the movies which belongs to more than one genre
SELECT COUNT(Title)
FROM movies.`imdb-movie-data`
WHERE Genre LIKE'%,%';#%.% helps us to check above 2 gernes
-- There are 766 movies which has more than on genre

#15 Display movies released in the same year as the highest-rated movie.
SELECT Title,Rating,Year
FROM movies.`imdb-movie-data`
ORDER BY Rating DESC LIMIT 1;
-- The Dark Knight	9	2008
SELECT Title,Rating,Year
FROM movies.`imdb-movie-data`
where  Year=2008;

SELECT Title, Rating, Year
FROM movies.`imdb-movie-data`
WHERE Year = (
    SELECT Year
    FROM movies.`imdb-movie-data`
    ORDER BY Rating DESC
    LIMIT 1
);

#16 Find movies who has description more than 200 characters
SELECT Title
FROM movies.`imdb-movie-data`
WHERE length(Description)>200;

#17.Find the movies whoes rating is more than average rating
SELECT COUNT(Title)
FROM movies.`imdb-movie-data`
WHERE Rating >(
SELECT AVG(Rating)
FROM movies.`imdb-movie-data`
);
-- #there are 419 movies whoes ratings are above average ratings

#18.Identify directors whoes movies were rated above 7.5
SELECT Director 
FROM movies.`imdb-movie-data`
WHERE Rating>7.5;

#19.Find the second heighest imdb rated movie
SELECT Title, Rating
FROM movies.`imdb-movie-data`
ORDER BY Rating DESC LIMIT 1 OFFSET 1; #offset 1 means it will skip the first movie and we will get the seond movie as our output
-- inception 8.8

#20. List the movies whoes rating is below average rating of there genre
SELECT Title, Genre, Rating
FROM movies.`imdb-movie-data` m
WHERE Rating<(
 SELECT AVG(Rating)
 FROM movies.`imdb-movie-data`
 WHERE Genre=m.Genre
);
-- over here first a movie is slected with its genre and rating
-- then we go to subquery in whihc we find avg of that movie with respect to it's genre

#21. find the year in which most number of movies are relaeased
SELECT Year,COUNT(Title)
FROM movies.`imdb-movie-data`
GROUP BY Year 
ORDER BY Year DESC Limit 1;
-- in 2016 there were	195 movies released

#22. Find the top 3 directors whose movies have the highest average IMDb rating (consider only directors with at least 5 movies).
SELECT Director,count(Title) as m
FROM movies.`imdb-movie-data`
GROUP BY Director
ORDER BY m DESC limit 3;
-- Ridley Scott	8
-- David Yates	6
-- Michael Bay	6

#23. Find the top 5 genres with the highest average IMDb rating.
SELECT Genre, AVG(Rating) as avg_rating
FROM movies.`imdb-movie-data`
GROUP BY Genre
ORDER BY avg_rating DESC LIMIT 5;
-- Animation,Drama,Fantasy	8.6
-- Drama,Family,Music	8.5
-- Drama,Western	8.4
-- Adventure,Drama,War	8.3
-- Adventure,Drama,Sci-Fi	8.3

# 24. Find the movie(s) with the highest revenue (Revenue (Millions)).
SELECT Title, `Revenue (Millions)`
FROM movies.`imdb-movie-data`
ORDER BY `Revenue (Millions)` DESC LIMIT 1;
-- Star Wars: Episode VII - The Force Awakens	936.63

#25. Find the average IMDb rating for each genre and display them in descending order of average rating.
SELECT Genre, AVG(Rating) as avg_rating
FROM movies.`imdb-movie-data`
GROUP BY Genre
ORDER BY avg_rating DESC;

#26. Find the total revenue generated by each genre and display the top 3 genres by total revenue.
SELECT Genre, SUM(`Revenue (Millions)`) as sum_revenue
FROM movies.`imdb-movie-data`
Group by Genre
ORDER BY sum_revenue DESC LIMIT 3;

# 27. Find the director(s) whose movies have generated the highest total revenue.
SELECT Director, SUM( `Revenue (Millions)`) as sum_revenue
FROM movies.`imdb-movie-data`
GROUP BY Director
ORDER BY sum_revenue DESC LIMIT 1;
-- J.J. Abrams	1683.4499999999998


