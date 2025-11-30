select p.name, count(op.product_id) as amount
from order_product op
right join product p on op.product_id = p.product_id
group by p.name
order by amount desc