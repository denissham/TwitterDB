SELECT u.user_id, u.username, count(f.followed_by_id) followers_count
FROM users u
LEFT JOIN followers f
  ON  u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY followers_count DESC;