-- distinct pairs from both tables, division, round
-- answer shouldn't be null, so used ifnull
-- can also do IFNULL INSIDE ROUND- more popular

select ifnull(
       round(
        (select count(distinct requester_id, accepter_id)
        from RequestAccepted) 
        / 
        (select count(distinct sender_id, send_to_id)
        from FriendRequest)
        , 2)
        , 0) as accept_rate

-- facebook- 2
