SELECT t.tweet_id, t.body, count(c.comment_id) comments_count
FROM tweets t
INNER JOIN comments c
 ON c.tweet_id = t.tweet_id
GROUP BY c.tweet_id;
