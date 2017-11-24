
CREATE TABLE IF NOT EXISTS `cassio_exercicios`.`produtos` (
  `idprodutos` INT(11) NOT NULL AUTO_INCREMENT,
  `prd_falta` VARCHAR(45) NULL DEFAULT NULL,
  `prd_qtd_estoque` DECIMAL NULL DEFAULT NULL,
  `prd_codigo` INT(11) NULL DEFAULT NULL,
  `prd_descricao` VARCHAR(45) NULL DEFAULT NULL,
  `prd_valor` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`idprodutos`))

CREATE TABLE IF NOT EXISTS `cassio_exercicios`.`orcamentos` (
  `idorcamentos` INT(11) NOT NULL AUTO_INCREMENT,
  `orc_data` DATETIME NULL DEFAULT NULL,
  `orc_status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idorcamentos`))

CREATE TABLE IF NOT EXISTS `cassio_exercicios`.`produtos_has_orcamentos` (
  `prd_codigo` INT(11) NOT NULL,
  `orc_codigo` INT(11) NOT NULL,
  `orp_qtd` DECIMAL NULL DEFAULT NULL,
  `orp_valor` DECIMAL NULL DEFAULT NULL,
  `orp_status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`prd_codigo`, `orc_codigo`),
  INDEX `fk_produtos_has_orcamentos_orcamentos1_idx` (`orc_codigo` ASC),
  INDEX `fk_produtos_has_orcamentos_produtos_idx` (`prd_codigo` ASC),
  CONSTRAINT `fk_produtos_has_orcamentos_produtos`
    FOREIGN KEY (`prd_codigo`)
    REFERENCES `cassio_exercicios`.`produtos` (`idprodutos`)
  CONSTRAINT `fk_produtos_has_orcamentos_orcamentos1`
    FOREIGN KEY (`orc_codigo`)
    REFERENCES `cassio_exercicios`.`orcamentos` (`idorcamentos`)
)



-------------------------------------------------------------
03 
delimiter //

create procedure populaBanco ()
begin

INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('15', '32', '23', '123', 'Shamppo', '22.30');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('2', '2', '32', 'Vela', '312.30');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('3', '3', '3', '12', 'Velinha', '2');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('20', '2', '2', '123', 'Mouse', '3');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('5', '123', '1', '2', 'Copo', '7');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('6', '2', '2', '21', 'Copão', '10');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_descricao`, `prd_valor`) VALUES ('7', '4', '3', 'Copinho', '5');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('8', '52', '21', '1', 'Celular', '566.25');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_falta`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('9', '2', '3', '3', 'Celularzão', '123');
INSERT INTO `cassio_exercicios`.`produtos` (`idprodutos`, `prd_qtd_estoque`, `prd_codigo`, `prd_descricao`, `prd_valor`) VALUES ('10', '12', '3', 'Fone de ouvido', '33');

end 
//

delimiter //
create procedure apagaUmProduto(id_prod int)
begin

delete from produtos where idprodutos = id_prod;

end
//

---------------------------------------------------------

delimiter //
create trigger mudouOrcamentoProdutos
after update on produtos_has_orcamentos
for each row
begin
  if(new.orp_status = 2) then
    update produtos
        set prd_qtd_estoque = (prd_qtd_estoque + old.orp_qtd)
        where idprodutos = new.prd_codigo;
  elseif
    update produtos
        set prd_qtd_estoque = (prd_qtd_estoque - old.orp_qtd)
        where idprodutos = new.prd_codigo;
  end if;
end
//

delimiter //
create trigger mudouOrcamentoProdutos
after insert on produtos_has_orcamentos
for each row
begin
    update produtos
        set prd_qtd_estoque = (prd_qtd_estoque - new.orp_qtd)
        where idprodutos = new.prd_codigo;
    end if;
end
//

delimiter //
create trigger mudouOrcamentoProdutos
after delete on produtos_has_orcamentos
for each row
begin
    update produtos
        set prd_qtd_estoque = (prd_qtd_estoque + new.orp_qtd)
        where idprodutos = new.prd_codigo;
    end if;
end
//

--------------------------------------------------

delimiter //
  create trigger exercicio5
    after update on produtos
    for each row
    begin
    
    create table if not exists produtos_atualizados(
      id int not null auto_increment primary key,
      prd_codigo int not null,
            prd_qtd_anterior decimal not null,
            prd_qtd_atualizada  decimal not null,
            prd_valor decimal not null
        ); 
        
        create table produtos_em_falta(
      idproduto_falta int not null auto_increment primary key,
            prd_falta varchar(50),
            prd_qtd_estoque decimal not null,
            prd_codigo int not null,
            prd_descricao int not null
        );
        
        insert into produtos_atualizados(id,qtd_anterior,qtd_atualizada,valor)
        values (new.idprodutos ,old.qtd_estoque,new.qtd_estoque,new.valor);
        
        if(new.qtd_estoque = 0) then
      insert into proutos_em_falta(id,qtd_anterior,qtd_atualizada)
            values (new.idprodutos,old.qtd_estoque,new.prd_qtd_estoque);
            
            update orcamentos_produtos op
            set op.op_status = null
            where op.id_prod = new.id;
            
            set new.prd_status = null;
        end if;
        
    end
//