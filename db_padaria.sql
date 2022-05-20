drop database db_padaria;
create database db_padaria;
	use db_padaria;

create table tbFuncionarios(
	codfunc int not null auto_increment,
	nome varchar(200) not null,
	email varchar(200) not null,
	cpf char(14) not null unique,
	salario decimal(9,2) not null default 0.0 check(salario >= 0),
	sexo char(1) default 'F' check(sexo in('F','M')),
	ctps char(6) default '000000',
	logradouro varchar(200),
	numero char(10),
	bairro varchar (200),
	cep char(9),
	primary key(codfunc));

create table tb_Fornecedores(
codForn int not null auto_increment,
nome varchar(200) not null,
cnpj char(14) not null unique,
inscest char(9) not null unique,
email varchar(200) not null,
primary key (codForn));

create table tb_Clientes(
codCli int not null auto_increment,
nome varchar(200) not null,
cpf char(14) not null unique,
email varchar(200) not null,
cel char(10),
primary key (codCli));

create table tb_Usuarios(
	codUsu int not null auto_increment,
	nome varchar(20) not null,
	senha varchar(20) not null,
	codfunc int not null,
	primary key (codUsu),
	foreign key(codfunc)references tbFuncionarios(codfunc));

create table tb_Produtos(
codProd int not null auto_increment,
descricao varchar(200) not null,
valor decimal(9,2) not null default 0.0 check(valor >= 0),
dataEntrada datetime not null,
validade datetime not null,
codForn int not null,
primary key(codProd),
foreign key(codForn)references tb_Fornecedores(codForn));

create table tb_Vendas(
codVenda int not null auto_increment,
codProd int not null,
codUsu int not null,
codCli int not null,
dataVenda datetime,
horaVenda time,
quantidade decimal(9,2) not null default 0.0 check(quantidade >=0),
valor decimal(9,2) not null default 0.0 check(valor >=0),
primary key (codVenda),
foreign key(codProd)references tb_Produtos(codProd),
foreign key(codUsu)references tb_Usuarios(codUsu),
foreign key(codCli)references tb_Clientes(codCli));