/* conceitua: */

CREATE TABLE pagamento (
    cod_pagamento NUMERIC(5) PRIMARY KEY,
    valor FLOAT,
    nome_pagamento VARCHAR(50)
);

CREATE TABLE funcionario (
    cod_funcionario NUMERIC(5) PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(50),
    email VARCHAR(30),
    telefone VARCHAR(15),
    cargo VARCHAR(15),
    CPF VARCHAR(11),
    data_nasc DATE,
    situacao VARCHAR(10),
    salario FLOAT,
    login VARCHAR(10),
    senha VARCHAR(16)
);

CREATE TABLE vendas (
    data_venda DATE,
    cod_pagamento NUMERIC(5),
    valor_total FLOAT,
    cod_funcionario NUMERIC(5),
    cod_venda NUMERIC(5) PRIMARY KEY
);

CREATE TABLE estoque (
    cod_funcionario NUMERIC(5),
    cod_produto NUMERIC(5),
    quantidade INTEGER
);

CREATE TABLE fabricante (
    cod_fabricante NUMERIC(5) PRIMARY KEY,
    cod_funcionario NUMERIC(5),
    nome_fornecedor VARCHAR(15)
);

CREATE TABLE produto (
    cod_produto NUMERIC(5) PRIMARY KEY,
    cod_fabricante NUMERIC(5),
    cod_fornecedor NUMERIC(5),
    nome_produto VARCHAR(15),
    valor_compra FLOAT,
    valor_venda FLOAT,
    descricao VARCHAR(200),
    quantidade_min INTEGER
);

CREATE TABLE fornecedor (
    cod_fornecedor NUMERIC(5) PRIMARY KEY,
    cod_funcionario NUMERIC(5),
    CNPJ VARCHAR(14),
    nome_fantasia VARCHAR(20),
    endereco VARCHAR(20),
    email VARCHAR(30),
    site VARCHAR(30),
    tempo_entrega INTEGER,
    teleforne VARCHAR(15)
);
 
ALTER TABLE vendas ADD CONSTRAINT FK_vendas_1
    FOREIGN KEY (cod_pagamento) 
	REFERENCES pagamento (cod_pagamento);
	
ALTER TABLE vendas ADD CONSTRAINT FK_vendas_2
    FOREIGN KEY (cod_funcionario) 
	REFERENCES funcionario (cod_funcionario);
    
 
ALTER TABLE estoque ADD CONSTRAINT FK_estoque_1
    FOREIGN KEY (cod_funcionario) REFERENCES funcionario (cod_funcionario);

ALTER TABLE estoque ADD CONSTRAINT FK_estoque_2
    FOREIGN KEY (cod_produto) REFERENCES produto (cod_produto);
 
ALTER TABLE fabricante ADD CONSTRAINT FK_fabricante_2
    FOREIGN KEY (cod_funcionario) REFERENCES funcionario (cod_funcionario);
    
 
ALTER TABLE produto ADD CONSTRAINT FK_produto_2
    FOREIGN KEY (cod_fabricante) REFERENCES fabricante (cod_fabricante);
	
	
ALTER TABLE produto ADD CONSTRAINT FK_produto_3
    FOREIGN KEY (cod_fornecedor) REFERENCES fornecedor (cod_fornecedor);
 
ALTER TABLE fornecedor ADD CONSTRAINT FK_fornecedor_2
    FOREIGN KEY (cod_funcionario) REFERENCES funcionario (cod_funcionario);