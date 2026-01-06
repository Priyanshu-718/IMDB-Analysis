This project performs an in-depth analysis of the IMDb Movie Dataset using MySQL.
The goal is to apply SQL concepts to solve real-world, business-oriented analytical questions related to movies, ratings, revenue, genres, directors, and release trends.

This project was designed as a complete SQL revision project, covering beginner to advanced querying concepts.

🗂️ Dataset Description

Dataset: IMDb Movie Dataset

📄 Columns Used

The dataset contains the following columns:

Title – Movie title

Genre – Movie genre(s) (comma-separated)

Description – Short movie plot

Rank – IMDb rank

Director – Movie director

Actor – Main actors

Year – Release year

Runtime – Duration (minutes)

Rating – IMDb rating

Votes – Number of IMDb votes

Revenue (Millions) – Box office revenue

Metascore – Metacritic score

Note: Some columns (like Genre) contain multiple values separated by commas and were handled using string operations.

🛠️ Tools & Technologies

Database: MySQL

Query Language: SQL

Environment: MySQL Workbench

Dataset Type: Single-table analytical dataset

🧠 SQL Concepts Covered

This project covers most of the core MySQL querying concepts, including:

SELECT, WHERE, ORDER BY, LIMIT, OFFSET

Aggregate functions: COUNT, SUM, AVG, MAX, MIN

GROUP BY and HAVING

Scalar Subqueries

Correlated Subqueries

Pattern matching using LIKE

Handling columns with spaces using backticks

Avoiding hard-coded values for scalable queries

📊 Business Questions Solved

The following business and analytical questions were answered using SQL:

1.Total number of movies in the dataset

2.Top 10 highest-rated movies

3.Movies released after 2015 with IMDb rating > 8

4.Number of movies released each year

5.Movies belonging to the Drama genre

6.Movies sorted by latest release year

7.Average IMDb rating of all movies

8.Director with the highest number of movies

9.Highest and lowest grossing movies

10.Number of movies per genre

11.Year with the maximum number of movie releases

12.Movies whose title contains the word “Love”

13.Directors whose names start with the letter S

14.Movies belonging to more than one genre

15.Movies released in the same year as the highest-rated movie

16.Movies with descriptions longer than 200 characters

17.Movies with ratings above the overall average rating

18.Directors whose movies have an average rating above 7.5

19.Second highest-rated movie

20.Movies rated below their genre’s average rating

21.Year with the highest number of movie releases

22.Top directors based on average IMDb rating (minimum 5 movies)

23.Top 5 genres by average IMDb rating

24.Movie(s) with the highest revenue

25.Average IMDb rating for each genre

26.Top 3 genres by total revenue

27.Director whose movies generated the highest total revenue
