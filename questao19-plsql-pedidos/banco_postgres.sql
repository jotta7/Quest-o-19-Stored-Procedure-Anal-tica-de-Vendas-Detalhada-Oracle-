-- ===============================
-- QUESTÃO 19 - VERSÃO POSTGRESQL
-- ===============================
-- Esta é a versão adaptada da procedure dinâmica para PostgreSQL (PLpgSQL)
-- Para uso em plataformas como Heroku, Render, ElephantSQL, etc.

-- ============
-- ESTRUTURA DA TABELA DE PEDIDOS
-- ============
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    data_pedido DATE NOT NULL,
    id_cliente INTEGER,
    status VARCHAR(20),
    categoria_produto VARCHAR(50),
    canal_venda VARCHAR(50),
    valor_total NUMERIC(12,2)
);

-- ============
-- DADOS DE EXEMPLO
-- ============
INSERT INTO pedidos (data_pedido, id_cliente, status, categoria_produto, canal_venda, valor_total)
VALUES 
('2025-06-01', 101, 'PENDENTE', 'ELETRONICO', 'ONLINE', 1000.00),
('2025-06-02', 102, 'CONCLUIDO', 'ROUPAS', 'LOJA', 300.00),
('2025-06-03', 101, 'PENDENTE', 'ELETRONICO', 'ONLINE', 1500.00);
