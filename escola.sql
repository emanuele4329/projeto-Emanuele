-- codigo para deletar banco de dados

DROP DATABASE IF EXISTS escola.sql;

--Padroes de variaveis
INT --variavel de numero inteiro
DECIMAL --variavel de numero decimal
VARCHAR --variavel para limitar numeros de caracteres
TEXT --variavel para texto longo
DATE --data no padrao (AAAA-MM-DD)
BOOLEAN --padrao para verdadeiro ou falso  (1 ou 0) 
ENUM --variavel para lista de valores possiveis 

--Definicao restritiva 
 PRIMARY Key --chave primaria
 AUTO_INCREMENT --tag de definicao automatica de valor de chave primaria
 NOT NULL --o campo como obrigatorio
 UNIQUE --definir o valor do campo como iunico
 DEFAULT --definir o valor padrao quando nao informado
 CHECK --definir regra de validacao do campo
 Foreign Key --chave para definir uma tabela na outra

 --tabela de professores
CREATE TABLE professores (
  id INT PRIMARY key AUTOINCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  data_nascimento DATE NOT NULL,
  salario DECIMAL DEFAULT 0.00,
  contratado DATE NOT NULL
  );

--TABELA DE ALUNOS
CREATE TABLE alunos (
  id INT PRIMARY key AUTOINCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  data_nascimento DATE NOT NULL,
  matricula DATE NOT NULL,
  ativo BOOLEAN DEFAULT 1
  );

  --TABELA DE CURSOS
  CREATE TABLE cursos (
id INT PRIMARY key AUTOINCREMENT,
nome VARCHAR(100) NOT NULL,
descricao TEXT,
carga horaria INT NOT NULL,
ativo  BOOLEAN DEFAULT 1,
nivel ENUM('basico', 'medio', 'avançado') NOT NULL,
professor_ministrante INT,
FOREIGN KEY (professor_ministrante) REFERENCES professor(id)
  );

  --tabela de matriculas
  CREATE TABLE matriculas (
  id INT PRIMARY key AUTOINCREMENT,
  aluno_id INT NOT NULL,
  curso_id INT NOT NULL,
  nota DECIMAL DEFAULT 0.00,
  data_matricula DATE NOT NULL,
  FOREIGN KEY (aluno_id) REFERENCES aluno(id)
  FOREIGN KEY (curso_id) REFERENCES curso(id)
  )

  --INSERIR PROFESSORES
INSERT INTO professores(nome, email, data_nascimento, salario, contratado, id) VALUES 
('Leid', 'leid@123', 2003-02-22, 7.000, 2025-02-23, 1 ),
('Marcio', 'marcio@123', 1980-08-12, 7.000, 2000-10-, 2 ),
('Bruno', 'bruno@123', 1987-02-22, 7.000, 2022-09-10, 3 ),
('Wemerson', 'wemerson@123', 2002-02-05, 7.000, 2024-03-14, 4 ),
('Rosana', 'rosana@123', 1995-02-22, 7.000, 2020-02-03, 5 );

--inserir cursos
INSERT INTO cursos (nome, descricao, carga_horaria, ativo, nivel, professor_ministrante) VALUES
('curso de Matematica', 'aaaaaaaa', 100, 1, 'avancado', 1),
('curso de Biologia', 'bbbbbbb', 50, 1, 'basico', 2),
('curso de Filosofia', 'ccccccc', 50, 1, 'basico', 3),
('curso de Sociologia', 'ddddddd', 50, 1, 'basico', 2),
('curso de Portugues', 'eeeeeeee', 100, 1, 'avancado', 5),
('curso de Educacao fisica', 'ffffffff', 80, 1, 'medio', 4),
('curso de Ingles', 'ggggggggg', 300, 1, 'avancado', 1),
('curso de Artes', 'hhhhhhhhhh', 80, 1, 'medio', 3);

--inserir alunos
INSERT INTO alunos (nome, email, data_nascimento, matricula, ativo, id) VALUES
('Emanuele', 'manu4329@gmail.com', '2009-06-04', '2025-01-20', 1, 1),
('Lerida', 'Lerida@gmail.com', '2010-01-01', '2025-01-20', 1, 2),
('Grazy', 'grazy@gmail.com', '2009-10-28', '2025-01-20', 1, 3),
('Eloisa', 'Eloisa@gmail.com', '2010-11-18', '2025-01-20', 1, 4),
('Debora', 'debora@gmail.com', '2010-03-12', '2025-01-20', 1, 5),
('isabeli', 'isabeli@gmail.com', '2010-03-09', '2025-01-20', 1, 6),
('cleber', 'cleber@gmail.com', '2009-12-01', '2025-01-20', 1, 7),
('ana cristina', 'anac@gmail.com', '2009-09-15', '2025-01-20', 1, 8),
('geovana', 'geovana@gmail.com', '2008-07-17', '2025-01-20', 1, 9),
('Davi', 'davi@gmail.com', '2008-04-24', '2025-01-20', 1, 10);

--inserir matricula
INSERT INTO matricula (aluno_id, curso_id, nota, data_matricula ) VALUES
(1, 1, '8.00', '2025-01-28'),
(2, 2, '7.00', '2024-02-09'),
(3, 3,'6.00', '2025-05-02'),
(4, 4, '5.00', '2023-08-09'),
(5, 5, '7.00', '2023-03-03'),
FOREIGN KEY (aluno_id) REFERENCES aluno(id)
FOREIGN KEY (curso_id) REFERENCES curso(id)
FOREIGN KEY (professor_ministrante) REFERENCES professor(id)
FOREIGN KEY (matriculas_id) REFERENCES matriculas(id)