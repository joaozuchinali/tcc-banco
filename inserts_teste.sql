# Querys sql para popular o banco de dados com registros de teste

#INSERT INTO credencial (nome) VALUES ('User');
#INSERT INTO credencial (nome) VALUES ('Admin');
#INSERT INTO credencial (nome) VALUES ('Super Admin');

#INSERT INTO projetostatus (nome) VALUES ('Ativo');
#INSERT INTO projetostatus (nome) VALUES ('Inativo');

#INSERT INTO equipestatus (nome) VALUES ('Ativo');
#INSERT INTO equipestatus (nome) VALUES ('Inativo');

#INSERT INTO usuariostatus (nome) VALUES ('Ativo');
#INSERT INTO usuariostatus (nome) VALUES ('Inativo');

#INSERT INTO equipe (nome, idstatus) VALUES ('testes', 1);

#INSERT INTO projeto (nome, identificador, codigo, idequipe, idstatus) VALUES ('teste', 'AAABBBCCC', 123456, 1, 1);

#INSERT INTO usuario (nome, senha, email, idstatus) VALUES ("usuario teste", "123456", "user@mail.com", 1);

#INSERT INTO equipeuso (idcredencial, idequipe, idusuario) VALUES (1, 1, 1);
#INSERT INTO equipeuso (idcredencial, idequipe, idusuario) VALUES (1, 2, 1);
#INSERT INTO equipeuso (idcredencial, idequipe, idusuario) VALUES (1, 3, 1);

# INSERT INTO registronavegacao (`acesso`, `dominio`, `anonimo`, `titulo`, `url`, `favicon`, `width`, `height`, `useragent`, `appversion`, `contype`, `idusopesquisados`, `idprojeto`) VALUES ();