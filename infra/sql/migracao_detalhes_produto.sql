-- Tabelas usadas por src/model/Produto.ts que faltavam no init.sql.
-- Pode ser executado em um banco já criado (não apaga dados).

CREATE TABLE IF NOT EXISTS detalhes_produto (
    id_produto             INTEGER         PRIMARY KEY REFERENCES produtos(id_produto) ON DELETE CASCADE,
    marca                  VARCHAR(100),
    genero                 VARCHAR(50),
    esporte                VARCHAR(100),
    modalidade             VARCHAR(100),
    faixa_etaria           VARCHAR(50),
    linha                  VARCHAR(100),
    preco_anterior         NUMERIC(10,2)   CHECK (preco_anterior >= 0),
    desconto               NUMERIC(5,2)    DEFAULT 0 CHECK (desconto >= 0),
    parcelas               INTEGER         DEFAULT 1 CHECK (parcelas >= 1),
    avaliacao              NUMERIC(3,2)    DEFAULT 0 CHECK (avaliacao >= 0 AND avaliacao <= 5),
    quantidade_avaliacoes  INTEGER         DEFAULT 0 CHECK (quantidade_avaliacoes >= 0),
    promocao               BOOLEAN         DEFAULT FALSE,
    destaque               BOOLEAN         DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS variacoes_produto (
    id_variacao  SERIAL       PRIMARY KEY,
    id_produto   INTEGER      NOT NULL REFERENCES produtos(id_produto) ON DELETE CASCADE,
    cor          VARCHAR(50),
    tamanho      VARCHAR(20),
    estoque      INTEGER      NOT NULL DEFAULT 0 CHECK (estoque >= 0),
    UNIQUE (id_produto, cor, tamanho)
);

CREATE TABLE IF NOT EXISTS caracteristicas_produto (
    id_caracteristica  SERIAL        PRIMARY KEY,
    id_produto         INTEGER       NOT NULL REFERENCES produtos(id_produto) ON DELETE CASCADE,
    nome               VARCHAR(100)  NOT NULL,
    valor              VARCHAR(255)  NOT NULL
);
