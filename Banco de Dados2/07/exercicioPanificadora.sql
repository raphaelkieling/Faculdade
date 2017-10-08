a//

select p.idProduto, p.nome,p.id_cat,c.nome as categoria
from Produtos p
	inner join categorias c
		on P.id_cat = c.idCat
		
		
		