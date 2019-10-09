SELECT DISTINCT q.user_id,  --Select all unique users in joined database
   h.user_id IS NOT NULL AS 'is_home_try_on',   --Select all users that tried tha pairs on at home
   h.number_of_pairs,      -- and the number of pairs
   p.user_id IS NOT NULL AS 'is_purchase'   --did they purchase them?
FROM quiz q
LEFT JOIN home_try_on h -- Join the 'quiz', 'home_try_on', and 'purchase' databases 
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
LIMIT 10;
