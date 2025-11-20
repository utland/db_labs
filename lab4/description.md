# Звіт до лабороторної 4
## Тема: Аналітичні SQL-запити
Середній відгук кожного товару
```sql
select p.name, coalesce(avg(r.evaluation), 0)
from product p
left join review r using (product_id)
group by p.product_id, p.name
order by p.name
```
![](./screenshots/get-avg-evaluation.png)
---
Вивести продавців, які пропонують більше, аніж 1 продукт
```sql
select s.name, count(product_id) as products
from supplier s
inner join product p using (supplier_id)
group by s.name, s.supplier_id
having count(product_id) > 1
```
![](./screenshots/get-product-amount.png)
---
Вивести найбльш активних користувачів за кількістю замовлень
```sql
select u.login, count(o.order_id) as amount
from users u
inner join orders o using(user_id)
group by u.login
order by amount desc
```
![](./screenshots/get-user-orders.png)
---
Вивести кількість одиниць товару, якого було продано
```sql
select p.name, 
    coalesce((
	   select sum(op.amount)
	   from order_product op
	   inner join orders o using(order_id)
	   where op.product_id = p.product_id and o.status = 'completed'
	), 0) as amount
from product p
order by amount desc
```
![](./screenshots/get-amount-product.png)
---
Товари, ціна яких вища за середню
```sql
with average_price as (
  select avg(price) as avg from product
)

select name, price, ap.avg
from product p, average_price ap
where p.price > ap.avg
```
![](./screenshots/get-higher-price.png)
---
Кількість користувачів, яким Supplier хоч один раз продавав товари за останній місяць 
```sql
with orders_for_month as (
    select order_id, user_id from orders 
	where order_date >= current_date - interval '1 month'
)

select s.name, s.supplier_id, count(u.user_id)
from supplier s 
    inner join product p on s.supplier_id = p.supplier_id
    inner join order_product op on op.product_id = p.product_id
	inner join orders_for_month o on o.order_id = op.order_id
	inner join users u on u.user_id = o.user_id
group by s.name, s.supplier_id
```
![](./screenshots/get-user-amount.png)