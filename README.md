# 📊 Netflix Data Analysis with PostgreSQL

![](https://github.com/KJones-Git/Netflix_SQL_Project/blob/e82c75f04e6e11ee672200fedcefe5df6f6d97a6/netflix%20logo.png)

This project explores a real-world Netflix dataset using **PostgreSQL**, tackling 15 business-oriented questions. The goal is to uncover valuable insights from Netflix's catalog, such as user preferences, content trends, and production patterns across genres, years, countries, and more.

---

## 🗂 Dataset Overview

The dataset contains detailed metadata about Netflix titles, including:

- Type (Movie or TV Show)
- Title, Director, Cast
- Country of production
- Date added to Netflix
- Release year
- Rating, Duration
- Genres (listed_in)
- Description

---

## ✅ 15 Business Problems & SQL Solutions

Each of the following problems is solved using efficient and optimized PostgreSQL queries:

1. **Count the number of Movies vs TV Shows**  
```sql
SELECT
	type, 
	COUNT(*) as total_content
FROM netflix
GROUP BY type

```

2. **Find the most common rating for Movies and TV Shows**  
```sql
SELECT type, rating
FROM netflix
WHERE type IN ('Movie', 'TV Show')
GROUP BY type, rating
HAVING COUNT(*) = (
    SELECT MAX(count) 
    FROM (
        SELECT type, rating, COUNT(*) AS count
        FROM netflix
        WHERE type IN ('Movie', 'TV Show')
        GROUP BY type, rating
    ) AS rating_counts
    WHERE rating_counts.type = netflix.type
);

```

3. **List all Movies released in a specific year (e.g., 2020)**  
```sql
SELECT * 
FROM netflix
WHERE 
	type = 'Movie'
	AND release_year = 2020
```

4. **Find the top 5 countries with the most content on Netflix**  
```sql
SELECT 
	UNNEST(STRING_TO_ARRAY(country, ',')) as all_countries,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
```

5. **Identify the longest movie**  
```sql
SELECT *
FROM netflix
WHERE 
	type = 'Movie'
	AND duration = (SELECT MAX(duration) FROM netflix)
```

6. **Find content added in the last 5 years**  
```sql
SELECT *
FROM netflix
WHERE date_added IS NOT NULL
  AND date_added >= CURRENT_DATE - INTERVAL '5 years'
;
```
7. **Find all Movies/TV Shows by director 'Rajiv Chilaka'**  
```sql
SELECT *
FROM netflix
WHERE
	director LIKE '%Rajiv Chilaka%'
```

8. **List all TV Shows with more than 5 seasons**  
```sql
SELECT *
FROM netflix
WHERE
	type = 'TV Show'
	AND 
	SPLIT_PART(duration, ' ', 1)::numeric > 5

```

9. **Count the number of content items in each genre**  
```sql
SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genres,
	COUNT(show_id) as total_genre
FROM netflix
GROUP BY 1
```

10. **Find the top 5 years with the highest average content release in India**  
```sql
SELECT release_year, COUNT(*) AS annual_content
FROM netflix
WHERE country = 'India'
GROUP BY release_year
ORDER BY annual_content DESC
LIMIT 5;

```

11. **List all Movies that are Documentaries**  
```sql
SELECT *
FROM netflix
WHERE 
	type = 'Movie'
	AND listed_in LIKE '%Documentaries%'
```

12. **Find all content without a director**  
```sql
SELECT *
FROM netflix
WHERE director is NULL
```

13. **Find how many movies actor 'Salman Khan' appeared in during the last 10 years**  
```sql
SELECT *
FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

```

14. **Find the top 10 actors who have appeared in the highest number of movies produced in India**  
```sql
SELECT actor, COUNT(*) AS movie_count
FROM (
    SELECT unnest(string_to_array(casts, ', ')) AS actor
    FROM netflix
    WHERE type = 'Movie'
      AND country ILIKE '%India%'
      AND casts IS NOT NULL
) AS actor_list
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 10;
```

15. **Categorize content as 'Good' or 'Bad' based on descriptions**  
```sql
SELECT 
  CASE 
    WHEN description ILIKE '%kill%' 
	OR description ILIKE '%violence%' THEN 'Bad'
    ELSE 'Good'
  END AS content_label,
  COUNT(*) AS total
FROM netflix
GROUP BY content_label;
```

---

## 🛠 Tech Stack

- **Database:** PostgreSQL
- **Language:** SQL
- **Data Source:** [Netflix Titles Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)

To replicate this analysis:

1. Clone the repository  
   ```bash
   https://github.com/KJones-Git/Netflix_SQL_Project.git
---

### 🖋 Author: Kyle Jones
|Website     |  Handle   | 
|---------|-----------------|
|Github| https://github.com/KJones-Git        |
|Tableau |   https://public.tableau.com/app/profile/kyle.jones8049/vizzes      |
|LinkedIn |  https://www.linkedin.com/in/kylelaurencejones/      |
