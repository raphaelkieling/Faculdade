//a
delete from produtos 
where id_produto>=1000 or data_cadastro <'2005-01-01' ;

//b
select nome,cpf,data_nasc 
from cliente 
where nome='amelia';

//c
delete p from produtos p
	inner join grupos g on g.id_grupo = p.Grupos_id_grupo 
	where g.nome ="Fermentados" and p.valor_unit < 1000.00;
	
//d
select nome,cpf from cliente 
where data_nasc >= '2017-09-01' and data_nasc <= '2017-09-31'; 

//e
select c.cpf,c.nome from vendas
	right join cliente c on c.id_cliente = vendas.Cliente_id_cliente
    inner join cidades cid on cid.id_cidade = c.Cidades_id_cidade
where cid.nome_cidade = 'Torres' and vendas.total_venda >1000.00
order by vendas.total_venda desc limit 5;

//f
update produtos set produtos.valor_unit = produtos.valor_unit*0.8
where produtos.id_produto not in (Select Produtos_id_produto from venda_itens);


//g
select produtos.descricao,sum(v.quant*v.valor_unit) as Total from produtos
	inner join venda_itens v
		on v.Produtos_id_produto = produtos.id_produto
	inner join vendas
		on vendas.id_venda = v.Vendas_id_venda
group by produtos.descricao
limit 10;

//h
    select p.idgrupo, p.descricao, avg(p.valor_unit) as media
    from produtos p
    group by p.idgrupo
    having media > 29.90;
    
//i
    select g.nome, g.idgrupo
    from grupos g
    inner join produtos p
        on p.idgrupo = g.idgrupo
    inner join vendas_itens vi
        on vi.idprod = p.idprod
    inner join vendas v
        on v.idvenda = vi.idvenda
    inner join clientes c
        on   c.idcliente = v.idcliente
    where c.nome like 'Aleide Maciel';
    
//j
    select p.idprod,p.descricao,
     case when valor_unit >500 then 'Produto com valor elevado'
        when valor_unit between 50 and 200 then'Produto com preço bom'
     else
        'Produto em Destaque'
    end as status
    from produtos p;
	
//k
    select c.nome, max(p.valor_unit) as max
        from clientes c
            inner join vendas v
                on v.idcliente = c.idcliente
            inner join vendas_itens vi
                on v.idvenda = vi.idvenda
            inner join produtos p
                on p.idprod = vi.idprod
    group by c.nome
    having max > 250;
