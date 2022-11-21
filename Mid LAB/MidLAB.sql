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

--Question 01 ()