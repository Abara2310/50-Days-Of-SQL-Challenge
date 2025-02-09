# Write your MySQL query statement below
SELECT e1.employee_id, e1.name, 
       COUNT(e2.employee_id) AS reports_count
FROM Employees e1
LEFT JOIN Employees e2 
ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id, e1.name;
