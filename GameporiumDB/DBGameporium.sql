DROP DATABASE IF EXISTS GameporiumDB;
CREATE DATABASE GameporiumDB;
USE GameporiumDB;

DROP TABLE IF EXISTS prodotto;
USE GameporiumDB;
CREATE TABLE prodotto (
	codiceProdotto 	int,
    codiceCategoria int,
    foto			varchar(100),
    titolo			varchar(30),
    disponibilita	int,
    prezzo			decimal(5,2),
    produttore		varchar(30),
    descrizione		varchar(1000),
    IVA				numeric,
    novita			bool default null,
    offerta 		bool default null,
    primary key (codiceProdotto, codiceCategoria)
);

DROP TABLE IF EXISTS cliente;
USE GameporiumDB;
CREATE TABLE cliente(
	dataNascita		date,
    nome			varchar(20),
    cognome			varchar(30),
    username		varchar(15),
    passwordU		varchar(20),
    recapito		varchar(30),
    primary key(username)
);


DROP TABLE IF EXISTS gioco;
USE GameporiumDB;
CREATE TABLE gioco(
	codiceProdotto	int, 
	nomeCategoria	varchar(15),
    descrizioneCategoria	varchar(100),
    durata			varchar(10),
    etaConsigliata	int,
    numGiocatori	varchar(10),
    foreign key (codiceProdotto) references prodotto(codiceProdotto)
								ON UPDATE CASCADE
                                ON DELETE CASCADE
);

DROP TABLE IF EXISTS accessorio;
USE GameporiumDB;
CREATE TABLE accessorio(
	codiceProdotto	int, 
	nomeCategoria 	varchar(15),
    descrizioneCategoria	varchar(100),
    foreign key (codiceProdotto) references prodotto(codiceProdotto)
								ON UPDATE CASCADE
                                ON DELETE CASCADE
);

DROP TABLE IF EXISTS recensione;
USE GameporiumDB;
CREATE TABLE recensione(
	username	varchar(16),
    codiceProdotto	int,
    testo			varchar(200),
    foreign key (codiceProdotto) references prodotto (codiceProdotto)
								ON UPDATE CASCADE
                                ON DELETE CASCADE,
    foreign key (username) references cliente (username)
								ON UPDATE CASCADE
                                ON DELETE CASCADE);

DROP TABLE IF EXISTS evento;
USE GameporiumDB;
CREATE TABLE evento(
	codiceEvento	int,
    nome			varchar(20),
    luogo			varchar(50),
    descrizione		varchar(100),
    dataEvento		date,
    ora				time,
    numeroPartecipanti int default 0,
    primary key (codiceEvento)
);

DROP TABLE IF EXISTS partecipazione;
USE GameporiumDB;
CREATE TABLE partecipazione(
	codiceEvento	int,
    username	varchar(16),
    foreign key (username) references cliente (username)
								ON UPDATE CASCADE
                                ON DELETE CASCADE,
	foreign key (codiceEvento) references evento (codiceEvento)
								ON UPDATE CASCADE
                                ON DELETE CASCADE
);


DROP TABLE IF EXISTS ordine;
USE GameporiumDB;
CREATE TABLE ordine(
	codiceOrdine	int,
    indirizzoSpedizione	varchar(50),
    tipoSpedizione	varchar(15),
    dataSpedizione	date,
    codiceSpedizione	int,
    codicePagamento	int references pagamento(codicePagamento),
    importo			numeric,
    metodo			varchar(20),
    indirizzoFatturazione	varchar (50),
    primary key (codiceOrdine)
);

DROP TABLE IF EXISTS corriere;
USE GameporiumDB;
CREATE TABLE corriere(
	codiceCorriere	int,
    costoSpedizione	numeric,
    nome			varchar(15),
    primary key(codiceCorriere)
);

DROP TABLE IF EXISTS effettua;
USE GameporiumDB;
CREATE TABLE effettua(
	username	varchar(16),
    codiceOrdine	int,
    foreign key(username) references cliente(username)
								ON UPDATE CASCADE
								ON DELETE CASCADE
);

DROP TABLE IF EXISTS amministratore;
USE GameporiumDB;
CREATE TABLE amministratore(
	CF				varchar(16),
    dataNascita		date,
    nome			varchar(20),
    cognome			varchar(30),
    username		varchar(15),
    passwordU		varchar(20),
    recapito		varchar(30),
    cap				int,
    via				varchar(40),
    provincia		varchar(2),
    primary key(CF)
);

DROP TABLE IF EXISTS composizione;
USE GameporiumDB;
CREATE TABLE composizione(
	codiceOrdine int,
    codiceProdotto int,
    quantita int,
    foreign key (codiceProdotto) references prodotto (codiceProdotto)
								ON UPDATE CASCADE
                                ON DELETE CASCADE,
    foreign key (codiceOrdine) references ordine (codiceOrdine)
								ON UPDATE CASCADE
                                ON DELETE CASCADE);

