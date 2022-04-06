/*
Условие задачи:
В базе данных есть таблицы Invoice, Customer, Employee следующего вида:
Напишите запрос, который будет искать трех продавцов на маркетплейсе, совершивших больше всего продаж,
начиная с 2010 года. На выходе в первой колонке должны быть имя и фамилия продавца, а во второй количество их продаж,
отсортированное в порядке убывания.

Примечание:
Для решения задачи используется база данных Chinook Database в формате Sqlite -
см. файл  Chinook_Sqlite.sqlite в разделе Данные под описанием задачи.
*/

select (e.FirstName ||' '|| e.LastName) as name, count(i.InvoiceId) count_total
from Employee e
inner join Customer C on e.EmployeeId = C.SupportRepId
inner join Invoice I on C.CustomerId = I.CustomerId
where i.InvoiceDate >= '2010-01-01 00:00:00' and e.EmployeeId in (1,2,3,4,5)
group by name
order by count_total desc
limit 3;