SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;
...............
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil'

SELECT id,
      account_id,
      standard_amt_usd,
      standard_qty,
      standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

SELECT id, account_id,
  poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;


SELECT *
FROM accounts
WHERE name LIKE 'C%';

SELECT *
FROM accounts
WHERE name LIKE '%one%';

SELECT *
FROM accounts
WHERE name LIKE 's%';

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart','Target','Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart','Target','Nordstrom');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

SELECT *
FROM accounts
WHERE name  NOT LIKE 'C%';

SELECT *
FROM accounts
WHERE name NOT LIKE '%one%';

SELECT *
FROM accounts
WHERE name NOT LIKE '%s';

SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

SELECT *
FROM accounts
WHERE name  NOT LIKE 'C%' AND name LIKE '%s';

SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') AND primary_poc NOT LIKE '%eana%');

SELECT occurred_at
FROM orders

SELECT *
FROM orders

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT accounts.*, orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

SELECT o.standard_qty, o.gloss_qty, o.poster_qty, a.website, a.primary_poc
FROM accounts a
JOIN orders o
ON a.id = o.account_id;

SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

SELECT web_events.channel, accounts.name, orders.total
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

SELECT a.primary_poc, w.channel, w.occurred_at, a.name
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE a.name = 'Walmart';

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name;

SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100;

SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

SELECT DISTINCT a.name, w.channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.id = '1001';

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;

SELECT COUNT(*)
FROM accounts;

SELECT COUNT(accounts.id)
FROM accounts;

SELECT COUNT (*)
FROM orders;

SELECT COUNT (*)
FROM region;

SELECT COUNT (*)
FROM sales_reps;

SELECT COUNT (*)
FROM web_events;

SELECT SUM (poster_qty) AS total_poster_sales
FROM orders;

SELECT SUM (standard_qty) AS total_standard_sales
FROM orders;

SELECT SUM (total_amt_usd) AS total_dollar_sales
FROM orders;

SELECT SUM standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

