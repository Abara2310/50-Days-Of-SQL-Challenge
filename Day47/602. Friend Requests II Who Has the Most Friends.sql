# Write your MySQL query statement below
WITH FriendCounts AS (
    SELECT requester_id AS person_id, COUNT(DISTINCT accepter_id) AS num_friends
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id AS person_id, COUNT(DISTINCT requester_id) AS num_friends
    FROM RequestAccepted
    GROUP BY accepter_id
),
AggregatedFriends AS (

    SELECT person_id, SUM(num_friends) AS total_friends
    FROM FriendCounts
    GROUP BY person_id
)
SELECT person_id AS id, total_friends AS num
FROM AggregatedFriends
WHERE total_friends = (SELECT MAX(total_friends) FROM AggregatedFriends);
