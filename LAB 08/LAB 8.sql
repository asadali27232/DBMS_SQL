
select sum(temp3.price) as sales, temp3.stor_id from
(select (select price from titles t where t.title_id=temp2.title_id)*temp2.qty as price,
temp2.stor_id from (
select stor_id, ord_num, qty, title_id from sales
where sales.stor_id = (
select temp1.stor_id from (
select  top 1 count(DISTINCT ord_num) as store_orders, stor_id from sales
group by stor_id
order by store_orders desc) as temp1)) as temp2) as temp3
group by temp3.stor_id