SELECT SUM (standard_amt_usd/ (standard_qty) AS standard_price_per_unit
FROM orders;






SELECT MIN (occurred_at)
FROM orders;

SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1

SELECT MAX (occurred_at)
FROM web_events;

SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss,
          AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd,
          AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;

SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;

SELECT a.name, SUM(total_amt_usd) total_sales
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

SELECT a.name, o.occurred_at, w.channel
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON w.account_id = a.id
ORDER BY occurred_at DESC
LIMIT 1;

SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel;

SELECT a.primary_poc
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
ORDER BY W.occurred_at
LIMIT 1;

SELECT a.name, o.total_amt_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY o.total_amt_usd
ORDER BY o.total_amt_usd;

SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;

SELECT r.name, COUNT(*) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;

SELECT a.name, AVG (o.standard_qty) AS std_qty, AVG (o.gloss_qty) AS gls_qty, AVG (o.poster_qty) AS pst_qty
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

SELECT a.name, AVG (o.standard_amt_usd) AS avg_std_usd, AVG (o.gloss_amt_usd) AS avg_gls_usd, AVG (o.poster_amt_usd) AS avg_pst_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

SELECT w.channel, s.name, COUNT (s.id) occurrences
FROM web_events w
JOIN sales_reps s
ON w.id = s.id
GROUP BY w.channel, s.name
ORDER BY occurrences DESC;

SELECT w.channel, s.name, COUNT (*) occurrences
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN web_events w
ON w.account_id = a.id
GROUP BY w.channel, s.name
ORDER BY occurrences DESC;

SELECT w.channel, r.name, COUNT (*) occurrences
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN web_events w
ON w.account_id = a.id
GROUP BY w.channel, r.name
ORDER BY occurrences DESC;

SELECT DISTINCT id, name
FROM accounts;

SELECT a.id as "account id", r.id as "region id",
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

SELECT DISTINCT id, name
FROM sales_reps;

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name, a.id
HAVING num_accounts >= 5;

SELECT s.name, s.id, COUNT (*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT (*) >= 5
ORDER BY num_accounts;

SELECT COUNT(*) num_reps_above5
FROM(SELECT s.id, s.name, COUNT(*) num_accounts
    FROM accounts a
    JOIN sales_reps s
    ON s.id = a.sales_rep_id
    GROUP BY s.id, s.name
    HAVING COUNT(*) > 5
    ORDER BY num_accounts) AS Table1;

SELECT a.name, a.id, COUNT (*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
HAVING COUNT (*) >= 20
ORDER BY num_orders;

SELECT a.name, a.id, COUNT (*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
ORDER BY num_orders DESC
LIMIT 1;

SELECT a.name, a.id, COUNT (*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
HAVING COUNT (*) >= 20
ORDER BY num_orders;

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent
LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT (*) num_contact
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
HAVING COUNT (*) > 6
ORDER BY num_contact;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;

SELECT a.id, a.name, w.channel, COUNT (*) num_contact
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY num_contact DESC
LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT (*) num_contact
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY num_contact DESC
LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT (*) num_contact
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
ORDER BY num_contact DESC
LIMIT 10;

SELECT DATE_PART ('year', occurred_at) as year, SUM(total_amt_usd) AS total_sales
FROM orders
GROUP BY DATE_PART ('year', occurred_at)
ORDER BY total_sales DESC;

SELECT DATE_PART('year', occurred_at) ord_year,  SUM(total_amt_usd) total_spent
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_PART ('month', occurred_at) as month, SUM(total_amt_usd) AS total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY DATE_PART ('month', occurred_at)
ORDER BY total_sales DESC;

SELECT DATE_PART ('year', occurred_at) AS year, COUNT (*) AS total_ord
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_PART ('month', occurred_at) AS month, COUNT (*) AS total_ord
FROM orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

SELECT DATE_PART('month', occurred_at) ord_month, COUNT(*) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_PART ('month', occurred_at) AS month, SUM (o.gloss_amt_usd) AS gloss_sales
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC;

-- subqueries

SELECT account_id, CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
                       ELSE standard_amt_usd/standard_qty END AS unit_price
FROM orders
LIMIT 10;

SELECT DATE_TRUNC('day',occurred_at) AS day,
  channel, COUNT(*) as events
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC;

SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
          channel, COUNT(*) as events
    FROM web_events
    GROUP BY 1,2
    ORDER BY 3 DESC) sub;

    SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
            channel, COUNT(*) as events
     FROM web_events
     GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;



SELECT DATE_TRUNC('day', occurred_at), channel, COUNT (*) events_count
FROM web_events
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT *
FROM (SELECT DATE_TRUNC('day', occurred_at), channel, COUNT (*) events_count
FROM web_events
GROUP BY 1, 2
ORDER BY 3 DESC
) sub

SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
               channel, COUNT(*) as events
     FROM web_events
     GROUP BY 1,2
     ORDER BY 3 DESC) sub;


SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
               channel, COUNT(*) as events
     FROM web_events
     GROUP BY 1,2
     ORDER BY 3 DESC) sub
GROUP BY day, channel, events
ORDER BY 2 DESC;

SELECT channel, AVG (events_count) AS avg_event_count
FROM
(SELECT DATE_TRUNC('day', occurred_at), channel, COUNT (*) events_count
FROM web_events
GROUP BY 1, 2) sub
GROUP BY 1
ORDER BY 2 DESC;

SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY 1,2
ORDER BY 3 DESC;

SELECT region_name, MAX(total_amt) total_amt
    FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
            FROM sales_reps s
            JOIN accounts a
            ON a.sales_rep_id = s.id
            JOIN orders o
            ON o.account_id = a.id
            JOIN region r
            ON r.id = s.region_id
            GROUP BY 1, 2) t1
    GROUP BY 1;

    SELECT t3.rep_name, t3.region_name, t3.total_amt
    FROM(SELECT region_name, MAX(total_amt) total_amt
         FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
                 FROM sales_reps s
                 JOIN accounts a
                 ON a.sales_rep_id = s.id
                 JOIN orders o
                 ON o.account_id = a.id
                 JOIN region r
                 ON r.id = s.region_id
                 GROUP BY 1, 2) t1
         GROUP BY 1) t2
    JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
         FROM sales_reps s
         JOIN accounts a
         ON a.sales_rep_id = s.id
         JOIN orders o
         ON o.account_id = a.id
         JOIN region r
         ON r.id = s.region_id
         GROUP BY 1,2
         ORDER BY 3 DESC) t3
    ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;

    SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
    FROM sales_reps s
    JOIN accounts a
    ON a.sales_rep_id = s.id
    JOIN orders o
    ON o.account_id = a.id
    JOIN region r
    ON r.id = s.region_id
    GROUP BY r.name;

    SELECT MAX(total_amt)
FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
            FROM sales_reps s
            JOIN accounts a
            ON a.sales_rep_id = s.id
            JOIN orders o
            ON o.account_id = a.id
            JOIN region r
            ON r.id = s.region_id
            GROUP BY r.name) sub;

            SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
     SELECT MAX(total_amt)
     FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
             FROM sales_reps s
             JOIN accounts a
             ON a.sales_rep_id = s.id
             JOIN orders o
             ON o.account_id = a.id
             JOIN region r
             ON r.id = s.region_id
             GROUP BY r.name) sub);

             SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

SELECT a.name
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
HAVING SUM(o.total) > (SELECT total
                  FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                        FROM accounts a
                        JOIN orders o
                        ON o.account_id = a.id
                        GROUP BY 1
                        ORDER BY 2 DESC
                        LIMIT 1) sub);

                        SELECT COUNT(*)
                        FROM (SELECT a.name
                               FROM orders o
                               JOIN accounts a
                               ON a.id = o.account_id
                               GROUP BY 1
                               HAVING SUM(o.total) > (SELECT total
                                           FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                                                 FROM accounts a
                                                 JOIN orders o
                                                 ON o.account_id = a.id
                                                 GROUP BY 1
                                                 ORDER BY 2 DESC
                                                 LIMIT 1) inner_tab)
                                     ) counter_tab

                                     SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                                     FROM orders o
                                     JOIN accounts a
                                     ON a.id = o.account_id
                                     GROUP BY a.id, a.name
                                     ORDER BY 3 DESC
                                     LIMIT 1;

                                     SELECT a.name, w.channel, COUNT(*)
                                     FROM accounts a
                                     JOIN web_events w
                                     ON a.id = w.account_id AND a.id =  (SELECT id
                                                          FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                                                                FROM orders o
                                                                JOIN accounts a
                                                                ON a.id = o.account_id
                                                                GROUP BY a.id, a.name
                                                                ORDER BY 3 DESC
                                                                LIMIT 1) inner_table)
                                     GROUP BY 1, 2
                                     ORDER BY 3 DESC;

                                     SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                                     FROM orders o
                                     JOIN accounts a
                                     ON a.id = o.account_id
                                     GROUP BY a.id, a.name
                                     ORDER BY 3 DESC
                                     LIMIT 10;


                                     SELECT AVG(tot_spent)
                                     FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                                           FROM orders o
                                           JOIN accounts a
                                           ON a.id = o.account_id
                                           GROUP BY a.id, a.name
                                           ORDER BY 3 DESC
                                            LIMIT 10) temp;


                                            SELECT AVG(o.total_amt_usd) avg_all
                                            FROM orders o

                                            SELECT o.account_id, AVG(o.total_amt_usd)
                                            FROM orders o
                                            GROUP BY 1
                                            HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                                                                           FROM orders o);

SELECT AVG(avg_amt)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
   FROM orders o
   GROUP BY 1
   HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                                  FROM orders o)) temp_table;





SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

SELECT LEFT (name, 1) AS first_letter, COUNT (*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2;

SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                      THEN 1 ELSE 0 END AS num,
        CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                      THEN 0 ELSE 1 END AS letter
     FROM accounts) t1;

SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                     THEN 1 ELSE 0 END AS vowels,
               CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                            THEN 0 ELSE 1 END AS other
              FROM accounts) t1;

SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;

SELECT LEFT(name, STRPOS(name, ' ') -1 ) first_name,
RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;

SELECT *
FROM sf_crime_data
LIMIT 10;

SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data;

SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT standard_amt_usd,
      SUM(standard_amt_usd) OVER (ORDER BY occurred_at) AS running_total
FROM orders

