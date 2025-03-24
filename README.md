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
   → A simple aggregation to compare the volume of each content type.

2. **Find the most common rating for Movies and TV Shows**  
   → Returns the top rating category for each type, excluding count.

3. **List all Movies released in a specific year (e.g., 2020)**  
   → Useful for content strategy and trend tracking.

4. **Find the top 5 countries with the most content on Netflix**  
   → Reveals Netflix’s production or licensing focus.

5. **Identify the longest movie**  
   → Filters and orders movies by duration.

6. **Find content added in the last 5 years**  
   → Tracks recent additions to the platform using `date_added`.

7. **Find all Movies/TV Shows by director 'Rajiv Chilaka'**  
   → Searches the `director` field for exact matches.

8. **List all TV Shows with more than 5 seasons**  
   → Extracts and filters numeric season data from the `duration` field.

9. **Count the number of content items in each genre**  
   → Explodes multi-genre fields and groups by individual genre tags.

10. **Find the top 5 years with the highest average content release in India**  
    → Focuses on content produced in India, grouped by `release_year`.

11. **List all Movies that are Documentaries**  
    → Filters on both `type` and genre (`listed_in` field).

12. **Find all content without a director**  
    → Helps identify missing metadata.

13. **Find how many movies actor 'Salman Khan' appeared in during the last 10 years**  
    → Filters based on `casts`, `release_year`, and `type`.

14. **Find the top 10 actors who have appeared in the highest number of movies produced in India**  
    → Splits cast arrays and counts individual actor appearances.

15. **Categorize content as 'Good' or 'Bad' based on descriptions**  
    → Flags content containing keywords like `'kill'` or `'violence'`.

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
