SELECT
p.surname,
p.name,
p.birth_date,
SUM(ord.price_with_discount * ord.product_amount) AS sum
  FROM order_details AS ord
  INNER JOIN customer_order as cuo
  ON ord.customer_order_id = cuo.id
  INNER JOIN customer as cus
  ON cus.person_id = cuo.customer_id
  INNER JOIN person as p
  ON cus.person_id = p.id
  WHERE cus.discount=0 and cuo.operation_time BETWEEN '2021-01-01' AND '2021-12-31'
  GROUP BY p.name, p.surname, p.birth_date
  ORDER BY p.surname;