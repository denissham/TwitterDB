SELECT ROUND(AVG(DATEDIFF(CURDATE(), birthday)/365.25)) avg_user_age
FROM twitterDB.users;