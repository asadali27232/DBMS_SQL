--Question 01 (i)
select  sum(titles.ytd_sales) as Total_YTD_Sales from titles
where pub_id = (
select pub_id from publishers
where pub_name = 'New Moon Books')

--Question 02 (ii)
select titles.title, au_fname, au_lname from titles
inner join titleauthor
on titles.title_id = titleauthor.title_id
inner join authors
on authors.au_id = titleauthor.au_id
 
 --Question 02 (iii)

