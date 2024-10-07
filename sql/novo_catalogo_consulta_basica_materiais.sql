-- Estrutura:
-- - Classificação até Grupo: vai mostrar apenas a estrutura hierárquica até Grupo.
-- - Classificação até Classe: vai mostrar apenas a estrutura hierárquica até Classe.
-- - Classificação até PDM: vai mostrar apenas a estrutura hierárquica até PDM.
-- - Classificação até Itens: vai exibir todos os códigos de itens válidos, mas sem o detalhamento.
-- - Classificação até Características: se refere à tabela final, mas, devido à nova perspectiva de
--  	"Características", o detalhamento dos itens é mostrado de forma parametrizada, sendo cada 
-- 		linha uma característica de cada itens, gerando uma tabela bem maior do que a quantidade 
-- 		real de itens cadastrados.

----- Classificação até Grupos
SELECT 
	g.codigo_grupo,
	g.nome_grupo
FROM grupo_material g
;

----- Classificação até Classe
SELECT 
	g.codigo_grupo,
	g.nome_grupo,
	c.codigo_classe,
	c.nome_classe
FROM grupo_material g
JOIN classe_material c ON g.codigo_grupo = c.codigo_grupo
ORDER BY g.codigo_grupo
;

----- Classificação até PDM
SELECT 
	g.codigo_grupo,
	g.nome_grupo,
	c.codigo_classe,
	c.nome_classe,
	p.codigo_pdm,
	p.nome_pdm
FROM grupo_material g
JOIN classe_material c ON g.codigo_grupo = c.codigo_grupo
JOIN pdm_material p ON p.codigo_classe = c.codigo_classe
ORDER BY g.codigo_grupo,c.codigo_classe,p.codigo_pdm
;

----- Classificação até Itens
SELECT DISTINCT
	g.codigo_grupo,
	g.nome_grupo,
	cl.codigo_classe,
	cl.nome_classe,
	p.codigo_pdm,
	p.nome_pdm,
	i.codigo_item
FROM grupo_material g
JOIN classe_material cl ON g.codigo_grupo = cl.codigo_grupo
JOIN pdm_material p ON p.codigo_classe = cl.codigo_classe
JOIN item_material i ON i.codigo_pdm = p.codigo_pdm
ORDER BY g.codigo_grupo,cl.codigo_classe,p.codigo_pdm,i.codigo_item
;

----- Classificação até Características
SELECT 
	g.codigo_grupo,
	g.nome_grupo,
	cl.codigo_classe,
	cl.nome_classe,
	p.codigo_pdm,
	p.nome_pdm,
	i.codigo_item,
	i.numero_caracteristica,
	cr.nome_caracteristica,
	v.nome_valor_caracteristica,
	i.sigla_unidade_medida
FROM grupo_material g
JOIN classe_material cl ON g.codigo_grupo = cl.codigo_grupo
JOIN pdm_material p ON p.codigo_classe = cl.codigo_classe
JOIN item_material i ON i.codigo_pdm = p.codigo_pdm
JOIN caracteristica_detalhe_material cr ON cr.codigo_caracteristica = i.codigo_caracteristica
JOIN valor_caracteristica_material v ON v.codigo_valor_caracteristica = i.codigo_valor_caracteristica
ORDER BY g.codigo_grupo,cl.codigo_classe,p.codigo_pdm,i.codigo_item,i.numero_caracteristica
;