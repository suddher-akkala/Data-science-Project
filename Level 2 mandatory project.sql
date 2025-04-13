# Question number 2 :

use ig_clone;
select * from users  order by created_at asc limit 5;

# Question 3:
 select username from users
left join photos on users.id=photos.user_id
where photos.id is null;
   
   # question 4:
   
    SELECT
    users.id AS user_id,
    username,
	photos.id AS photo_id,
    photos.image_url,
    COUNT(*) AS total_likes_count
FROM photos
    JOIN likes
        ON photos.id = likes.photo_id
    JOIN users
        ON users.id = photos.user_id
    GROUP BY photos.id
    ORDER BY total_likes_count DESC
    LIMIT 1;
   

#question 5 :
SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users),2) as user_post_avg;

#question 6 :

with cte 
as
    (select tag_name,photo_id from tags left join photo_tags on tags.id = photo_tags.tag_id
      ) select count(tag_name) as n_tag, tag_name from cte group by tag_name order by 
         count(tag_name) desc limit 1;
         
 # question 7 :
 
 SELECT users.id,username, COUNT(users.id) As total_likes_user
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes_user = (SELECT COUNT(*) FROM photos);

 #question 8 :
 
  select * from users where month(created_at) =05 order by created_at desc limit 5; 
    
  # question 9 :
  
     with table1
  as 
  (  select username from users inner join photos on 
	 users.id=photos.user_id where photos.id is not null order by username
     )
    , table2 
     as 
      (  select username from table1 join likes order by username 
        )
	   , table3
       as
         ( select * from table2 where username regexp '^c' and username regexp '[0-9]$' 
            ) select distinct(username) from table3;
     
# question 10:
       
with c_username      
 as
     (select distinct(username),count(photos.id) from users join photos on users.id = photos.user_id 
      group by username having count(photos.id) >=3 and  count(photos.id)<= 5  order by username 
	) select * from c_username limit 30;  
         
         
