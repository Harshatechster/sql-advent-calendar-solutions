-- SQL Advent Calendar - Day 15
-- Title: The Grinch's Mischief Tracker
-- Difficulty: hard
--
-- Question:
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--

-- Table Schema:
-- Table: grinch_mischief_log
--   log_date: DATE
--   mischief_score: INTEGER
--

-- My Solution:

WITH daily_score AS (
  SELECT log_date,
  SUM (mischief_score) AS daily_mischief_score
FROM grinch_mischief_log
GROUP BY log_date )
SELECT
  daily_mischief_score, 
  daily_mischief_score - LAG(daily_mischief_score ) OVER( ORDER BY log_date) AS daily_changes
FROM daily_score
ORDER BY log_date
