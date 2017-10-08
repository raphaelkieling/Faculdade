create database aula_cassio_revisao;


create table Produtos(
	idProduto int not null primary key auto_increment,
    nome varchar(40),
    valor decimal(10,2),
    saldo int
);

create table Orcamentos(
	idOrcamento int not null primary key auto_increment,
    data date,
    status decimal(10,2)
);

create table Orcamentos_itens(
	codOrcamento int not null,
    codProduto int not null,
    valorUnit decimal(10,2), 
    quantidade decimal(10,2),
    valor_total_item decimal(10,2),
    foreign key (codOrcamento) references Orcamentos(idOrcamento) on update cascade,
    foreign key (codProduto) references Produtos(idProduto) on delete restrict
);

-- create view
create view vworcamentos
as
select p.idProduto,p.nome,p.saldo,p.valor,oi.quantidade,oi.valorUnit from produtos p
    inner join orcamentos_itens oi
        on oi.codProduto = p.idProduto
    inner join orcamentos o
        on o.idOrcamento = oi.codOrcamento;

        --i
        select data,status from vworcamentos where idProduto=122;
        --ii
        select sum(quantidade*valorUnit) as ValorFinal from vworcamentos
        where date_add(current_date,interval -30 day) <= current_date
        --iii
        select * from vworcamentos
        where nome like '%Computador%' and
        saldo >0;
        --iv
        select nome from vworcamentos
        where date_add(current_date,interval -30 day) <= current_date
        and saldo >0
        and valor > 500
        group by idProduto
        order by total desc
        limit 10;
         
--d
delete from produtos
where idProduto not in(select codProduto 
                        from orcamentos_itens
                        where codProduto = produtos.idProduto);

--pegando maior que 50 mil SOMADOS
select sum(quantidade*valorUnit) as ValorFinal from vworcamentos
    where date_add(current_date,interval -30 day) <= current_date
    group by idProduto
    having ValorFinal > 9000;


--6) A cláusula GROUP BY agrupa linhas baseado na semelhanças entre elas.

--7) A cláusula HAVING comporta-se como um WHERE (uma condição) da clausula GROUP BY.

--8) A cláusula UNION  permite que a junção dos resultados de duas ou mais instruções 
--SELECT em um único conjunto de resultados.

--9) A cláusula LEFT JOIN permite obter não apenas os dados relacionados de duas tabelas, 
--mas também os dados não relacionados encontrados na tabela à esquerda da cláusula JOIN.