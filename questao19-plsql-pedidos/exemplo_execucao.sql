-- ============
-- TESTE 1: Lista completa (sem filtros opcionais)
-- ============
SELECT * FROM buscar_pedidos_dinamico('2025-06-01', '2025-06-30');

-- ============
-- TESTE 2: Filtro por cliente e status
-- ============
SELECT * FROM buscar_pedidos_dinamico('2025-06-01', '2025-06-30', 101, 'PENDENTE');

-- ============
-- TESTE 3: Agrupado por categoria
-- ============
SELECT * FROM buscar_pedidos_dinamico('2025-06-01', '2025-06-30', NULL, NULL, 'CATEGORIA');
