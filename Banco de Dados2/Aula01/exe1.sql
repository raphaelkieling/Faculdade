
-- Exercicio 1
create table Inquilino(
	id int not null primary key auto_increment,
	nome varchar(250),
	endereco varchar(250),
	telefone varchar(20)
);

create table Proprietario(
	id int not null primary key auto_increment,
	nome varchar(250),
	endereco varchar(250),
	telefone varchar(20)
);

create table Imovel(
	id int not null primary key auto_increment,
	nmr_quartos int,
	endereco varchar(250),
	bairro varchar(250),
	descricao varchar(250),
	id_inquilino int not null,
	id_proprietario int not null,
	foreign key (id_inquilino) references Inquilino(id),
	foreign key (id_proprietario) references Proprietario(id)
);

create table Locacoes(
	id int not null primary key auto_increment,
	dataini Datetime,
	datafim Datetime,
	imovelid int not null,
	inquilinoid int not null,
	npessoas int,
	caucao decimal(4,2),
	foreign key (inquilinoidd) references Inquilino(id),
	foreign key (movelid) references Imovel(id)
);

-- Exercicio 2
	Cidade
	Filial
	Empregado
	Produto
	Vende

-- Exercicio 4
create table Filial(
	codfilial int not null primary key auto_increment,
	nome varchar(250),
	endereco varchar(250),
	codcid int not null,
	foreign key (codcid) references Cidade(codcid)
);

create table Vende(
	codprod int not null,
	codfilial int not null,
	foreign key (codprod) references Produto(codproduto),
	foreign key (codfilial) references Filial(codfilial)
);

select * from Produto order by preco desc;
select AVG(preco) from Produto;
select Produto.descricao from Vende inner join Produto on Produto.codprod = Vende.codprod inner join Filial where Filial.nome = "f3";
select nome,rg from Empregado as Emp inner join Cidade on Cidade.codcid = Emp.codcid where Cidade.uf = "RS" and where Emp.salario > 5000;


--Exercicio 5
create table Livro(
	codlivro int not null primary key auto_increment,
	titulo varchar(250),
	codautor int not null,
	nfolhas int,
	editora varchar(250),
	valor decimal(3,2),
	codcat int not null,
	foreign key (codautor) references Autor(codautor)
		on delete cascade,
	foreign key (codcat) references Categoria(codcat)
);

create table Categoria(
	codcat int not null primary key auto_increment,
	nome varchar(250),
	descricao text
);

--Exercicio 6
select count(codlivro) from Venda;
select titulo from Livro where editora="Campos";
select Livro.titulo,Autor.nome from Livro inner join Autor on Autor.codautor = Livro.codautor where Livro.valor > 300;
select Cliente.nome,Cidade.nome,Cidade.UF from Cliente inner join Cidade on Cidade.codcid = Cleinte.codcid;
select Cliente.nome,Livro.titulo from Venda inner join Cliente on Cliente.codclinte = Venda.codcliente inner join Livro on Livro.codlivro = Venda.codlivro;
