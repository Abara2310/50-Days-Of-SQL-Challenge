SELECT W1.id 
FROM Weather W1
JOIN Weather W2
ON DATEDIFF(W1.recordDate,W2.recordDate) = 1
WHERE w1.temperature > w2.temperature;