-- 1. What is the total amount each customer spent at the restaurant?

select
    sales.customer_id
    , sum(
        case
            when menu.price is null then 0
            else menu.price
        end
    ) as total_amount
from sales
left join menu
	on menu.product_id = sales.product_id
group by sales.customer_id
;