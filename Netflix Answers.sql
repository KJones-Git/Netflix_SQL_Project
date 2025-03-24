-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows

SELECT
	type, 
	COUNT(*) as total_content
FROM netflix
GROUP BY type

-- 2. Find the most common rating for movies and TV shows

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

-- 3. List all movies released in a specific year (e.g., 2020)

SELECT * 
FROM netflix
WHERE 
	type = 'Movie'
	AND release_year = 2020
	

-- 4. Find the top 5 countries with the most content on Netflix

SELECT 
	UNNEST(STRING_TO_ARRAY(country, ',')) as all_countries,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- 5. Identify the longest movie

SELECT *
FROM netflix
WHERE 
	type = 'Movie'
	AND duration = (SELECT MAX(duration) FROM netflix)
	
-- 6. Find content added in the last 5 years

SELECT *
FROM netflix
WHERE date_added IS NOT NULL
  AND date_added >= CURRENT_DATE - INTERVAL '5 years'
;

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT *
FROM netflix
WHERE
	director LIKE '%Rajiv Chilaka%'

-- 8. List all TV shows with more than 5 seasons

SELECT *
FROM netflix
WHERE
	type = 'TV Show'
	AND 
	SPLIT_PART(duration, ' ', 1)::numeric > 5

-- 9. Count the number of content items in each genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genres,
	COUNT(show_id) as total_genre
FROM netflix
GROUP BY 1

-- 10.Find each year and the average numbers of content release in India on netflix. 
-- return top 5 year with highest avg content release!

SELECT release_year, COUNT(*) AS annual_content
FROM netflix
WHERE country = 'India'
GROUP BY release_year
ORDER BY annual_content DESC
LIMIT 5;

-- 11. List all movies that are documentaries

SELECT *
FROM netflix
WHERE 
	type = 'Movie'
	AND listed_in LIKE '%Documentaries%'

-- 12. Find all content without a director

SELECT *
FROM netflix
WHERE director is NULL

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT *
FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

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

-- 15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.

SELECT 
  CASE 
    WHEN description ILIKE '%kill%' 
	OR description ILIKE '%violence%' THEN 'Bad'
    ELSE 'Good'
  END AS content_label,
  COUNT(*) AS total
FROM netflix
GROUP BY content_label;
