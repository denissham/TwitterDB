SELECT comment_id,body, create_time 
FROM twitterDB.comments
WHERE create_time BETWEEN SUBDATE(NOW(), INTERVAL 11 HOUR)  AND  NOW();