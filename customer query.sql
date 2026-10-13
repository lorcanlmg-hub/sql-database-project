SELECT
    C.cust_name,
    C.cust_email,
    CA.make,
    CA.registration,
    S.next_service
FROM
    customer_table_data AS C
JOIN
    car_table_data AS CA ON C.customer_id = CA.customer_id
JOIN
    service_table_data AS S ON CA.registration = S.registration
WHERE
    S.next_service IS NOT NULL -- Only include cars with a defined next service date
    AND S.next_service BETWEEN '2026-01-01' AND '2026-03-31'
GROUP BY
    C.customer_id, C.cust_name, C.cust_email, CA.registration, CA.make, S.next_service
ORDER BY
    S.next_service ASC;