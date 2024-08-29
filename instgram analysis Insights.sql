# Loya users Rewards

SELECT *FROM USERS 
order by CREATED_AT
LIMIT 5;


# Inactive User Engagement
SELECT USERNAME
FROM users
LEFT JOIN PHOTOS
ON users.ID=PHOTOS.USER_ID
WHERE PHOTOS.ID IS NULL
limit 10;

# Contest Winner Declaration

select 
username,photos.id,photos.image_url,count(likes.user_id) as total
from photos
inner join likes 
on likes.photos_id=photos.id
inner join users 
on photos.user_id= users_id
group by photo_id
order by total desc
limit 1;

# # Hashtag Research 

SELECT 
tags.tag_name,
count(*) as total
from photo_tags
join tags
on photo_tags.tag_id= tags.id
group by tags.id
order by total desc
limit 5;

# Ad Campaign Launch

select 
dayname(created_at) as day,count(*) as total
from users
group by day
order by total desc
limit 1;

# Investor Metrics
# User Engagements 

select
(select count(*) from photos) /(select count(*) from users) as  avg;

# Bots & Fake Accounts

select 
user_id,count(*) as num_likes
from likes
group by user_id
having num_likes=(select count(*) from photos);
select u.username,count(*) as num_likes
from users u
join likes l on u.id=l.user_id
group by u.id
having num_likes=(select count(*) from photos);



