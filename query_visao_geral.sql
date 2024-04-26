select 
	equipe.nome as equipe_nome,
    projetostatus.nome as status_nome,
    (
		select count(*) from usopesquisados where usopesquisados.idprojeto = proj.idprojeto
    ) as pesquisados,
    (
		select count(*) from registronavegacao as reg1 where reg1.idprojeto = proj.idprojeto
    ) as registros_count,
    (
		select sum(temp1.tempo) from tempodominio as temp1 where temp1.idprojeto = proj.idprojeto
    ) as time_navegacao,
    (
		select count(distinct(reg2.dominio)) from registronavegacao as reg2 where reg2.idprojeto = proj.idprojeto
    ) as dominios_count
from projeto as proj
	 inner join equipe on equipe.idequipe = proj.idequipe
     inner join projetostatus on projetostatus.idprojetostatus = proj.idstatus
where
	proj.idprojeto = 2