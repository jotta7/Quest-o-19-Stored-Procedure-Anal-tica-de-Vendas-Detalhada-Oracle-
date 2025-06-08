# 📦 Questão 19 – Procedure Dinâmica em PostgreSQL

Este projeto apresenta a adaptação da Questão 19 (originalmente em PLSQL Oracle) para PostgreSQL (PLpgSQL). O objetivo é demonstrar o uso de SQL dinâmico com filtros opcionais e agrupamento variável, com possibilidade de deploy em plataformas como Render, Heroku ou Railway.

---

## 🎯 Objetivo

- Criar uma função dinâmica que filtre pedidos por
  - Intervalo de datas obrigatório
  - Cliente (opcional)
  - Status (opcional)
  - Nível de agregação opcional (por categoria de produto ou canal de venda)

---

## 🧠 Conceitos aplicados

- SQL Dinâmico com `EXECUTE`
- Função com parâmetros opcionais (`DEFAULT NULL`)
- Montagem segura da query (`quote_literal`, `format`, etc.)
- Agrupamento condicional (`GROUP BY` dinâmico)
- Retorno de resultados como `JSON` (simples para testar ou usar em API)

---

## 🗂️ Arquivos

 Arquivo                   Descrição                                      
-------------------------------------------------------------------------
 `script_funcao.sql`       Criação da tabela, inserts e função dinâmica  
 `exemplo_execucao.sql`    Exemplos de uso da função                     
 `banco_postgres.sql`      (Opcional) Estrutura completa da base         

---

## ▶️ Como testar

Você pode usar

- [Render.com](httpsrender.com) (PostgreSQL gratuito)
- [ElephantSQL](httpswww.elephantsql.com)
- [Railway.app](httpsrailway.app)
- Localhost com `psql`

Ou execute online usando [httpspgweb-demo.herokuapp.com](httpspgweb-demo.herokuapp.com) (editor PostgreSQL na web)

---

## ✅ Exemplos de uso

### 1. Buscar pedidos entre datas (sem filtros adicionais)
```sql
SELECT  FROM buscar_pedidos_dinamico('2025-06-01', '2025-06-30');
```

### 2. Filtrar por cliente e status
```sql
SELECT  FROM buscar_pedidos_dinamico('2025-06-01', '2025-06-30', 101, 'PENDENTE');
```

### 3. Agregar por categoria
```sql
SELECT  FROM buscar_pedidos_dinamico('2025-06-01', '2025-06-30', NULL, NULL, 'CATEGORIA');
```

---

## 🌟 Bônus 1 – Agregação opcional

A função aceita um parâmetro `p_agrupar_por` com os valores
- `'CATEGORIA'` → agrupa por `categoria_produto`
- `'CANAL'` → agrupa por `canal_venda`
- `NULL` → sem agregação (detalhado por pedido)

Isso permite alternar entre diferentes visões dos dados com o mesmo código.

---

## 🚀 Bônus 2 – Considerações de performance

- Índices recomendados
  - `data_pedido`
  - `id_cliente`
  - `status`

- Em casos de uso frequente de agregações
  - Criar visões materializadas por categoria ou canal pode melhorar performance
  - Usar tabelas temporárias para pré-processamento em consultas mais pesadas

---

## 👨‍💻 Autor

- Nome _Seu Nome Aqui_
- GitHub [github.comseu-usuario](httpsgithub.comseu-usuario)

---

## 📄 Licença

MIT – uso livre para fins acadêmicos e profissionais.
