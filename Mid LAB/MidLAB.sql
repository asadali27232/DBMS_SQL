--Question 01 (i)
select  sum(titles.ytd_sales) as Total_YTD_Sales from titles
where pub_id = (
select pub_id from publishers
where pub_name = 'New Moon Books')

--Question 01 (ii)
select titles.title, au_fname, au_lname from titles
inner join titleauthor
on titles.title_id = titleauthor.title_id
inner join authors
on authors.au_id = titleauthor.au_id
 
--Question 01 (iii)
--What is the name of the employee and his job description who has worked for the
--publisher who published PC8888?

select employee.fname, employee.lname  from employee
where pub_id = (
select pub_id from titles
where title_id = 'PC8888')

--Question 02 (B)
--Display the name of the employee who handle most of the orders and find the total
--number of days he worked till date.


--Question 02 (C)
--Display the Author_Name, Publisher_Name, Employee_Name and Book_Name against
--the Book sold mostly.
select temp5.title, temp5.pub_name, temp5.Author_Name, (employee.fname + ' ' + employee.lname) as Employee_Name from employee, (
select  temp4.title, temp4.pub_name, (authors.au_fname + ' ' + au_lname) as Author_Name  from authors , (
select publishers.pub_name, temp3.au_id, temp3.title, temp3.title_id, temp3.pub_id from publishers , (
select au_id, temp2.title, temp2.title_id, temp2.pub_id from titleauthor, (
select titles.title_id, titles.title, titles.pub_id from titles
inner join (
select TOP 1 title_id, COUNT(title_id) as most_sold_title from sales
group by title_id
order by most_sold_title  desc) as temp
on temp.title_id = titles.title_id) as temp2
where titleauthor.title_id = temp2.title_id) temp3
where publishers.pub_id = temp3.pub_id) as temp4
where authors.au_id = temp4.au_id) as temp5

--Question 02 (D)
--Display the name of the store who earned maximum income.
select stores.stor_name from stores
where stor_id = (
select top 1 temp3.stor_id from (
select temp2.stor_id, sum(temp2.amount) as store_sale from (
select temp1.stor_id, (titles.price * temp1.qty) as amount from titles, (
select title_id, qty, stor_id from sales) temp1) temp2
group by temp2.stor_id)  as temp3
order by temp3.store_sale desc)