SELECT standard_amt_usd,
      DATE_TRUNC('year', occurred_at) as year,
      SUM(standard_amt_usd) OVER (PARTITION BY DATE_TRUNC('year', occurred_at) ORDER BY occurred_at) AS running_total
FROM orders

SELECT id,
      account_id,
      total,
      RANK() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders

SELECT id,
      account_id,
      standard_qty,
      DATE_TRUNC('month', occurred_at) AS month,
      DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS dense_rank,
      SUM(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS sum_std_qty,
      COUNT(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS count_std_qty,
      AVG(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS avg_std_qty,
      MIN(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS min_std_qty,
      MAX(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS max_std_qty
FROM orders

SELECT id,
      account_id,
      standard_qty,
      DATE_TRUNC('month', occurred_at) AS month,
      DENSE_RANK() OVER (PARTITION BY account_id) AS dense_rank,
      SUM(standard_qty) OVER (PARTITION BY account_id) AS sum_std_qty,
      COUNT(standard_qty) OVER (PARTITION BY account_id) AS count_std_qty,
      AVG(standard_qty) OVER (PARTITION BY account_id) AS avg_std_qty,
      MIN(standard_qty) OVER (PARTITION BY account_id) AS min_std_qty,
      MAX(standard_qty) OVER (PARTITION BY account_id) AS max_std_qty
FROM orders

SELECT id,
      account_id,
      DATE_TRUNC('year',occurred_at) AS year,
      DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS dense_rank,
      total_amt_usd,
      SUM(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS sum_total_amt_usd,
      COUNT(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS count_total_amt_usd,
      AVG(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS avg_total_amt_usd,
      MIN(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS min_total_amt_usd,
      MAX(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS max_total_amt_usd
FROM orders

SELECT id,
      account_id,
      DATE_TRUNC('year',occurred_at) AS year,
      DENSE_RANK() OVER account_year_window AS dense_rank,
      total_amt_usd,
      SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
      COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
      AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
      MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
      MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at))

SELECT id,
      account_id,
      DATE_TRUNC('year',occurred_at) AS year,
      DENSE_RANK() OVER account_year_window AS dense_rank,
      total_amt_usd,
      SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
      COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
      AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
      MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
      MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at))

SELECT     account_id, SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1

SELECT account_id, standard_sum
FROM   (
       SELECT   account_id, SUM(standard_qty) AS standard_sum
       FROM     orders
       GROUP BY 1
      ) sub

      SELECT account_id,
      standard_sum,
      LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM   (
       SELECT   account_id,
                SUM(standard_qty) AS standard_sum
       FROM     demo.orders
       GROUP BY 1
      ) sub

      SELECT account_id,
             standard_sum,
             LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
      FROM   (
              SELECT   account_id, SUM(standard_qty) AS standard_sum
              FROM     orders
              GROUP BY 1
             ) sub


             SELECT account_id,
                    standard_sum,
                    LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
                    standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference
             FROM (
                    SELECT account_id,
                    SUM(standard_qty) AS standard_sum
                    FROM orders
                    GROUP BY 1
                   ) sub


                   SELECT     account_id,
                              SUM(standard_qty) AS standard_sum
                   FROM       demo.orders
                   GROUP BY   1

                   SELECT account_id,
                          standard_sum
                   FROM   (
                           SELECT   account_id,
                                    SUM(standard_qty) AS standard_sum
                           FROM     demo.orders
                           GROUP BY 1
                          ) sub

                          SELECT account_id,
      standard_sum,
      LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead
FROM   (
       SELECT   account_id,
                SUM(standard_qty) AS standard_sum
       FROM     demo.orders
       GROUP BY 1
      ) sub

      SELECT account_id,
      standard_sum,
      LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead
FROM   (
       SELECT   account_id,
                SUM(standard_qty) AS standard_sum
       FROM     demo.orders
       GROUP BY 1
      ) sub

      SELECT account_id,
      standard_sum,
      LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
      LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
SELECT account_id,
      SUM(standard_qty) AS standard_sum
      FROM orders
      GROUP BY 1
    ) sub

    SELECT account_id,
      standard_sum,
      LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
      LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
      standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference,
      LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
SELECT account_id,
      SUM(standard_qty) AS standard_sum
 FROM orders
GROUP BY 1
) sub

SELECT occurred_at,
      total_amt_usd,
      LEAD(total_amt_usd) OVER (ORDER BY occurred_at) AS lead,
      LEAD(total_amt_usd) OVER (ORDER BY occurred_at) - total_amt_usd AS lead_difference
FROM (
SELECT occurred_at,
      SUM(total_amt_usd) AS total_amt_usd
 FROM orders
GROUP BY 1
) sub

Percentiles with Partitions
1.
SELECT
      account_id,
      occurred_at,
      standard_qty,
      NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
 FROM orders
ORDER BY account_id DESC
2.
SELECT
      account_id,
      occurred_at,
      gloss_qty,
      NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
 FROM orders
ORDER BY account_id DESC
3.
SELECT
      account_id,
      occurred_at,
      total_amt_usd,
      NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
 FROM orders
ORDER BY account_id DESC

SELECT accounts.name as account_name,
      accounts.primary_poc as poc_name,
      sales_reps.name as sales_rep_name
 FROM accounts
 LEFT JOIN sales_reps
   ON accounts.sales_rep_id = sales_reps.id
  AND accounts.primary_poc < sales_reps.name

  SELECT *
      FROM accounts

  UNION ALL

  SELECT *
    FROM accounts

    SELECT *
   FROM accounts
   WHERE name = 'Walmart'

UNION ALL

SELECT *
 FROM accounts
 WHERE name = 'Disney'

 WITH double_accounts AS (
   SELECT *
     FROM accounts

   UNION ALL

   SELECT *
     FROM accounts
)

SELECT name,
      COUNT(*) AS name_count
FROM double_accounts
GROUP BY 1
ORDER BY 2 DESC

SELECT * FROM Actor;
SELECT * FROM Film;

SELECT a.first_name,
      a.last_name,
      a.first_name || ' ' || a.last_name AS full_name,
      f.title,
      f.length
FROM   film_actor fa
JOIN   actor a
ON     fa.actor_id = a.actor_id
JOIN   film f
ON     f.film_id = fa.film_id

SELECT a.first_name,
      a.last_name,
      a.first_name || ' ' || a.last_name AS full_name,
      f.title ,
      f.length
FROM   film_actor fa
JOIN   actor a
ON     fa.actor_id = a.actor_id
JOIN   film f
ON     f.film_id = fa.film_id
WHERE  f.length > 60

SELECT full_name,
      filmtitle,
      filmlen,
      CASE WHEN filmlen <= 60 THEN '1 hour or less'
      WHEN filmlen > 60 AND filmlen <= 120 THEN 'Between 1-2 hours'
      WHEN filmlen > 120 AND filmlen <= 180 THEN 'Between 2-3 hours'
      ELSE 'More than 3 hours' END AS filmlen_groups
FROM
   (SELECT a.first_name,
              a.last_name,
              a.first_name || ' ' || a.last_name AS full_name,
              f.title filmtitle,
              f.length filmlen
       FROM film_actor fa
       JOIN actor a
       ON fa.actor_id = a.actor_id
       JOIN film f
       ON f.film_id = fa.film_id) t1


SELECT    DISTINCT(filmlen_groups),
         COUNT(title) OVER (PARTITION BY filmlen_groups) AS filmcount_bylencat
FROM
        (SELECT title,length,
         CASE WHEN length <= 60 THEN '1 hour or less'
         WHEN length > 60 AND length <= 120 THEN 'Between 1-2 hours'
         WHEN length > 120 AND length <= 180 THEN 'Between 2-3 hours'
         ELSE 'More than 3 hours' END AS filmlen_groups
         FROM film ) t1
ORDER BY  filmlen_groups

-- Question 1

SELECT f.title AS film_title, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id


SELECT f.title AS film_title, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id


SELECT film_title, category_name, COUNT (rental_id) OVER (PARTITION BY film_title) AS rental_count
FROM
(SELECT f.title AS film_title, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id) t1

ORDER BY rental_count;

SELECT film_title, category_name, COUNT (r.rental_id) OVER (PARTITION BY film_title) AS rental_count
FROM
(SELECT f.title AS film_title, r.rental_id, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id) t1
ORDER BY rental_count;


































SELECT film_title, category_name, COUNT (rental_id) OVER (PARTITION BY film_title) AS rental_count
FROM
(SELECT f.title AS film_title, r.rental_id, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id) t1
GROUP BY category_name
ORDER BY rental_count;

--QUERYQUESTION 1 WRONG SOLUTIONS

SELECT film_title, category_name, COUNT (rental_id) OVER (PARTITION BY film_title) AS rental_count
FROM
(SELECT f.title AS film_title, r.rental_id, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id) t1
GROUP BY category_name, film_title, rental_id
ORDER BY category_name;

SELECT film_title, category_name, COUNT (rental_id) OVER (PARTITION BY film_title) AS rental_count
FROM
(SELECT f.title AS film_title, r.rental_id, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id) t1
GROUP BY category_name, film_title, rental_id
ORDER BY category_name, film_title;

--QUERYQUESTION 2 wrong solutions.

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
GROUP BY f.title, c.name, f.rental_duration
ORDER BY title, name, rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY rental_duration) AS q1,
NTILE(50) OVER (ORDER BY rental_duration) AS q2,
NTILE(75) OVER (ORDER BY rental_duration) AS q3,
NTILE(100) OVER (ORDER BY rental_duration) AS q4
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
GROUP BY f.title, c.name, f.rental_duration
ORDER BY title, name, rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(50) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(75) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(100) OVER (ORDER BY rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY title, name, rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY rental_duration) AS q1,
NTILE(50) OVER (ORDER BY rental_duration) AS q2,
NTILE(75) OVER (ORDER BY rental_duration) AS q3,
NTILE(100) OVER (ORDER BY rental_duration) AS q4
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY title, name, rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY rental_duration) AS q1,
NTILE(50) OVER (ORDER BY rental_duration) AS q2,
NTILE(75) OVER (ORDER BY rental_duration) AS q3,
NTILE(100) OVER (ORDER BY rental_duration) AS q4
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(50) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(75) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(100) OVER (ORDER BY rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(50) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(75) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(100) OVER (ORDER BY rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(50) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(75) OVER (ORDER BY rental_duration) AS standard_quartile,
NTILE(100) OVER (ORDER BY rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY title) AS standard_quartile,
NTILE(50) OVER (ORDER BY title) AS standard_quartile,
NTILE(75) OVER (ORDER BY title) AS standard_quartile,
NTILE(100) OVER (ORDER BY title) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY rental_duration;

SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(25) OVER (ORDER BY title) AS first_quarter,
NTILE(50) OVER (ORDER BY title) AS second_quarter,
NTILE(75) OVER (ORDER BY title) AS third_quarter,
NTILE(100) OVER (ORDER BY title) AS fourth_quarter
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY f.title, c.name, f.rental_duration
ORDER BY rental_duration;

SELECT t1.title, t1.name, t1.rental_duration, t1.standard_quartile, count (*)
FROM
(SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
ORDER BY rental_duration) t1
GROUP BY t1.title, t1.name, t1.rental_duration, t1.standard_quartile;

SELECT t1.title, t1.name, t1.rental_duration, t1.standard_quartile, count (*)
FROM
(SELECT c.name AS name, f.rental_duration AS rental_duration, f.title AS title,
NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
ORDER BY rental_duration) t1
GROUP BY t1.title, t1.name, t1.rental_duration, t1.standard_quartile
ORDER BY rental_duration;

--QUERYQUESTION 4 wrong solutions

SELECT s.store_id, DATE_PART ('month', rental_date) AS rental_month, DATE_PART ('year', rental_date) AS rental_year, COUNT(*) AS count_rentals
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
JOIN store s
ON s.store_id = c.store_id;
GROUP BY s.store_id, r.rental_date

SELECT s.store_id, DATE_PART ('month', rental_date) AS rental_month, DATE_PART ('year', rental_date) AS rental_year, COUNT(*) AS count_rentals
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
JOIN store s
ON s.store_id = c.store_id
GROUP BY DATE_PART ('month', rental_date), DATE_TRUNC ('year', rental_date), s.store_id, r.rental_date
ORDER BY DATE_PART ('month', rental_date), DATE_PART ('year', rental_date), s.store_id;

SELECT c.name AS name, s.store_id, DATE_PART ('month', rental_date) AS rental_month, DATE_PART ('year', rental_date) AS rental_year, COUNT(*) AS count_rentals
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
JOIN inventory i
ON i.film_id = f.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id
JOIN customer cu
ON r.customer_id = cu.customer_id
JOIN store s
ON s.store_id = cu.store_id
WHERE name = 'Animation'
OR name ='Children'
OR name = 'Classics'
OR name = 'Comedy'
OR name = 'Family'
OR name = 'Music'
GROUP BY DATE_PART ('month', rental_date), DATE_TRUNC ('year', rental_date), s.store_id, r.rental_date, c.name

SELECT s.store_id, DATE_PART ('month', rental_date) AS rental_month, DATE_PART ('year', rental_date) AS rental_year, COUNT(*) AS count_rentals
FROM rental r
JOIN customer cu
ON r.customer_id = cu.customer_id
JOIN store s
ON s.store_id = cu.store_id
GROUP BY s.store_id, r.rental_date;

SELECT DATE_PART ('month', rental_date) AS rental_month, DATE_PART ('year', rental_date) AS rental_year, COUNT(r.rental_id) AS count_rentals,
FROM rental r
JOIN customer cu
ON r.customer_id = cu.customer_id
JOIN store s
ON s.store_id = cu.store_id
GROUP BY s.store_id, r.rental_date
ORDER BY count_rentals DESC;

SELECT DATE_PART ('month', rental_date) AS rental_month, DATE_PART ('year', rental_date) AS rental_year, s.store_id AS store_id, COUNT (*) AS count_rentals
FROM rental r
JOIN staff st
ON r.staff_id = st.staff_id
JOIN store s
ON s.store_id = st.store_id
GROUP BY 1, 2, 3
ORDER BY count_rentals DESC;

/*--QUESTION_SET_1*/

--/*QUERYUSED FOR FIRST INSIGHT (QUESTION 1)*/

SELECT DISTINCT film_title, category_name, COUNT (rental_id) OVER (PARTITION BY film_title) AS rental_count
FROM
   (SELECT f.title AS film_title, r.rental_id, c.name AS category_name
   FROM film f
   JOIN film_category fc
   ON f.film_id = fc.film_id
   JOIN category c
   ON c.category_id = fc.category_id
   JOIN inventory i
   ON f.film_id = i.film_id
   JOIN rental r
   ON r.inventory_id = i.inventory_id
   WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music')) t1
GROUP BY category_name, film_title, rental_id
ORDER BY category_name, film_title;

--/*OR*/

SELECT DISTINCT film_title, category_name, COUNT (rental_id) OVER (PARTITION BY film_title) AS rental_count
FROM
   (SELECT f.title AS film_title, r.rental_id, c.name AS category_name
   FROM film f
   JOIN film_category fc
   ON f.film_id = fc.film_id
   JOIN category c
   ON c.category_id = fc.category_id
   JOIN inventory i
   ON f.film_id = i.film_id
   JOIN rental r
   ON r.inventory_id = i.inventory_id
   WHERE c.name = 'Animation'
OR c.name ='Children'
OR c.name = 'Classics'
OR c.name = 'Comedy'
OR c.name = 'Family'
OR c.name = 'Music') t1
GROUP BY category_name, film_title, rental_id
ORDER BY category_name, film_title;


--/*QUERYUSED FOR SECOND INSIGHT (QUESTION 2)*/

SELECT c.name AS category_name, f.rental_duration AS rental_duration, f.title AS film_title,
NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music')
ORDER BY 2;

--/*OR*/

SELECT c.name AS category_name, f.rental_duration AS rental_duration, f.title AS film_title,
NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE c.name = 'Animation'
OR c.name ='Children'
OR c.name = 'Classics'
OR c.name = 'Comedy'
OR c.name = 'Family'
OR c.name = 'Music'
ORDER BY rental_duration;

--/*QUERY USED FOR THIRD INSIGHT (QUESTION 3)*/

SELECT t1.category_name, t1.standard_quartile, count (*)
FROM
   (SELECT c.name AS category_name, f.rental_duration AS rental_duration, f.title AS film_title,
   NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
   FROM category c
   JOIN film_category fc
   ON c.category_id = fc.category_id
   JOIN film f
   ON f.film_id = fc.film_id
   WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music')
   ORDER BY rental_duration) t1
GROUP BY 1, 2
ORDER BY 1, 2;

--/*OR*/

SELECT t1.category_name, t1.standard_quartile, count (*)
FROM
   (SELECT c.name AS category_name, f.rental_duration AS rental_duration, f.title AS film_title,
   NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
   FROM category c
   JOIN film_category fc
   ON c.category_id = fc.category_id
   JOIN film f
   ON f.film_id = fc.film_id
   WHERE c.name = 'Animation'
   OR c.name ='Children'
   OR c.name = 'Classics'
   OR c.name = 'Comedy'
   OR c.name = 'Family'
   OR c.name = 'Music'
   ORDER BY rental_duration) t1
GROUP BY t1.category_name, t1.standard_quartile
ORDER BY t1.category_name;

/*--QUESTION_SET_2*/

--/*QUERY USED FOR FOURTH INSIGHT (QUESTION 4)*/

SELECT DATE_PART ('month', rental_date) AS rental_month, DATE_PART ('year', rental_date) AS rental_year, s.store_id AS store_id, COUNT (*) AS count_rentals
FROM rental r
JOIN staff st
ON r.staff_id = st.staff_id
JOIN store s
ON s.store_id = st.store_id
GROUP BY 1, 2, 3
ORDER BY count_rentals DESC;

----/*QUERY USED FOR FIFTH INSIGHT (QUESTION 5)*/

SELECT SUM(p.amount) AS pay_amount, CONCAT(cu.first_name,' ',cu.last_name) AS full_name
FROM customer cu
JOIN payment p
ON p.customer_id =cu.customer_id
GROUP BY 2
ORDER BY 1 DESC
LIMIT 10
--

SELECT full_name
FROM
  (SELECT SUM(p.amount) AS pay_amount, CONCAT(cu.first_name,' ',cu.last_name) AS full_name
  FROM customer cu
  JOIN payment p
  ON p.customer_id =cu.customer_id
  GROUP BY 2
  ORDER BY 1 DESC
  LIMIT 10) t1

--
SELECT DATE_TRUNC ('month', p.payment_date) AS pay_mon, CONCAT(cu.first_name,' ',cu.last_name) AS full_name, COUNT (*) AS mon_pay_count, SUM(p.amount) AS pay_amount
FROM customer cu
JOIN payment p
ON p.customer_id =cu.customer_id
WHERE CONCAT(cu.first_name,' ',cu.last_name) IN (SELECT full_name
FROM
  (SELECT SUM(p.amount) AS pay_amount, CONCAT(cu.first_name,' ',cu.last_name) AS full_name
  FROM customer cu
  JOIN payment p
  ON p.customer_id =cu.customer_id
  GROUP BY 2
  ORDER BY 1 DESC
  LIMIT 10) t1)
GROUP BY 1, 2
ORDER BY 2;

----/*QUERY USED FOR SIXTH INSIGHT (QUESTION 6)*/

SELECT pay_mon, full_name, pay_amount, ABS(pay_amount - pay_lag) AS pay_amount_diff
FROM
  (SELECT DATE_TRUNC ('month', p.payment_date) AS pay_mon, CONCAT(cu.first_name,' ',cu.last_name) AS full_name, COUNT (*) AS mon_pay_count, SUM(p.amount) AS pay_amount, LAG (SUM (p.amount)) OVER (PARTITION BY CONCAT(cu.first_name,' ',cu.last_name)) AS pay_lag
  FROM customer cu
  JOIN payment p
  ON p.customer_id =cu.customer_id
  WHERE CONCAT(cu.first_name,' ',cu.last_name) IN (SELECT full_name
  FROM
    (SELECT SUM(p.amount) AS pay_amount, CONCAT(cu.first_name,' ',cu.last_name) AS full_name
    FROM customer cu
    JOIN payment p
    ON p.customer_id =cu.customer_id
    GROUP BY 2
    ORDER BY 1 DESC
    LIMIT 10) t1)
  GROUP BY 1, 2
  ORDER BY 2) t2
