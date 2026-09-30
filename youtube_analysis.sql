-- YouTube Trending Video Analytics
CREATE TABLE youtube_trending (
 video_id VARCHAR(20) PRIMARY KEY, publish_date DATE, region VARCHAR(10),
 category VARCHAR(60), title VARCHAR(255), views BIGINT, likes BIGINT,
 comments BIGINT, trending_days INT, sentiment_score DECIMAL(6,3),
 engagement_rate DECIMAL(8,3)
);

-- Category ranking by average views
SELECT category, COUNT(*) AS videos,
       ROUND(AVG(views),2) AS avg_views,
       ROUND(AVG(engagement_rate),3) AS avg_engagement
FROM youtube_trending
GROUP BY category
ORDER BY avg_views DESC;

-- Region comparison
SELECT region, COUNT(*) AS videos,
       ROUND(AVG(views),2) AS avg_views,
       ROUND(AVG(sentiment_score),3) AS avg_sentiment
FROM youtube_trending
GROUP BY region
ORDER BY avg_views DESC;

-- Most viewed videos
SELECT video_id,title,category,region,views
FROM youtube_trending
ORDER BY views DESC
LIMIT 10;

-- Trending duration by category
SELECT category, ROUND(AVG(trending_days),2) AS avg_trending_days
FROM youtube_trending
GROUP BY category
ORDER BY avg_trending_days DESC;

-- Monthly trend
SELECT EXTRACT(YEAR FROM publish_date) AS year,
       EXTRACT(MONTH FROM publish_date) AS month,
       COUNT(*) AS videos, ROUND(AVG(views),2) AS avg_views
FROM youtube_trending
GROUP BY EXTRACT(YEAR FROM publish_date),EXTRACT(MONTH FROM publish_date)
ORDER BY year,month;

-- Sentiment by category
SELECT category, ROUND(AVG(sentiment_score),3) AS avg_sentiment
FROM youtube_trending
GROUP BY category
ORDER BY avg_sentiment DESC;
