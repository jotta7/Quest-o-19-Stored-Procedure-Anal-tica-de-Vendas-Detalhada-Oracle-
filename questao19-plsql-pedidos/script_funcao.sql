
-- ============
-- FUNÇÃO COM SQL DINÂMICO E AGREGAÇÃO OPCIONAL
-- ============
CREATE OR REPLACE FUNCTION buscar_pedidos_dinamico(
    p_data_inicio DATE,
    p_data_fim DATE,
    p_id_cliente INTEGER DEFAULT NULL,
    p_status TEXT DEFAULT NULL,
    p_agrupar_por TEXT DEFAULT NULL
)
RETURNS TABLE (resultado TEXT) AS $$
DECLARE
    v_sql TEXT;
BEGIN
    -- Começa com a base da consulta
    v_sql := 'SELECT ';

    -- Define se vai agregar ou listar
    IF p_agrupar_por = 'CATEGORIA' THEN
        v_sql := v_sql || 'categoria_produto, SUM(valor_total) AS total FROM pedidos';
    ELSIF p_agrupar_por = 'CANAL' THEN
        v_sql := v_sql || 'canal_venda, SUM(valor_total) AS total FROM pedidos';
    ELSE
        v_sql := v_sql || 'id, data_pedido, id_cliente, status, valor_total FROM pedidos';
    END IF;

    -- Começa o WHERE com datas obrigatórias
    v_sql := v_sql || ' WHERE data_pedido BETWEEN ' || quote_literal(p_data_inicio) || ' AND ' || quote_literal(p_data_fim);

    -- Adiciona filtros opcionais
    IF p_id_cliente IS NOT NULL THEN
        v_sql := v_sql || ' AND id_cliente = ' || p_id_cliente;
    END IF;
    IF p_status IS NOT NULL THEN
        v_sql := v_sql || ' AND status = ' || quote_literal(p_status);
    END IF;

    -- Adiciona GROUP BY se for agregado
    IF p_agrupar_por = 'CATEGORIA' THEN
        v_sql := v_sql || ' GROUP BY categoria_produto';
    ELSIF p_agrupar_por = 'CANAL' THEN
        v_sql := v_sql || ' GROUP BY canal_venda';
    END IF;

    -- Exibe a consulta montada (debug)
    RAISE NOTICE 'Consulta: %', v_sql;

    -- Executa a query e retorna linha por linha como texto
    RETURN QUERY EXECUTE 'SELECT row_to_json(t)::text FROM (' || v_sql || ') t';
END;
$$ LANGUAGE plpgsql;

