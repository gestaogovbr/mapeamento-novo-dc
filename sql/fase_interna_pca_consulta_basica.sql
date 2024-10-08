SELECT
	  a.id_artefato
	, a.nr_ano
	, a.id_uasg
	, a.in_estado
	, a.in_tipo
    , CASE a.in_tipo
        WHEN 0 THEN 'ETP'
        WHEN 1 THEN 'Matriz de Riscos'
        WHEN 2 THEN 'ETP (TIC)'
        WHEN 3 THEN 'Ainda sem uso'
        WHEN 4 THEN 'DFD'
        WHEN 5 THEN 'PGC'
        WHEN 6 THEN 'TR'
        WHEN 7 THEN 'Aviso de Contratação'
        WHEN 8 THEN 'Contrato'
        WHEN 9 THEN 'Ata de Registro de Preços'
        WHEN 10 THEN 'Edital'
        WHEN 11 THEN 'Outros tipos de documento'
        ELSE a.in_tipo END AS tx_tipo_artefato  
	, a.nm_uasg
	, a.bo_sigiloso
	, a.bo_excluido
	, a.id_unico
FROM Comprasnet_faseinterna_VBL.artefato a
WHERE 1=1
    AND a.in_tipo = 5
	AND a.id_uasg = 130024
--	AND ano_pca = 2023
ORDER BY a.id_uasg, a.nr_ano
;