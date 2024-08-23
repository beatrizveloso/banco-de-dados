create database cdSENAIQualifica;
use cdSENAIQualifica;
/*Criação de tabelas 
CREATE TABLE nomeTabela(
nmcoluna tipoDado contraintColuna constraintTabela,
nmcoluna tipoDado contraintColuna,
nmcoluna tipoDado contraintColuna,
nmcoluna tipoDado contraintColuna
);
onde : 
tipoDado pode ser :
int,char(), varchar(), decimal(), numeric(),date,time,
datetime, small datetime, bit
contraintColuna: not null, null, default, check, unique
constranintTabela: primary key, foreign key
*/

CREATE TABLE autor(
idAutor INT NOT NULL PRIMARY KEY,
nmAutor VARCHAR(50) NOT NULL
);

CREATE TABLE musica(
idMusica INT NOT NULL PRIMARY KEY,
nmMusica VARCHAR(50) NOT NULL,
duracao DECIMAL(4,2) NOT NULL
);

CREATE TABLE musicaAutor(
idMusica INT NOT NULL,
idAutor INT NOT NULL,
FOREIGN KEY(idMusica) REFERENCES musica (idMusica),
FOREIGN KEY(idAutor) REFERENCES autor (idAutor)
);

CREATE TABLE cdCategoria(
idCategoria INT NOT NULL PRIMARY KEY,
menorPreco DECIMAL(5,2) NOT NULL,
maiorPreco DECIMAL(6,2) NOT NULL
);

CREATE TABLE gravadora(
idGravadora INT NOT NULL PRIMARY KEY,
nmGravadora VARCHAR(50) NOT NULL,
endereco VARCHAR(100) NULL,
telefone NUMERIC(11,0) NOT NULL,
contatoDireto NUMERIC(11,0) NULL,
eMail VARCHAR(80) NULL
);

CREATE TABLE cd(
idCD INT NOT NULL PRIMARY KEY,
nmCD VARCHAR(50) NOT NULL,
idGravadora INT NOT NULL,
precoVenda DECIMAL(6,2) NOT NULL,
dtLancto DATE NOT NULL,
cdIndicado INT NOT NULL,
FOREIGN KEY(idGravadora) REFERENCES gravadora(idGravadora),
FOREIGN KEY(cdIndicado) REFERENCES cd(idCD)
);

CREATE TABLE faixa(
idCD INT NOT NULL,
idMusica INT NOT NULL,
nroFaixa INT NOT NULL PRIMARY KEY,
FOREIGN KEY(idCD) REFERENCES cd(idCD),
FOREIGN KEY(idMusica) REFERENCES musica(idMusica)
);

CREATE TABLE itemCD(
idCD INT NOT NULL,
idMusica INT NOT NULL,
nroFaixa INT NOT NULL,
FOREIGN KEY(idCD) REFERENCES cd(idCD),
FOREIGN KEY(idMusica) REFERENCES musica(idMusica),
FOREIGN KEY(nroFaixa) REFERENCES faixa(nroFaixa)
);



