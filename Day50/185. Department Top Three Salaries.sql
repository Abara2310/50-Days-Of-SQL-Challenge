WITH SalaryRank AS (
    SELECT 
        e.id, 
        e.name, 
        e.salary, 
        e.departmentId,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
)
SELECT 
    d.name AS Department, 
    s.name AS Employee, 
    s.salary
FROM SalaryRank s
JOIN Department d ON s.departmentId = d.id
WHERE s.salary_rank <= 3
ORDER BY d.name, s.salary DESC;
