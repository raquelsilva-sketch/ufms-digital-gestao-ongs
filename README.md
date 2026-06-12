# Sistema Web de Gestão e Capacitação de Recursos para ONGs (UFMS Digital)

Este repositório documenta e armazena os artefatos de software desenvolvidos para o **Programa de Extensão UFMS Digital**, sob o registro **95DX7.200525**.

## 👤 Identificação do Estudante
* Nome Completo: Raquel dos Santos Silva
* Curso: Tecnologia da Informação
* Disciplina: Projeto Integrador de Tecnologia da Informação III
* Semestre Letivo: 2026.1
* Público-alvo: Voluntários e Gestores de ONGs de Proteção Animal
* Local de Realização: Campo Grande - MS

---

## 💾 Arquitetura e Banco de Dados (SQL)
O sistema conta com um banco de dados relacional totalmente normalizado para mitigar redundâncias e garantir a integridade referencial. O script físico completo com as restrições (`PRIMARY KEY`, `FOREIGN KEY`, `CHECK`) pode ser consultado no arquivo [`banco_de_dados.sql`](./banco_de_dados.sql).

### Entidades Mapeadas:
* Gatos: Controle de identificação e acompanhamento clínico dos felinos abrigados.
* Voluntários: Gestão e automação de escalas semanais de trabalho na instituição.
* Campanhas: Fixação de metas orçamentárias transparentes para procedimentos veterinários.
* Doações: Histórico de transações financeiras vinculadas diretamente a uma campanha ativa.

---

## 📈 Histórico de Modificações do Projeto (Registro de Commits Git)

A evolução deste projeto seguiu as boas práticas de gerência de configuração utilizando controle de versão distribuído (Git). Abaixo consta a tabela com o histórico cronológico de modificações injetadas no sistema:

| Hash/Identificador | Categoria (Padrão Semântico) | Descrição Completa da Alteração Realizada | Artefato Afetado |
| :--- | :--- | :--- | :--- |
| `init-repo` | `feat` | Inicialização do repositório Git local e estruturação das pastas do projeto. | Estrutura de Diretórios |
| `add-ui-mvp` | `feat` | Implementação da interface responsiva usando HTML5 semântico e Tailwind CSS. | `index.html` |
| `fix-layout-mobile` | `fix` | Ajuste de padding nas barras de progresso financeiras para telas móveis. | `index.html` |
| `doc-requirements` | `docs` | Escrita e revisão dos requisitos funcionais mapeados para o terceiro setor. | `README.md` |
| `db-ddl-schema` | `feat` | Criação do esquema lógico do banco de dados e tabelas relacionais em SQL. | `banco_de_dados.sql` |
| `db-dml-queries` | `feat` | Inserção de massa de testes e criação da query de cálculo de percentual de metas. | `banco_de_dados.sql` |
| `final-release` | `docs` | Consolidação do arquivo README com instruções de uso e relatórios acadêmicos. | `README.md` |

---

## 🚀 Como Executar os Artefatos
1. Interface Web: Baixe o arquivo `index.html` e execute-o diretamente em qualquer navegador web para testar a reatividade de forma local.
2. Banco de Dados: Importe o arquivo `banco_de_dados.sql` em um sistema gerenciador de banco de dados (SGBD) compatível com padrão ANSI SQL (como PostgreSQL ou MySQL) para recriar as tabelas e relatórios.
