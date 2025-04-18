

1) Fetch all data from imdb table 
2) Fetch only the name and release year for all movies.
3) Fetch the name, release year and imdb rating of movies which are UA certified.
4) Fetch the name and genre of movies which are UA certified and have a Imdb rating of over 8.
5) Find out how many movies are of Drama genre.
6) How many movies are directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and "Rajkumar Hirani".
7) What is the highest imdb rating given so far?
8) What is the highest and lowest imdb rating given so far?
8a) Solve the above problem but display the results in different rows.
8b) Solve the above problem but display the results in different rows. And have a column which indicates the value as lowest and highest.
9) Find out the total business done by movies staring "Aamir Khan".
10) Find out the average imdb rating of movies which are neither directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and are not acted by any of these stars "Christian Bale", "Liam Neeson", "Heath Ledger", "Leonardo DiCaprio", "Anne Hathaway".

11) Mention the movies involving both "Steven Spielberg" and "Tom Cruise".
12) Display the movie name and watch time (in both mins and hours) which have over 9 imdb rating.
13) What is the average imdb rating of movies which are released in the last 10 years and have less than 2 hrs of runtime.
14) Identify the Batman movie which is not directed by "Christopher Nolan".
15) Display all the A and UA certified movies which are either directed by "Steven Spielberg", "Christopher Nolan" or which are directed by other directors but have a rating of over 8.
16) What are the different certificates given to movies?
17) Display all the movies acted by Tom Cruise in the order of their release. Consider only movies which have a meta score.
18) Segregate all the Drama and Comedy movies released in the last 10 years as per their runtime. Movies shorter than 1 hour should be termed as short film. Movies longer than 2 hrs should be termed as longer movies. All others can be termed as Good watch time.
19) Write a query to display the "Christian Bale" movies which released in odd year and even year. Sort the data as per Odd year at the top.
20) Re-write problem #18 without using case statement.









1) Fetch all data from imdb table 

SELECT
	*
FROM
	IMDB_TOP_MOVIES;

	
2) Fetch only the name and release year for all movies.

SELECT
	SERIES_TITLE,
	RELEASED_YEAR
FROM
	IMDB_TOP_MOVIES;
 

3) Fetch the name, release year and imdb rating of movies which are UA certified.

SELECT
	SERIES_TITLE,
	RELEASED_YEAR,
	IMDB_RATING
FROM
	IMDB_TOP_MOVIES
WHERE
	CERTIFICATE = 'UA';


4) Fetch the name and genre of movies which are UA certified and have a Imdb rating of over 8.

SELECT
	SERIES_TITLE,
	GENRE,
	IMDB_RATING
FROM
	IMDB_TOP_MOVIES
WHERE
	CERTIFICATE = 'UA'
	AND IMDB_RATING > 8;


5) Find out how many movies are of Drama genre.


SELECT
	COUNT(*)
FROM
	IMDB_TOP_MOVIES
WHERE
	GENRE LIKE '%Drama%' -- 724

6) How many movies are directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and "Rajkumar Hirani".

SELECT
	COUNT(1)
FROM
	IMDB_TOP_MOVIES
WHERE
	DIRECTOR IN (
		'Quentin Tarantino',
		'Steven Spielberg',
		'Christopher Nolan',
		'Rajkumar Hirani'
	)


7) What is the highest imdb rating given so far?

SELECT
	MAX(IMDB_RATING) AS MAX_RATING
FROM
	IMDB_TOP_MOVIES MOVIES

8) What is the highest and lowest imdb rating given so far?

select max(imdb_rating) as highest_rating,  min(imdb_rating) as lowest_rating
from imdb_top_movies




8a) Solve the above problem but display the results in different rows.


SELECT
	MAX(IMDB_RATING) AS HIGHEST_RATING
FROM
	IMDB_TOP_MOVIES
UNION
SELECT
	MIN(IMDB_RATING) AS LOWEST_RATING
FROM
	IMDB_TOP_MOVIES


8b) Solve the above problem but display the results in different rows. And have a column which indicates the value as lowest and highest.


SELECT
	MAX(IMDB_RATING) AS MOVIE_RATING,
	'Highest rating' AS HIGH_LOW
FROM
	IMDB_TOP_MOVIES
