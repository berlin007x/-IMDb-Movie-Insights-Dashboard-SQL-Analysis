# IMDb-Movie-Insights-Dashboard-SQL-Analysis
 Repository Description This project involves deep analysis of the Top 1000 IMDb Movies and TV Shows using SQL and Tableau. The dataset was explored using PostgreSQL (via pgAdmin), various KPIs were extracted, and a dynamic dashboard was created using Tableau to uncover interesting insights related to ratings, genres, directors, and actors.

## Dataset
This project uses the publicly available IMDb Top 1000 dataset from Kaggle, which includes:
- <a href="https://www.kaggle.com/datasets/harshitshankhdhar/imdb-dataset-of-top-1000-movies-and-tv-shows">IMDB Movies Dataset</a>

 

#### Tools & Technologies
PostgreSQL (via pgAdmin) for data querying and analysis

Tableau for data visualization & dashboard building

Kaggle for dataset

GitHub for version control andaring

## Dashboard KPIs : - 
The Tableau dashboard sum shmarizes multiple KPIs extracted from the dataset:

#### Top Grossing Genre :- Which movie genre generated the highest gross revenue overall?
#### Most Frequent Director :- Which director has directed the most movies in the Top 1000 IMDb list?
#### Top Rated Actor :- Which actor/actress has the highest average IMDb rating across their movies?
#### Certification Breakdown :- How are movies categorized based on certification (A, UA, U, etc.)?

#### Dashboard Preview: - <a href="https://github.com/berlin007x/-IMDb-Movie-Insights-Dashboard-SQL-Analysis/blob/main/Dashboard/imdb_analysis_dashboard.PNG"> Dashboard Preview:</a>


## SQL Analysis Topics
Some of the key questions answered using SQL:

Count of Drama movies

Movies directed by Spielberg, Nolan, Rajkumar Hirani, Tarantino

Highest & Lowest IMDb ratings

Total gross from Aamir Khan’s movies

Genre-wise movie duration categorization

Finding non-numeric anomalies in release year

Batman movie not directed by Nolan

Even/Odd year movie release pattern for Christian Bale

📄 All SQL queries are available here:
📁 sql_queries/imdb_analysis_queries.sql

📌 Conclusion
Drama emerged as the most dominant genre in the dataset.

Christopher Nolan and Steven Spielberg are among the most frequently featured directors.

Certifications are majorly concentrated around UA and U.

Tableau visualizations helped in easily communicating multi-dimensional insights through interactive charts.
