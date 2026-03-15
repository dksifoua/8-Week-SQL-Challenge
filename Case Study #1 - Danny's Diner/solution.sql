set search_path = dannys_diner;

-- 1. What is the total amount each customer spent at the restaurant?

select
    sales.customer_id
    , sum(menu.price) as total_amount
from sales
left join menu on menu.product_id = sales.product_id
group by sales.customer_id
;

-- 2. How many days has each customer visited the restaurant?

select
    sales.customer_id
    , count(distinct sales.order_date) as number_of_dates
from sales
group by sales.customer_id
;

-- 3. What was the first item from the menu purchased by each customer?

with item_purchased_order as
(
    select
        sales.customer_id
        , menu.product_name
        , sales.order_date
        , dense_rank() over (
            partition by sales.customer_id 
            order by sales.order_date
        ) as row_order
    from sales
    left join menu on menu.product_id = sales.product_id
)
select distinct customer_id, product_name, order_date
from item_purchased_order
where row_order = 1
;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

with purchased_item_count as (
    select 
        sales.product_id
         , menu.product_name
         , count(sales.product_id) as puchased_count
    from sales
    inner join menu
        on menu.product_id = sales.product_id
    group by
        sales.product_id
        , menu.product_name
)
select *
from purchased_item_count
order by puchased_count desc 
limit 1
;
    
-- 5. Which item was the most popular for each customer?

with purchased_item_count_by_customer as (
    select
        sales.customer_id
        , menu.product_name
        , count(sales.product_id) as purchased_count
        , dense_rank() over (
            partition by customer_id
            order by count(sales.product_id) desc
        ) as purchashed_count_rank
    from sales
    inner join menu
        on menu.product_id = sales.product_id
    group by
        sales.customer_id
       , menu.product_name
)
select
    customer_id
    , product_name
    , purchased_count
from purchased_item_count_by_customer
where purchashed_count_rank = 1
;
    
-- 6. Which item was purchased first by the customer after they became a member?
    
with customers_purchases_after_becoming_member as (
    select
        members.customer_id
        , members.join_date
        , sales.order_date
        , menu.product_name
        , dense_rank() over (
            partition by members.customer_id
            order by sales.order_date
        ) as order_date_rank
    from members
    left join sales
        on
            sales.customer_id = members.customer_id
            and sales.order_date >= members.join_date
    left join menu
        on menu.product_id = sales.product_id
)
select
    customer_id
    , join_date
    , product_name
    , order_date
from customers_purchases_after_becoming_member
where order_date_rank = 1
;

-- 7. Which item was purchased just before the customer became a member?

with customers_purchases_before_becoming_member as (
    select
        members.customer_id
        , members.join_date
        , sales.order_date
        , menu.product_name
        , dense_rank() over (
            partition by members.customer_id
            order by sales.order_date desc
        ) as order_date_rank
    from members
    left join sales
        on
            sales.customer_id = members.customer_id
            and sales.order_date < members.join_date
    left join menu
        on menu.product_id = sales.product_id
)
select
    customer_id
    , join_date
    , product_name
    , order_date
from customers_purchases_before_becoming_member
where order_date_rank = 1
;

-- 8. What are the total items and amount spent for each member before they became a member?


select
    members.customer_id
    , count(sales.product_id) as total_items
    , sum(menu.price) as total_amount
from members
left join sales
    on
        sales.customer_id = members.customer_id
        and sales.order_date < members.join_date
left join menu
    on menu.product_id = sales.product_id
group by members.customer_id
;

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier, how many points would each customer have?

select
    sales.customer_id
    , sum(
        10 
        * menu.price 
        * case
            when menu.product_name = 'sushi' then 2
            else 1
        end
    ) as points
from sales
left join menu
    on menu.product_id = sales.product_id
group by customer_id
;


-- 10. In the first week after a customer joins the program (including their join date), they earn 2x points on all 
-- items, not just sushi - how many points do customer A and B have at the end of January?

select
    sales.customer_id
    , sum(
        10
        * menu.price
        * case
            when menu.product_name = 'sushi' then 2
            when sales.order_date 
                between members.join_date 
                and members.join_date + interval '6 days'
            then 2
        else 1
    end
    ) as points
from sales
left join members
    on members.customer_id = sales.customer_id
left join menu
    on menu.product_id = sales.product_id
where
    sales.customer_id in ('A', 'B')
    and sales.order_date < '2021-02-01'
group by sales.customer_id
;

-- Bonus Questions - Join All The Things

create table orders
as
select
    sales.customer_id
    , members.join_date
    , sales.order_date
    , menu.product_name
    , menu.price
    , case
        when sales.order_date >= members.join_date then 'Y'
        else 'N'
    end as member
    , case
        when sales.order_date >= members.join_date then rank() over (
            partition by
                sales.customer_id
                , sales.order_date >= members.join_date
            order by sales.order_date
        )
    end as rank
from sales
left join menu
    on menu.product_id = sales.product_id
left join members
    on members.customer_id = sales.customer_id
;

select *
from orders
order by customer_id, order_date
;