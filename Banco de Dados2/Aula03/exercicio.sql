
	
1------------------------------------------
	Select 	P.id as código, p.nome as Produto
	From 	Vendas_produtos pv
			Inner join Vendas v
				On v.id_vendas = pv.id_venda
			Inner join Produtos P
				On p.id = pv.id_produto
	Where 	v.data >=  ‘2017/08/01’ and v.data <= ‘2017/08/31’;

2------------------------------------------
	Select 	P.id as código, p.nome as Produto, SUM (pv.qtd*pv.valor_uni) as soma
	From 	Vendas_produtos pv
			Inner join Vendas v
				On v.id_vendas = pv.id_venda
			Inner join Produtos P
				On p.id = pv.id_produto
	Where 	v.data >=  ‘2017/08/01’ and v.data <= ‘2017/08/31’ and SUM (pv.qtd*pv.val_unit) >= 10
	Group by p.id, p.nome;

3------------------------------------------
	Select 		P.id as código, p.nome as Produto, SUM (pv.qtd) as total
	From 		Vendas_produtos pv
				Inner join Vendas v
					On v.id_vendas = pv.id_venda
				Inner join Produtos P
					On p.id = pv.id_produto
	Where 		v.data >=  ‘2017/08/01’ and v.data <= ‘2017/08/31’
	Group by 	p.nome
	Order by	total desc
	Limit		5


4------------------------------------------
	Select        C.id as código, C.nome as Cliente, SUM (pv.qtd*pv,val_unit) as total
	From 		Vendas_produtos pv
				Inner join Vendas v
					On v.id_vendas = pv.id_venda
				Inner join Clientes C
					On C.id = pv.id_cliente
	Where 		v.data >=  ‘2017/07/01’ and v.data <= ‘2017/07/31’
	Group by 	C.nome
	Order by	total desc
	Limit		3;

5------------------------------------------
	Select		P.id as Codigo, P.nome as Produto, P.val_unit*1.1 as Opção_1, P.val_unit*1.15 as Opção_2, P.val_unit*1.2 as Opção_3,
	From 		Produtos P
	Where 		P.val_unit < 20;

6------------------------------------------
	Select 		P.id as código, p.nome as Produto, SUM (pv.qtd) as total
	From 		Vendas_produtos pv
				Inner join Vendas v
					On v.id_vendas = pv.id_venda
				Inner join Produtos P
					On p.id = pv.id_produto
	Group by 	p.nome
	Order by	total asc
	Limit		5
