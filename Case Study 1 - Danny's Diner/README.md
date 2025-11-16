# Case Study 1 - Danny's Diner

## Problem Statement

Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

Danny has shared with you 3 key datasets for this case study:

- `sales`
- `menu`
- `members`

You can inspect the entity relationship diagram and example data below.

![Danny's Diner Entity Relationship Diagram](../images/Danny's%20Diner.png)

## Case Study Questions

### 1. What is the total amount each customer spent at the restaurant?

To get the total amount each customer spent at the restaurant, I first need to get all sales from the table `sales` and get the price of each sale from the table `menu` using a `left join`. Then, I aggregate the price by applying the `sum()` function to get the total amount each customer spent.

If during the join, a selled product doesn't have a price in the table `menu`, I set it to 0.

```sql
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
```