UNION
SELECT
	MIN(IMDB_RATING),
	'Lowest rating' AS HIGH_LOW
FROM
	IMDB_TOP_MOVIES


9) Find out the total business done by movies staring "Aamir Khan".

select sum(gross)
from imdb_top_movies
where star1 = 'Aamir Khan'
or star2 = 'Aamir Khan'
or star3 = 'Aamir Khan'
or star4 = 'Aamir Khan';

OR

SELECT
	SUM(GROSS)
FROM
	IMDB_TOP_MOVIES
WHERE
	'Aamir Khan' IN (STAR1, STAR2, STAR3, STAR4);

10) Find out the average imdb rating of movies which are neither directed 
	by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" 
	and are not acted by any of these stars "Christian Bale", "Liam Neeson"
		, "Heath Ledger", "Leonardo DiCaprio", "Anne Hathaway".


SELECT
	AVG(IMDB_RATING) AS AVG_RATING
FROM
	IMDB_TOP_MOVIES
WHERE
	DIRECTOR NOT IN (
		'Quentin Tarantino',
		'Steven Spielberg',
		'Christopher Nolan'
	)
	AND (
		STAR1 NOT IN (
			'Christian Bale',
			'Liam Neeson',
			'Heath Ledger',
			'Leonardo DiCaprio',
			'Anne Hathaway'
		)
		AND STAR2 NOT IN (
			'Christian Bale',
			'Liam Neeson',
			'Heath Ledger',
			'Leonardo DiCaprio',
			'Anne Hathaway'
		)
		AND STAR3 NOT IN (
			'Christian Bale',
			'Liam Neeson',
			'Heath Ledger',
			'Leonardo DiCaprio',
			'Anne Hathaway'
		)
		AND STAR4 NOT IN (
			'Christian Bale',
			'Liam Neeson',
			'Heath Ledger',
			'Leonardo DiCaprio',
			'Anne Hathaway'
		)
	);


11) Mention the movies involving both "Steven Spielberg" and "Tom Cruise".


SELECT
	*
FROM
	IMDB_TOP_MOVIES
WHERE
	DIRECTOR = 'Steven Spielberg'
	AND (
		STAR1 = 'Tom Cruise'
		OR STAR2 = 'Tom Cruise'
		OR STAR3 = 'Tom Cruise'
		OR STAR4 = 'Tom Cruise'
	);


12) Display the movie name and watch time (in both mins and hours) which have over 9 imdb rating.

SELECT
	SERIES_TITLE,
	RUNTIME AS RUNTIME_MINS,
	CAST(REPLACE(RUNTIME, ' min', '') AS DECIMAL) / 60 AS RUNTIME_HRS,
	ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) AS RUNTIME_HRS
FROM
	IMDB_TOP_MOVIES
WHERE
	IMDB_RATING > 9;

13) What is the average imdb rating of movies which are released in the last 10 years and have less than 2 hrs of runtime.

SELECT
	ROUND(AVG(IMDB_RATING), 2) AS AVG_RATING
FROM
	IMDB_TOP_MOVIES
WHERE
	RELEASED_YEAR <> 'PG'
	AND EXTRACT(
		YEAR
		FROM
			CURRENT_DATE
	) - RELEASED_YEAR::INT <= 10
	AND ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) < 2;


14) Identify the Batman movie which is not directed by "Christopher Nolan".

SELECT
	*
FROM
	IMDB_TOP_MOVIES
WHERE
	UPPER(SERIES_TITLE) LIKE '%BATMAN%'
	AND DIRECTOR <> 'Christopher Nolan';


15) Display all the A and UA certified movies which are either directed by "Steven Spielberg", "Christopher Nolan" or which are directed by other directors but have a rating of over 8.


SELECT
	*
FROM
	IMDB_TOP_MOVIES
WHERE
	CERTIFICATE IN ('A', 'UA')
	AND (
		DIRECTOR IN ('Steven Spielberg', 'Christopher Nolan')
		OR (
			DIRECTOR NOT IN ('Steven Spielberg', 'Christopher Nolan')
			AND IMDB_RATING > 8
		)
	);



16) What are the different certificates given to movies?

SELECT DISTINCT
	CERTIFICATE
FROM
	IMDB_TOP_MOVIES
ORDER BY	1;

OR

SELECT DISTINCT
	CERTIFICATE
