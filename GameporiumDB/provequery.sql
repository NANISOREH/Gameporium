-- Visualizza gli ordini di un cliente
select *
from ordine as o join effettua as e on o.codiceOrdine=e.codiceOrdine 
where e.codiceCliente='CRRSRA90A50A091Q'
;

-- Visualizza i prodotti accessori
create view accessori as
select*
from prodotto as p
where p.codiceCategoria=2;

-- Visualizza i prodotti giochi
create view giochi as
select*
from prodotto as p
where p.codiceCategoria=1;

-- visualizza i prodotti (accessori)in ordine decrescente di prezzo
select * 
from accessori
order by prezzo desc;

-- visualizza i prodotti (giochi)in ordine decrescente di prezzo
select * 
from giochi
order by prezzo desc;

select *
from cliente as c join partecipazione as p on c.CF=p.codiceCliente;

select *
from composizione;

drop view if exists totaleOrdine; 
create view totaleOrdine as 
select p.prezzo, p.IVA, c.quantità, o.codiceOrdine
from prodotto as p, composizione as c, ordine as o
where p.codiceProdotto=c.codiceProdotto and o.codiceOrdine=c.codiceOrdine;

select *
from totaleOrdine;

create view totaleProdotto as
select ((prezzo*IVA)/100+prezzo)*quantità as piva, codiceOrdine
from totaleOrdine;

select sum(piva)
from totaleProdotto
group by codiceOrdine;