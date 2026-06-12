-- =============================================================
-- SCRIPT DE CRIAÇÃO E MANIPULAÇÃO DO BANCO DE DADOS (SQL)
-- PROJETO DE EXTENSÃO: UFMS DIGITAL (95DX7.200525)
-- ESTUDANTE: RAQUEL DOS SANTOS SILVA
-- =============================================================

-- 1. ESTRUTURAÇÃO DAS TABELAS (DDL)

CREATE TABLE gatos (
    id_gato SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade_estimada VARCHAR(30) NOT NULL,
    status_saude VARCHAR(20) NOT NULL DEFAULT 'Para Adoção',
    CONSTRAINT chk_status CHECK (status_saude IN ('Para Adoção', 'Tratamento', 'Adotado'))
);

CREATE TABLE voluntarios (
    id_voluntario SERIAL PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    turno VARCHAR(15) NOT NULL,
    CONSTRAINT chk_turno CHECK (turno IN ('Manhã', 'Tarde', 'Noite'))
);

CREATE TABLE campanhas (
    id_campanha SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    meta_financeira DECIMAL(10,2) NOT NULL CHECK (meta_financeira > 0),
    data_limite DATE NOT NULL
);

CREATE TABLE doacoes (
    id_doacao SERIAL PRIMARY KEY,
    id_campanha INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    data_doacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_campanha FOREIGN KEY (id_campanha) 
        REFERENCES campanhas(id_campanha) ON DELETE CASCADE
);

-- 2. POPULAÇÃO E MANIPULAÇÃO DE DADOS (DML)

INSERT INTO gatos (nome, idade_estimada, status_saude) VALUES 
('Mingau', '6 meses', 'Para Adoção'),
('Frajola', '1 ano', 'Tratamento'),
('Luna', '2 anos', 'Adotado');

INSERT INTO voluntarios (nome_completo, dia_semana, turno) VALUES 
('Ana Costa', 'Sábado', 'Manhã'),
('Carlos Souza', 'Segunda-feira', 'Noite');

INSERT INTO campanhas (titulo, meta_financeira, data_limite) VALUES 
('Cirurgia do Gato Frajola', 1500.00, '2026-07-15'),
('Ração para o Mês de Julho', 3000.00, '2026-06-30');

INSERT INTO doacoes (id_campanha, valor) VALUES 
(1, 500.00),
(1, 700.00),
(2, 750.00);

-- 3. CONSULTA DE TRANSPARÊNCIA (RELATÓRIO FINANCEIRO)
SELECT 
    c.titulo,
    c.meta_financeira,
    COALESCE(SUM(d.valor), 0) AS total_arrecadado,
    ROUND((COALESCE(SUM(d.valor), 0) / c.meta_financeira) * 100, 2) AS percentual_progresso
FROM campanhas c
LEFT JOIN doacoes d ON c.id_campanha = d.id_campanha
GROUP BY c.id_campanha, c.titulo, c.meta_financeira;
