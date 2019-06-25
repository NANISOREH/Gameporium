DROP DATABASE IF EXISTS GameporiumDB;
CREATE DATABASE GameporiumDB;
ALTER DATABASE GameporiumDB character set utf8 collate utf8_general_ci;
USE GameporiumDB;
DROP TABLE IF EXISTS prodotto;
USE GameporiumDB;
CREATE TABLE prodotto (
    codiceProdotto  int,
    codiceCategoria int,
    foto            varchar(100),
    titolo          varchar(100),
    disponibilita   int,
    prezzo          decimal(5,2),
    produttore      varchar(30),
    descrizione     varchar(1000),
    IVA             numeric,
    novita          bool default null,
    offerta         bool default null,
    primary key (codiceProdotto, codiceCategoria),
    FULLTEXT(titolo, produttore,descrizione)
);

DROP TABLE IF EXISTS cliente;
USE GameporiumDB;
CREATE TABLE cliente(
    nome            varchar(20),
    cognome         varchar(30),
    username        varchar(15),
    passwordU       varchar(20),
    recapito        varchar(30),
    cartaPred       bigint references metodoPagamento (numCarta),
    primary key(username)
);


DROP TABLE IF EXISTS gioco;
USE GameporiumDB;
CREATE TABLE gioco(
    codiceProdotto  int, 
    nomeCategoria   varchar(15),
    descrizioneCategoria    varchar(100),
    durata          varchar(10),
    etaConsigliata  int,
    numGiocatori    varchar(10),
    foreign key (codiceProdotto) references prodotto(codiceProdotto)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
    FULLTEXT (nomeCategoria, descrizioneCategoria)
);

DROP TABLE IF EXISTS accessorio;
USE GameporiumDB;
CREATE TABLE accessorio(
    codiceProdotto  int, 
    nomeCategoria   varchar(15),
    descrizioneCategoria    varchar(100),
    foreign key (codiceProdotto) references prodotto(codiceProdotto)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
    FULLTEXT (nomeCategoria, descrizioneCategoria)
);

DROP TABLE IF EXISTS recensione;
USE GameporiumDB;
CREATE TABLE recensione(
    username    varchar(16),
    codiceProdotto  int,
    testo           varchar(200),
    foreign key (codiceProdotto) references prodotto (codiceProdotto)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
    foreign key (username) references cliente (username)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE);

DROP TABLE IF EXISTS evento;
USE GameporiumDB;
CREATE TABLE evento(
    codiceEvento    int,
    nome            varchar(20),
    luogo           varchar(50),
    descrizione     varchar(100),
    dataEvento      date,
    ora             time,
    numeroPartecipanti int default 0,
    locandina       varchar(20),
    primary key (codiceEvento),
    FULLTEXT(nome, luogo, descrizione)
);

DROP TABLE IF EXISTS partecipazione;
USE GameporiumDB;
CREATE TABLE partecipazione(
    codiceEvento    int,
    username    varchar(16),
    foreign key (username) references cliente (username)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
    foreign key (codiceEvento) references evento (codiceEvento)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE
);

DROP TABLE IF EXISTS indirizzo;
USE GameporiumDB;
CREATE TABLE indirizzo(
    codiceIndirizzo int,
    citta varchar(20),
    via varchar(30),
    civico int,
    cap int,
    primary key (codiceIndirizzo)
    );
    
DROP TABLE IF EXISTS metodoPagamento;
USE GameporiumDB;
CREATE TABLE   metodoPagamento(
    circuito    char(20),
    numCarta    bigint,
    cvv  int,
    scadenza varchar(7),
    primary key(numCarta)
    );
    
DROP TABLE IF EXISTS spedizione;
USE GameporiumDB;
CREATE TABLE spedizione(
    username    varchar(16),
    codiceIndirizzo int,
    testo           varchar(200),
    foreign key (codiceIndirizzo) references indirizzo (codiceIndirizzo)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
    foreign key (username) references cliente (username)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE);
                                
/*DROP TABLE IF EXISTS pagamento;
USE GameporiumDB;
CREATE TABLE pagamento(
    username    varchar(16),
    codiceP     int,
    foreign key (codiceP) references mod_Pagamento (codiceP)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
    foreign key (username) references cliente (username)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE);*/
                                
DROP TABLE IF EXISTS possiede;
USE GameporiumDB;
CREATE TABLE possiede(
    username varchar(16),
    numCarta bigint,
    foreign key (numCarta) references metodoPagamento(numCarta)
                                    ON UPDATE CASCADE
                                    ON DELETE CASCADE,
    foreign key(username) references cliente(username)
                                    ON UPDATE CASCADE
                                    ON DELETE CASCADE);


DROP TABLE IF EXISTS ordine;
USE GameporiumDB;
CREATE TABLE ordine(
    codiceOrdine    int,
    indirizzoSpedizione varchar(50) references indirizzo(codiceIndirizzo),
    dataOrdine      date,
    dataSpedizione  date,
    importo         decimal(5,2),
    statoProdotti   varchar (1000),
    metodo          bigint references metodoPagamento(numCarta),
    primary key (codiceOrdine)
);

DROP TABLE IF EXISTS corriere;
USE GameporiumDB;
CREATE TABLE corriere(
    codiceCorriere  int,
    costoSpedizione numeric,
    nome            varchar(15),
    primary key(codiceCorriere)
);

DROP TABLE IF EXISTS effettua;
USE GameporiumDB;
CREATE TABLE effettua(
    username    varchar(16),
    codiceOrdine    int,
    foreign key(username) references cliente(username)
                                ON UPDATE CASCADE
                                ON DELETE CASCADE
);

DROP TABLE IF EXISTS amministratore;
USE GameporiumDB;
CREATE TABLE amministratore(
    dataNascita     date,
    nome            varchar(20),
    cognome         varchar(30),
    username        varchar(15),
    passwordU       varchar(20),
    recapito        varchar(30),
    primary key(username)
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