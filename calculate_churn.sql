SELECT 1.0 * 
(
  SELECT COUNT(*)   --calculate number of customers that cancelled their subscription in January 2017
  FROM subscriptions
  WHERE subscription_start < '2017-01-01'  --ensure the customer had the subscription before January 2017
  AND (
    subscription_end     --obtain customers who ended their subscriptions between January 1st and January 31st
    BETWEEN '2017-01-01'
    AND '2017-01-31'
  )
) / (
  SELECT COUNT(*)    --divide by the total number of customers who have a subscription in January 2017
  FROM subscriptions 
  WHERE subscription_start < '2017-01-01' --ensure the customer had the subscription before January 2017
  AND (
    (subscription_end >= '2017-01-01')
    OR (subscription_end IS NULL)   --get customers who ended their subsciption after January 1st OR they still have the subscription
  )
) 
AS result;
