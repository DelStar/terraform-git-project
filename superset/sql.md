SQL Queries
i)
SELECT number, COUNT(*) as frequency
FROM (
    SELECT CAST(numbers AS INTEGER) as number
    FROM your_table_name
    CROSS JOIN UNNEST(split(winning_numbers, ' ')) AS t (numbers)
) AS numbers_table
GROUP BY number
ORDER BY frequency DESC
LIMIT 5;

ii)
SELECT AVG(multiplier) as average_multiplier
FROM your_table_name;

iii)
SELECT mega_ball, COUNT(*) as frequency
FROM your_table_name
GROUP BY mega_ball
ORDER BY frequency DESC
LIMIT 5;

iv)
SELECT 
    SUM(CASE WHEN date_format(parse_date('MM/dd/yyyy', draw_date), '%u') < 6 THEN 1 ELSE 0 END) as weekday_draws,
    SUM(CASE WHEN date_format(parse_date('MM/dd/yyyy', draw_date), '%u') >= 6 THEN 1 ELSE 0 END) as weekend_draws
FROM your_table_name;


