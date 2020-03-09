SELECT tweet_id, count(comment_id) comments_count
FROM twitterDB.comments
GROUP BY tweet_id;