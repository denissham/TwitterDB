SELECT u.user_id, u.username, COUNT(f.followed_by_id) followers_number
FROM twitterDB.users u
 JOIN twitterDB.followers f
  ON f.user_id = u.user_id
GROUP BY f.user_id
HAVING followers_number >=1;