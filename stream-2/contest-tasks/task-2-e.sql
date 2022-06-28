/*
Условие задачи:
В базе данных есть таблицы Invoice, InvoiceLine, Track следующего вида:
Напишите запрос, который составит рейтинг треков по их продаваемости, начиная с 2010 года.
На выходе должны получиться две колонки. В первой колонке должны быть Id трека, отсортированные в порядке возрастания,
а во второй колонке - количество проданных копий трека, отсортированных в порядке убывания.

Примечание:
Для решения задачи используется база данных Chinook Database в формате Sqlite -
см. файл  Chinook_Sqlite.sqlite в разделе Данные под описанием задачи.
*/

select t.TrackId, sum(il.Quantity) sum
from Track t
join InvoiceLine il on t.TrackId = il.TrackId
join Invoice i on i.InvoiceId = il.InvoiceId
where i.InvoiceDate >= '2010-01-01 00:00:00'
group by t.TrackId
order by t.TrackId, sum desc;