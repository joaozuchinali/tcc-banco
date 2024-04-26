select 
	regnav.dominio,
    count(regnav.dominio) as pesquisas,
    (
		select sum(temp.tempo) from tempodominio as temp where temp.idprojeto = 2 and temp.dominio = regnav.dominio
    ) as tempo,
    count(distinct(regnav.idusopesquisados)) as usuarios
from 
	registronavegacao as regnav
where 
	regnav.idprojeto = 2 
group by regnav.dominio

