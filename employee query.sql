SELECT
    E.emp_name
FROM
    employee_table_data AS E
JOIN
    service_employee_table_data AS SE ON E.employee_id = SE.employee_id
JOIN
    service_table_data AS S ON SE.service_id = S.service_id
WHERE
    -- 1. Only consider previous services for the specific car
    S.registration = 'ABC 123X'
    -- 2. Exclude the new service itself if it was already added to S (highly recommended)
    AND S.dropoff_date < '2025-12-20'
GROUP BY
    E.employee_id, E.emp_name
HAVING
    -- 3. Count the number of jobs the mechanic has on the new drop-off date
    -- and ensure that count is exactly 0.
    (
        SELECT
            COUNT(SE2.service_id)
        FROM
            service_employee_table_data AS SE2
        JOIN
            service_table_data AS S2 ON SE2.service_id = S2.service_id
        WHERE
            SE2.employee_id = E.employee_id
            AND S2.dropoff_date = '2025-12-20' -- The drop-off date of the new service
    ) = 0;