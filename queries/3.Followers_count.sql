SELECT user_id, count(followed_by_id) followers_count
FROM twitterDB.followers
GROUP BY user_id
ORDER BY followers_count DESC;