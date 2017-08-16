select p.descricao,v.id as id_venda,(v.valor_unit * qtd) as val_total_item

sum(valor_unit*valor_qtd) as val _total


1 listar todos os produtos vendidos em 08/2017
2 listar os produtos vendidos no mes de 08/2017 onde o total de cada produto vendido é maior que 500 reais
3 quais os 5 produtos que foram mais vendidos no mes de 08/2017
4 quais os 3 clientes que mais compraram no mes de 07/2017

-- Exercicio 1
select 	P.* 
from 	Venda_Produtos VP
			inner join	Vendas V 
			on VP.id_venda = V.id_venda
			inner join Produtos P
			on VP.id_produto = P.id
where	V.data >= '2017-08-01'
and		V.data <= '2017-08-31'

-- Exercicio 2
select P.*
from 	Venda_Produtos VP
			inner join	Vendas V 
			on VP.id_venda = V.id_venda
			inner join Produtos P
			on VP.id_produto = P.id
where	V.data >= '2017-08-01'
and		V.data <= '2017-08-31'
and 	VP.val_uni * VP.Qtd > 500


-- Exercicio 3
select 	P.* 
from 	Venda_Produtos VP
			inner join	Vendas V 
			on VP.id_venda = V.id_venda
			inner join Produtos P
			on VP.id_produto = P.id
where	V.data >= '2017-08-01'
and		V.data <= '2017-08-31'
and		SUM(VP.qtd)
