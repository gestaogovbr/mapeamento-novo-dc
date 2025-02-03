SELECT 
    CASE a.in_tipo
        WHEN 0 THEN 'ETP' -- "Estudo Técnico Preliminar"
        WHEN 1 THEN 'MR' -- "Matriz de Riscos" 
        WHEN 2 THEN 'ETP_TIC' -- "Estudo Técnico Preliminar (TIC)" 
        WHEN 3 THEN 'PGC' -- "Programação e Gestão de Contratações" 
        WHEN 4 THEN 'DFD' -- "Documento de Formalização de Demanda" 
        WHEN 5 THEN 'PC' -- "Processo de Compra"
        WHEN 6 THEN 'TR' -- "Termo de Referência"
        WHEN 7 THEN 'Aviso de Contratação'
        WHEN 8 THEN 'Contrato'
        WHEN 9 THEN 'Ata de Registro de Preços'
        WHEN 10 THEN 'Edital'
        WHEN 11 THEN 'Outros tipos de documento'
        ELSE a.in_tipo END AS tx_tipo_artefato,
    CASE a.in_estado
        WHEN 1 THEN 'Excluído'					-- Comum a todos
        WHEN 2 THEN 'Rascunho'					-- Comum a todos
        WHEN 3 THEN 'Em Edição'					-- Comum a todos
        WHEN 4 THEN 'Concluído'					-- ETP, MR
        WHEN 5 THEN 'Publicado'					-- ETP, MR
        WHEN 6 THEN 'Em Andamento'				-- MR, DFD
        WHEN 7 THEN 'Devolvido'					-- DFD
        WHEN 8 THEN 'Aguardando Análise' 		-- DFD
        WHEN 9 THEN 'Aguardando Aprovação'		-- PC
        WHEN 10 THEN 'Aprovado'					-- PC, DFD
        WHEN 11 THEN 'Vinculado à contratação' 	-- DFD
        WHEN 12 THEN 'Reprovado' 				-- PC
    ELSE a.in_estado END AS tx_estado_artefato,
    a.id_artefato,
    a.nr_ano,
    a.id_uasg,
    a.in_estado,
    a.in_tipo,
    a.nm_uasg,
    a.id_unico,
    --a.bo_sigiloso,
    --a.bo_excluido,
    s.id_secao_artefato,
    s.nr_ordem AS nr_ordem_secao,
    s.no_secao_artefato,
    --i.in_obrigatorio AS in_obrigatorio_secao,
    s.dt_hora_operacao AS dt_operacao_secao,
    --s.id_operacao AS id_operacao_secao,
    --s.id_login_operacao AS id_login_secao,
    i.conteudo AS conteudo_secao,
    i.id_item_secao,
    i.nr_ordem AS nr_ordem_item,
    i.no_item,
    i.in_obrigatorio AS in_obrigatorio_item,
    i.dt_hora_operacao AS dt_operacao_item,
    i.id_operacao AS id_operacao_item,
    i.id_login_operacao AS id_login_item
FROM Comprasnet_faseinterna_VBL.artefato a
    JOIN Comprasnet_faseinterna_VBL.secao_artefato s ON a.id_artefato = s.id_artefato
    JOIN Comprasnet_faseinterna_VBL.item_secao i ON i.id_item_secao = s.id_secao_artefato
WHERE 1=1
    AND a.in_tipo = 10
    AND a.nr_ano IN (2024)