INSERT INTO cliente(nome,cognome,dataNascita,username,passwordU,recapito) VALUES
	('Sara','Corrente','1990/01/10','Brontolo','Pippo','3394004520'),
	('Fabiana','Gatto','1992/06/11','Cucciolo','Pluto','3384596321'),
    ('Vincenzo','Monzo','1990/08/22','Mammolo','Topolino','3384558321'),
    ('Maria','De Luca','1995/02/01','Pisolo','Minnie','3849675843'),
    ('Giovanni','Chiariello','1993/04/24', 'Eolo','ZioPaperone','3397835226'),
    ('Andrea','Palladino','1992/08/05','Dotto','Qui','3569472315'),
    ('Carmela','Volpe','1989/11/30','Gongolo','Quo','3896475147'),
    ('Claudia','Torre','1989/06/20','Aramis','Qua','3336244859'),
    ('Francesco','Perozziello','1992/02/26','Portos','Paperina','3329957128'),
    ('Michela','De Lucia','1992/10/09','Athos','Paperino','3694752198');
    
INSERT INTO amministratore(CF,nome,cognome,dataNascita,username,passwordU,recapito,via,cap,provincia) VALUES
	('SSTCNA70A01Y123Z','Caino','Savastano','1970/01/01','Broslayer','hostatoio','123456789','Via dall Eden', 12345, 'TB');
    
INSERT INTO corriere(codiceCorriere, costoSpedizione,nome) VALUES
	(001, 5, 'BRT'),
    (002, 3,'SDA'),
    (003, 10,'TNT'),
    (004, 5.5,'GLS'),
    (005, 7, 'UPS');
    
INSERT INTO evento(codiceEvento,nome,luogo,descrizione,dataEvento,ora,numeroPartecipanti) VALUES
	(001, 'Fantaexpo','Parco dell Irno, SA','Torneo di Pokèmon GDC','2019/09/03','15:00:00',3),
    (002, 'Cavacon', 'Mediateca Marte, Cava de Tirreni, SA', 'Giochi da tavolo','2020/01/06','10:00:00',7),
    (003, 'Isola di Illyon','Mostra d oltre Mare, Campi Flegrei, NA','Giochi di Ruolo','2020/04/28','12:00:00',16);
    
INSERT INTO prodotto(codiceProdotto, codiceCategoria, foto,titolo,disponibilita,prezzo,produttore,descrizione,IVA,novita,offerta) VALUES
	(0001, 01,'','Imagine',8,20,'Oliphante','blablabla',22,false,false),
	(0002, 01,'','Dungeons & Dragons', 15, 40,'Wizard of the coast','blablabla',22,false,true),
    (0003, 02,'','Miniatura soldato',6,15,'Scalpello','blablabla',22,true,true),
    (0004, 02,'','Set dadi',30, 12,'Chessex','blablabla',22,true,false),
    (0005, 01,'','Magic',50, 10,'Wizard of the coast','blablabla',22,false,false),
    (0006, 01,'','Voodoo', 4, 15, 'Red Glove','blablabla',22,false,true),
    (0007, 01,'','Taboo', 5, 25, 'Milton Bradely','blablabla',22,true,true),
    (0008, 01,'','Risiko', 11, 30, 'Editrice Giochi','blablabla',22,false,false),
    (0009, 02,'','Torre lancia dadi',3, 35, 'Ravensburger','blablabla',22,true,false),
    (0010, 02,'','Album porta carte', 20, 12, 'Wizard of the coast', 'blablabla',22,false,false);
    
INSERT INTO accessorio(nomeCategoria, descrizioneCategoria,codiceProdotto) VALUES
	('Accessorio','Miniatura',0003),
    ('Accessorio','Accessori per giochi di ruolo',0004),
    ('Accessorio','Accessori per giochi di ruolo',0009),
    ('Accessorio','Accessori per giochi di carte',0010);
    
INSERT INTO gioco (codiceProdotto,nomeCategoria,descrizioneCategoria,durata,etaConsigliata,numgiocatori) VALUES
	(0001,'Gioco','Gioco da tavolo','variabile',6,'2+'),
    (0002,'Gioco','Gioco di ruolo','variabile',14,'2+'),
    (0005,'Gioco','Gioco di carte','60\'',12,'2'),
    (0006,'Gioco','Gioco da tavolo','90\'',16,'4-8'),
    (0007,'Gioco','Gioco da tavolo','30\'',14,'4+'),
    (0008,'Gioco','Gioco da tavolo','120\'',14,'2-4');

INSERT INTO ordine(codiceOrdine,indirizzoSpedizione,tipoSpedizione,dataSpedizione,codiceSpedizione,codicePagamento,importo,metodo,indirizzoFatturazione) VALUES
	(00001,'Via Paolo Uccello 8','Raccomandata','2019/07/05',0010,1,15.3, 'Carta di credito','Via Paolo Uccello 8'),
    (00002,'Via Podgora 4','Prioritaria','2019/06/22',0011,2,35, 'Bonifico','Via Uguale 0'),
    (00003,'Via Lemure 88','Celere','2019/05/08',0022,3,28, 'Paypal', 'Corso Umberto 27');
    
    
INSERT INTO effettua(username,codiceOrdine) VALUES
	('Brontolo',00001),
    ('Athos',00002),
    ('Eolo',00003);
    
INSERT INTO partecipazione(codiceEvento,username) VALUES
	(001,'Portos'),
    (001,'Athos'),
    (002,'Cucciolo'),
    (002,'Gongolo'),
    (001,'Gongolo');
    
INSERT INTO recensione(username,codiceProdotto,testo) VALUES
	('Gongolo', 0005,'fa schifo'),
    ('Cucciolo', 0004,'divertente se stai fatto'),
    ('Mammolo', 0002,'ho ingoiato dei pezzi'),
    ('Eolo', 0003,'non adatto a chi ha un QI<80');

INSERT INTO composizione(codiceOrdine,codiceProdotto,quantita) VALUES
	(00001,0003,1),
    (00002,0001,1),
    (00002,0006,1),
    (00003,0005,3);-- ipotizziamo uno sconto che da 30€ mi fa pagare 28
    