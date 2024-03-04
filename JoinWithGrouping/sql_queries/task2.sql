SELECT c.name AS city,
       SUM(ord.price_with_discount* ord.product_amount) as income
  FROM order_details AS ord
  INNER JOIN customer_order AS cor
  ON ord.customer_order_id = cor.id
  INNER JOIN supermarket AS sup
  ON cor.supermarket_id = sup.id
  INNER JOIN street AS st
  ON st.id = sup.street_id
  INNER JOIN city AS c
  ON c.id = st.city_id
  WHERE cor.operation_time BETWEEN '2020-11-1' AND '2020-11-30'
  GROUP BY c.id
  ORDER BY (ord.price_with_discount* ord.product_amount);