FROM
	IMDB_TOP_MOVIES
ORDER BY
	CERTIFICATE;

17) Display all the movies acted by Tom Cruise in the order of their release. Consider only movies which have a meta score.

SELECT
	*
FROM
	IMDB_TOP_MOVIES
WHERE
	META_SCORE IS NOT NULL
	AND (
		STAR1 = 'Tom Cruise'
		OR STAR2 = 'Tom Cruise'
		OR STAR3 = 'Tom Cruise'
		OR STAR4 = 'Tom Cruise'
	)
ORDER BY
	RELEASED_YEAR;


18) Segregate all the Drama and Comedy movies released in the last 10 years as per their runtime. 
	Movies shorter than 1 hour should be termed as short film. 
	Movies longer than 2 hrs should be termed as longer movies. 
	All others can be termed as Good watch time.

select * from imdb_top_movies  where released_year = 'PG'

SELECT
	SERIES_TITLE AS MOVIE_NAME,
	CASE
		WHEN ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) < 1 THEN 'Short film'
		WHEN ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) > 2 THEN 'Longer Movies'
		ELSE 'Good watch time'
	END AS CATEGORY
FROM
	IMDB_TOP_MOVIES
WHERE
	RELEASED_YEAR <> 'PG'
	AND EXTRACT(
		YEAR
		FROM
			CURRENT_DATE
	) - RELEASED_YEAR::INT <= 10
	AND (
		UPPER(GENRE) LIKE '%DRAMA%'
		OR LOWER(GENRE) LIKE '%comedy%'
	) ORDER BY
	CATEGORY;

19) Write a query to display the "Christian Bale" movies which released in odd year and even year. Sort the data as per Odd year at the top.

SELECT
	SERIES_TITLE AS MOVIE_NAME,
	RELEASED_YEAR,
	CASE
		WHEN RELEASED_YEAR::INT % 2 = 0 THEN 'Even year'
		ELSE 'Odd year'
	END AS ODD_OR_EVEN
FROM
	IMDB_TOP_MOVIES
WHERE
	RELEASED_YEAR <> 'PG'
	AND (
		STAR1 = 'Christian Bale'
		OR STAR2 = 'Christian Bale'
		OR STAR3 = 'Christian Bale'
		OR STAR4 = 'Christian Bale'
	)
ORDER BY
	ODD_OR_EVEN DESC;

20) Re-write problem #18 without using case statement.

SELECT
	SERIES_TITLE AS MOVIE_NAME,
	'Short film' AS CATEGORY,
	ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) AS RUNTIME
FROM
	IMDB_TOP_MOVIES
WHERE
	RELEASED_YEAR <> 'PG'
	AND EXTRACT(
		YEAR
		FROM
			CURRENT_DATE
	) - RELEASED_YEAR::INT <= 10
	AND (
		UPPER(GENRE) LIKE '%DRAMA%'
		OR LOWER(GENRE) LIKE '%comedy%'
	)
	AND ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) < 1
UNION ALL
SELECT
	SERIES_TITLE AS MOVIE_NAME,
	'Longer Movies' AS CATEGORY,
	ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) AS RUNTIME
FROM
	IMDB_TOP_MOVIES
WHERE
	RELEASED_YEAR <> 'PG'
	AND EXTRACT(
		YEAR
		FROM
			CURRENT_DATE
	) - RELEASED_YEAR::INT <= 10
	AND (
		UPPER(GENRE) LIKE '%DRAMA%'
		OR LOWER(GENRE) LIKE '%comedy%'
	)
	AND ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) > 2
UNION ALL
SELECT
	SERIES_TITLE AS MOVIE_NAME,
	'Good watch time' AS CATEGORY,
	ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) AS RUNTIME
FROM
	IMDB_TOP_MOVIES
WHERE
	RELEASED_YEAR <> 'PG'
	AND EXTRACT(
		YEAR
		FROM
			CURRENT_DATE
	) - RELEASED_YEAR::INT <= 10
	AND (
		UPPER(GENRE) LIKE '%DRAMA%'
		OR LOWER(GENRE) LIKE '%comedy%'
	)
	AND ROUND(REPLACE(RUNTIME, ' min', '')::DECIMAL / 60, 2) BETWEEN 1 AND 2
ORDER BY
	CATEGORY;

