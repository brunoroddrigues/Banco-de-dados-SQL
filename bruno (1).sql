CREATE TABLE forma_pagamento (
  idforma_pagamento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descritivo VARCHAR(80) NULL,
  PRIMARY KEY(idforma_pagamento)
);

CREATE TABLE produto (
  idproduto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NULL,
  descricao TEXT NULL,
  caracteristica TEXT NULL,
  preco FLOAT NULL,
  PRIMARY KEY(idproduto)
);

CREATE TABLE usuario (
  idusuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome INTEGER UNSIGNED NULL,
  email VARCHAR(100) NULL,
  senha VARCHAR(100) NULL,
  tipo VARCHAR(30) NULL,
  PRIMARY KEY(idusuario)
);

CREATE TABLE arte_marcial (
  idarte_marcial INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NULL,
  descricao TEXT NULL,
  historia TEXT NULL,
  beneficio TEXT NULL,
  respeito TEXT NULL,
  PRIMARY KEY(idarte_marcial)
);

CREATE TABLE tamanho (
  idtamanho INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idproduto INTEGER UNSIGNED NOT NULL,
  descritivo VARCHAR(80) NULL,
  PRIMARY KEY(idtamanho),
  INDEX tamanho_FKIndex1(idproduto),
  FOREIGN KEY(idproduto)
    REFERENCES produto(idproduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE comentario (
  idcomentario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idproduto INTEGER UNSIGNED NOT NULL,
  comentario TEXT NULL,
  PRIMARY KEY(idcomentario),
  INDEX comentario_FKIndex1(idproduto),
  FOREIGN KEY(idproduto)
    REFERENCES produto(idproduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE cliente (
  idcliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idusuario INTEGER UNSIGNED NOT NULL,
  cpf VARCHAR(15) NULL,
  celular VARCHAR(20) NULL,
  logradouro VARCHAR(100) NULL,
  numero VARCHAR(10) NULL,
  bairro VARCHAR(80) NULL,
  cep VARCHAR(15) NULL,
  cidade VARCHAR(100) NULL,
  uf VARCHAR(2) NULL,
  PRIMARY KEY(idcliente),
  INDEX cliente_FKIndex1(idusuario),
  FOREIGN KEY(idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE imagem_arte (
  idimagem_arte INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idarte_marcial INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(100) NULL,
  path VARCHAR(100) NULL,
  PRIMARY KEY(idimagem_arte),
  INDEX imagem_arte_FKIndex1(idarte_marcial),
  FOREIGN KEY(idarte_marcial)
    REFERENCES arte_marcial(idarte_marcial)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE venda (
  idvenda INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idusuario INTEGER UNSIGNED NOT NULL,
  idforma_pagamento INTEGER UNSIGNED NOT NULL,
  data_venda DATE NULL,
  PRIMARY KEY(idvenda),
  INDEX venda_FKIndex1(idforma_pagamento),
  INDEX venda_FKIndex2(idusuario),
  FOREIGN KEY(idforma_pagamento)
    REFERENCES forma_pagamento(idforma_pagamento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE itens (
  iditens INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idproduto INTEGER UNSIGNED NOT NULL,
  idvenda INTEGER UNSIGNED NOT NULL,
  quantidade INTEGER UNSIGNED NULL,
  preco_unitario FLOAT NULL,
  PRIMARY KEY(iditens),
  INDEX itens_FKIndex1(idvenda),
  INDEX itens_FKIndex2(idproduto),
  FOREIGN KEY(idvenda)
    REFERENCES venda(idvenda)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idproduto)
    REFERENCES produto(idproduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE produto_arte (
  idproduto_arte INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idarte_marcial INTEGER UNSIGNED NOT NULL,
  idproduto INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idproduto_arte),
  INDEX produto_arte_FKIndex1(idproduto),
  INDEX produto_arte_FKIndex2(idarte_marcial),
  FOREIGN KEY(idproduto)
    REFERENCES produto(idproduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idarte_marcial)
    REFERENCES arte_marcial(idarte_marcial)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


