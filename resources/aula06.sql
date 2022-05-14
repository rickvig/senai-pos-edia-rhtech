



INSERT INTO "rh_colaborador" ("nome", "salario", "departamento_id", "cargo_id") VALUES ('Lorena Vignando', 4000, 2, 2)

INSERT INTO "rh_colaborador" ("nome", "salario", "departamento_id", "cargo_id") 
VALUES ('Maria Fernanda', 5000, 1, 2)

---------------------------

UPDATE rh_colaborador 
SET salario = 6000, cargo_id = 3 
WHERE nome like '%Vignando'


select 
	salario  
from 
	rh_colaborador
where nome like 'Maria%'


-----------------------------


DELETE FROM rh_colaborador 
WHERE id IN (4, 5)





-----------------





SET CONSTRAINTS "rh_colaborador_departamento_id_79fa9dd2_fk_rh_departamento_id" IMMEDIATE; 
ALTER TABLE "rh_colaborador" DROP CONSTRAINT "rh_colaborador_departamento_id_79fa9dd2_fk_rh_departamento_id";
ALTER TABLE "rh_colaborador" DROP COLUMN "departamento_id" CASCADE;
COMMIT;





-----

with total_item as (
	select *,
		quantidade * valor_unitario as total
	from rh_itemnotafiscal
)
select 
--	ti.nota_fiscal_id, 
	sum(ti.total),
--	ti.total,
	EXTRACT(MONTH FROM nt.data_lancamento)
from 
	total_item as ti,
	rh_notafiscal as nt
where 1=1
	and ti.nota_fiscal_id = nt.id 
	and EXTRACT(MONTH FROM nt.data_lancamento) in (4, 5)
group by 2


SELECT EXTRACT(MONTH FROM TIMESTAMP '2016-12-31 13:30:15');


--------

select 
	--c.nome,
	EXTRACT(MONTH FROM rf.data_lancamento) ,
	rd.nome,
	sum((rc.valor_hora * rf.horas_extras) + c.salario) as valor_tota 
from rh_folhapagamento rf 
	join rh_colaborador c on rf.colaborador_id = c.id 
	join rh_cargo rc on c.cargo_id = rc.id 
	join rh_departamento rd on rc.departamento_id = rd.id 
group by 1, 2


drop view faturamento;
create or replace view faturamento as (
	with total_item as (
		select *,
			quantidade * valor_unitario as total
		from rh_itemnotafiscal
	)
	select 
		sum(ti.total) as valor,
		EXTRACT(MONTH FROM nt.data_lancamento) as mes
	from 
		total_item as ti,
		rh_notafiscal as nt
	where 1=1
		and ti.nota_fiscal_id = nt.id 
		and EXTRACT(MONTH FROM nt.data_lancamento) in (4, 5)
	group by 2
)	
	
drop view custo_departamento;
create or replace view custo_departamento as (
	select 
		EXTRACT(MONTH FROM rf.data_lancamento) as mes,
		rd.nome as departamento,
		sum((rc.valor_hora * rf.horas_extras) + c.salario) as custo 
	from rh_folhapagamento rf 
		join rh_colaborador c on rf.colaborador_id = c.id 
		join rh_cargo rc on c.cargo_id = rc.id 
		join rh_departamento rd on rc.departamento_id = rd.id 
	group by 1, 2
)


----

select 
	f.mes ,
	d.departamento ,
	(d.custo / f.valor ) * 100 as perct
from 
	faturamento f, 
	custo_departamento d 
where f.mes = d.mes 







