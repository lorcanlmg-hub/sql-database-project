INSERT INTO service_table_data (
    service_id, 
    registration, 
    dropoff_date, 
    dropoff_time, 
    work_required, 
    milage, 
    next_service
)
VALUES (
    '<New Service ID>',  -- You must ensure this is unique
    '<Car Registration>',
    '<YYYY-MM-DD>',      -- e.g., '2025-12-20'
    '<HH:MM:SS>',        -- e.g., '10:00:00'
    '<Description of Work>',
    '100',      -- e.g., 55000 (no quotes)
    NULL                 -- next_service can be set to NULL initially
);