SELECT
    E.emp_name,
    SUM(SE.time_spent) AS total_time_spent
FROM
    employee_table_data AS E
JOIN
    service_employee_table_data AS SE ON E.employee_id = SE.employee_id
JOIN
    service_table_data AS S ON SE.service_id = S.service_id
WHERE
    -- Combine date and time for a full timestamp comparison
    STR_TO_DATE(CONCAT(S.dropoff_date, ' ', S.dropoff_time), '%Y-%m-%d %H:%i:%s')
    BETWEEN 
        '2025-12-19 12:00:00' -- Start of 24hr period (YYYY-MM-DD HH:MM:SS)
    AND 
        '2025-12-20 12:00:00' -- End of 24hr period (YYYY-MM-DD HH:MM:SS)
GROUP BY
    E.employee_id, E.emp_name
ORDER BY
    total_time_spent DESC;