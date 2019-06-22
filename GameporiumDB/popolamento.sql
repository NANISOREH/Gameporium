INSERT INTO cliente(nome,cognome,username,passwordU,recapito,cartaPred) VALUES
	('Sara','Corrente','Brontolo','Pippo','3394004520', '1010'),
	('Fabiana','Gatto','Cucciolo','Pluto','3384596321','1100'),
    ('Vincenzo','Monzo','Mammolo','Topolino','3384558321','111'),
    ('Maria','De Luca','Pisolo','Minnie','3849675843', '100'),
    ('Giovanni','Chiariello','Eolo','ZioPaperone','3397835226', '101'),
    ('Andrea','Palladino','Dotto','Qui','3569472315', '102'),
    ('Carmela','Volpe','Gongolo','Quo','3896475147', '103'),
    ('Claudia','Torre','Aramis','Qua','3336244859', '104'),
    ('Francesco','Perozziello','Portos','Paperina','3329957128', '105'),
    ('Michela','De Lucia','Athos','Paperino','3694752198', '106');
    
INSERT INTO amministratore(nome,cognome,username,passwordU,recapito) VALUES
	('Caino','Savastano','Broslayer','hostatoio','123456789');
    
INSERT INTO corriere(codiceCorriere, costoSpedizione,nome) VALUES
	(001, 5, 'BRT'),
    (002, 3,'SDA'),
    (003, 10,'TNT'),
    (004, 5.5,'GLS'),
    (005, 7, 'UPS');
    
INSERT INTO evento(codiceEvento,nome,luogo,descrizione,dataEvento,ora,numeroPartecipanti,locandina) VALUES
	(001, 'Fantaexpo','Parco dell Irno, SA','Torneo di Pokèmon GDC','2019/09/03','15:00:00',3,'fantaexpo.png'),
    (002, 'Cavacon', 'Mediateca Marte, Cava de Tirreni, SA', 'Giochi da tavolo','2020/01/06','10:00:00',7,'cavacon.jpg'),
    (003, 'Isola di Illyon','Mostra d’oltre Mare, Campi Flegrei, NA','Giochi di Ruolo','2020/04/28','12:00:00',16,'isola.png');
    
INSERT INTO prodotto(codiceProdotto, codiceCategoria, foto,titolo,disponibilita,prezzo,produttore,descrizione,IVA,novita,offerta) VALUES
	(0001, 01,'imagine.jpg','Imagine',8,20.00,'Oliphante','Imagine è un party game molto divertente di associazioni mentali in cui l’unico limite sarà la tua immaginazione. L’idea di base è, probabilmente, la più inflazionata nei party game: io disegno, tu indovini. Le schede trasparenti con i vari simboli riescono però a trasformare il gioco in qualcosa di innovativo. Imagine è dunque il titolo perfetto da tirare fuori quando si è in tanti e tutti vogliono divertirsi in modo spensierato. ',22,false,false),
    (0002, 01,'D&D.jpg','Dungeons & Dragons', 15, 40.00,'Wizard of the coast','Dungeons and Dragons è probabilmente il più classico dei giochi di ruolo, e niente meno che il simbolo della categoria giochi di ruolo da tavolo. Nel multiverso di D&D esistono moltissime creature: elfi, orchi nani, umani ecc…: il livello tecnologico è quello dell’epoca medioevale europea, però il tutto condito con un’enorme quantità di magia. . D&D è probabilmente il gdr più macchinoso mai stampato, le sue meccaniche di combattimento non si prestano bene ai neofiti, soprattutto le meccaniche della magia, ma l’unico modo per impararlo è... giocarci!',22,false,true),
    (0003, 02,'soldatino.jpg','Miniatura soldato',6,15.00,'Scalpello','Figura in miniatura in metallo peltro. Modello di riproduzione di un soldato romano, con indosso la sua uniforme da battaglia e un grande scudo impresso sulla schiena. Un pezzo ben dettagliato.Circa 40mm di altezza',22,true,true),
    (0004, 02,'setDadi.jpg','Set dadi',30, 5.00,'Chessex','Set di 3 dadi.',22,true,false),
    (0005, 01,'magic.jpg','The art of Magic - The Gathering',50, 10.00,'Wizard of the coast','The art of Magic - The Gathering è un gioco in cui le carte rappresentano le magie a disposizione di un mago che si confronta in una battaglia con un altro o più maghi. Ognuno dei contendenti ha a disposizione creature, incantesimi, stregonerie, artefatti e magie veloci (dette istantanei) per cercare di sconfiggere uno o più avversari.',22,false,false),
    (0006, 01,'vudu.jpg','Vudu', 4, 15.00, 'Red Glove','In Vudù vestirete i panni di stregoni tanto perfidi quanto strampalati! A colpi di incantesimi cercherete di rendere la vita impossibile ai vostri avversari: dovranno giocare su un piede solo, sibilando ogni parola, con le braccia incrociate e ululando prima di ogni tiro di dado. Se non resisteranno alle penitenze, voi farete punti… e il divertimento è assicurato!',22,false,true),
    (0007, 01,'taboo.jpg','Taboo', 5, 25.00, 'Milton Bradely','Taboo è il gioco delle parole vietate: scopo del gioco è suggerire una parola ai propri compagni di squadra nel tempo consentito dalla clessidra, ma facendo attenzione a non usare neppure una delle 5 parole taboo, pena l’eliminazione della carta. Tu sai cosa devi suggerire, ma non riesci proprio a trovare le parole. Per vincere servono creatività, abilità e prontezza, ma il bello è che non ci sono risposte sbagliate.',22,true,true),
    (0008, 01,'risiko.jpg','Risiko!', 11, 30.00, 'Editrice Giochi','Risiko!, il gioco di culto e sinonimo di strategia che raccoglie migliaia di appassionati in tutta Italia. Oltre alle regole tradizionali la confezione contiene anche le regole “da Torneo” adottate nei Campionati Italiani e la lista completa dei Club Risiko! in Italia. La confezione contiene: 6 armate colorate composte da cararmatini EG e bandierine, 3 dadi blu, 3 dadi rossi, un mazzo di carte e una plancia raffigurante il mondo. Gioca, sfida, conquista e vinci!',22,false,false),
    (0009, 02,'lanciadadi.jpg','Torre lancia dadi',3, 35.00, 'Ravensburger','L’opera dei maestri ingegneri degli Uomini ha portato ad una nuova meraviglia: finalmente i vostri dadi non cadranno più dal tavolo, visto che vi basterà farli cadere dalla cima della torre!',22,true,false),
    (0010, 02,'album.jpg','Album porta carte', 20, 12.00, 'Wizard of the coast', 'Portfolio per carte. 4 tasche. Formato A5.',22,false,false),
    (0011, 01,'arbraKadabra.jpg', 'Arbra Kadabra', 25, 25.00, 'Oliphante', 'Arbra Kadabra è un gioco che combina abilità, fortuna e strategia. E’ molto accattivante e le sue regole sono molto semplici. Ti trovi nella foresta incantata e devi superare la prova dell’albero magico per riuscire a fuggire.L’albero è multicolore e può crescere o rimpicciolirsi. Riceverai un segnalino e dieci pezzi in legno dello stesso colore. Alcuni pezzi hanno dei poteri magici. Usali a ragion veduta...Devi aggiungere o togliere pezzi dallo stesso albero. Il tuo scopo è di liberarti di tutti i tuoi pezzi e di prendere esattamente due pezzi per ciascuno degli altri colori. Attenzione, se qualcuno farà cadere dei pezzi dell’albero, dovrà prenderseli tutti…',22, true, true),
    (0012, 01,'alchimisti.jpg', 'Alchimisti', 10, 50.00, 'CranioCreations', 'Un pizzico di radice di mandragola, una piccola piuma di corvo. Buttali nel calderone e osserva cosa creano. Lo vorresti bere? Forse no. Dopo tutto, è per questo che esistono gli studenti.Benvenuto nel mondo di Alchimisti! Effettua esperimenti per scoprire le magiche proprietà dei tuoi ingredienti. Dimostra la tua conoscenza vendendo pozioni. Usa i soldi per comprare artefatti che amplieranno la tua ricerca. Pubblica, pubblica, pubblica le tue teorie! Guadagna sovvenzioni. E smaschera le falsità pubblicate da quegli sciocchi dei tuoi rivali.',22, false, true),
    (0013, 01,'household.jpg', 'Household', 5, 35.00, 'Raven Distribution', '’’Mio Caro Lettore, dalla scomparsa del Padrone, la Casa è stata scenario di una sanguinosa Guerra Domiciliare.Oggi i Piccoli Popoli hanno messo da parte i rancori e vivono una Fragile Pace. Questi meravigliosi anni sono ricchi di scoperte, ma anche di tensioni. Il Reame delle Fate ed i Boggart del Focolare si dividono il Pianterreno. Gli Sprighi controllano i loro Liberi Domini al Primo Piano. Giù nelle profondità della Cantina, le esotiche città degli Sluagh si estendono dalla Grande Lama fino al Deserto di Segatura, delimitando i confini dell’Orda. Questo volume vi fornirà gli strumenti per ricostruire la storia del Piccoli Popoli nella maniera più storicamente attendibile’’.',22, false, true),
    (0014, 01,'legend5rings.jpg', 'Legenda dei cinque anelli', 10, 28.00, 'Alderac Entertainment Group','La Leggenda dei 5 anelli è un living card game edito dalla Fantasy Flight Games. Questo gioco di carte è un competitivo per 2 giocatori ambientato nel mondo fantasy del Rokugan, molto simile al Giappone feudale, in cui il giocatore per sconfiggere il suo avversario, dovrà prendere le redini delle truppe di uno dei 7 clan dell’impero.', 22, true, true),
    (0015, 01,'wow.jpg', 'World of Warcraft Trading Card Game', 15, 35.00, 'Upper Deck Entertainment', 'Il GdR più famoso del mondo è tornato sul tavolo da gioco! Con WoW potete giocare le vostre razze e classi preferite del mondo d’Azeroth in quest’enorme gioco da tavolo. Affrontate i vostri avversari, accumulate tesori e crescete di livello! Iniziate la quest per divenire sempre più potenti e poter competere con i più grandi eroi di questo mondo.',22, true, false),
    (0016, 02,'pedMonopoly.jpg', 'Pedine Monopoly', 3, 12.00, 'Hasbro', 'Set di 8 pedine in metallo.', 22, false, false),
    (0017, 01,'monopoly.jpg', 'Monopoly', 7, 22.00, 'Hasbro', 'Il gioco di contrattazione più famoso al mondo. Scopo del gioco è diventare monopolista, ossia restare l’ultimo “finanziere” in partita dopo che tutti gli altri hanno fatto bancarotta. Al proprio turno, ogni giocatore lancia i dadi e si avventura sul tabellone, fra l’acquisto di terreni, stazioni o società, il pagamento di affitti e la costruzione di case e alberghi, le sorprese rappresentate dalle carte degli imprevisti e delle probabilità, e il rassicurante ritiro dello stipendio ogni volta che, completato un giro, si passa dal VIA. Quando un giocatore non ha denaro o proprietà a sufficienza per pagare un affitto o onorare un debito nei confronti della banca o di un altro giocatore, va in bancarotta ed esce dal gioco. Chi riesce ad amministrare al meglio le proprie finanze vince la partita!',22, true, true),
    (0018, 01,'pokemon.jpg', 'Pokémon Trading Card Game', 15, 30.00, 'Pokemon Company','Il Pokémon Trading Card Game è un gioco di carte collezionabili ispirato alla serie di videogiochi dei Pokémon. Lo scopo del gioco è quello di sconfiggere i Pokémon dell\'avversario, come avviene nelle battaglie presenti nel videogioco e nella serie animata.Ogni carta presenta dei punti salute (in inglese Health Points o HP), il cui valore indica i danni che il Pokémon in questione può subire: quando gli HP (punti vitalità o PV in italiano) di un Pokémon scendono a 0, esso viene messo K.O. e l\'avversario pesca una delle 6 carte premio. Il giocatore che riesce ad ottenere tutte le carte premio prima dell\'avversario vince l\'incontro.', 22, true, false),
    (0019, 02,'clessidra.jpg', 'Clessidra classic',7, 2.00, 'Koplow Games','Clessidra in vetro. Un minuto e mezzo di pioggia di granelli.', 22, false, false),
    (0020, 01,'ingranaggio.jpg','L\'ingranaggio', 5, 25.00, 'Stratagemma', '2080: il mondo che conosciamo è stato spazzato via da un crollo demografico inesorabile. In un’Italia ormai in ginocchio, la drammatica carenza di forza lavoro ha costretto i sopravvissuti a combinare chirurgia, orologeria e termoidraulica per rianimare i cadaveri come automi. Nascite prossime allo zero, mortalità impazzita nonostante la medicina faccia ormai miracoli: la vita umana è quanto di più sacro e intoccabile. Una Città-stato tecnocratica, un esercito di soldati in armatura a vapore, cadaveri biomeccanici impiegati in qualsiasi ambito della vita quotidiana: l’Ingranaggio fonde carne, acciaio e vapore e dipinge un mondo oscuro, fumoso e nuovamente sconfinato. Il sistema di gioco, basato sulle carte francesi, ha elementi di deckbuilding e gestione della casualità.',22, false, false),
    (0021, 01,'cEraUnaVolta.jpg','C\'era una volta', 10, 35.50, 'Raven Distribution','C\'Era una Volta è il premiato gioco di carte che unisce narrazione, creatività e collaborazione! Un giocatore, nei panni del Cantastorie, inizierà ad inventare una favola utilizzando i suggerimenti delle Carte Racconto, cercando di guidare la trama fino alla propria Carta Lieto Fine. Gli altri giocatori utilizzeranno le proprie Carte Racconto per interromperlo, diventando essi stessi i Cantastorie. Il vincitore sarà il primo giocatore che, dopo aver utilizzato tutte le proprie Carte Racconto, avrà condotto la storia verso la propria Carta Lieto Fine. Ricordate però: l’obiettivo del gioco non è vincere ma divertirsi inventando insieme memorabili avventure!', 22, true, true),
    (0022, 01,'heavySugar.jpg','Heavy Sugar', 15, 25.00, 'Raven Distribution', 'È con immenso orgoglio che la Eleven Aces presenta Heavy Sugar, il gioco di ruolo teslapunk che vi getterà fra le strade di Balhan City. In questa metropoli degli anni ruggenti, vi ritroverete in un mondo di perfezione sintetica dominato dall’energia elettrica e nel quale i cittadini risultano schiavizzati da una felicità imposta, intrappolati da una società castrante ed estremamente rigida che li sfrutta come batterie energetiche, al fine di sfamare la sua costante sete di elettricità. In veste di Mutinear, membri di gang sovversive all’ordine cittadino, il vostro compito sarà quello di sopravvivere a Balhan City nel tentativo di piegare le sue sbarre (o di approfittarne), combattendo contro il suo controllo e le sue difese, fra le quali i Right Hand, automi imponenti quanto letali che rimpiazzano le perdite del genere umano.', 22, true, false),
    (0023, 01,'13thAge.jpg','13th Age', 12, 49.99,'Wird Edizioni', 'Giunge anche in Italia il gioco di ruolo fantasy basato sul d20, creato da Jonathan Tweet, designer di D&D Terza Edizione e Rob Heinsoo, designer di D&D Quarta Edizione. Il formato è una scatola capiente, pronta ad ospitare tutti i prodotti della linea e, come tutte le nostre scatole, studiata appositamente per permettervi di portare con voi tutto il necessario per giocare e già pronta ad ospitare tutte comodamente le prossime uscite della linea. Ecco cosa troverete nella scatola:il Manuale di Gioco in brossura, un supplemento di avventure introduttive, la mappa dell\'Impero del Drago e le schede dei personaggi.', 22, false, true),
    (0024, 01,'arsMagica.jpg', 'Ars Magica - Quinta Edizione', 5, 45.00, 'Raven Distribution', 'Ars Magica, uno dei più coinvolgenti giochi di ruolo fantasy dall\'insuperabile background costituito dal nostro medioevo, in cui storia, leggenda e tradizione esistono e si fondono per dare vita all\'Europa Mitica! In Ars Magica, la magia e la creazione di incantesimi ed effetti magici non sono semplicemente un elenco di poteri da utilizzare a comando, no, proprio no... In Ars Magica, la magia è viva, è quasi possibile toccarla, e se non sarete svegli a sufficienza per fare uso della potenza messa a vostra disposizione, perirete, ma non come in ogni altro gioco di ruolo, se perirete con il vostro Magus, nemmeno l\'onore rimarrà attaccato al vostro nome... oppure, se non ambite a tanto, potrete sempre interpretare un Grog, fedeli servi e seguaci dei Magus, grezzi e ignoranti forse, certo, ma senza di loro, quante situazioni sarebbero inaffrontabili? Respirate l\'odore della magia, e imparate l\'arte...l\'Ars Magica.',22, false, false ),
    (0025, 01,'cardfight.jpg', 'Cardfight!! Vanguard', 7, 32.00, 'Bushiroad', 'La battaglia per il Pianeta Cray arriva al culmine in BT15: Rinascita Infinita! L\'ultima ora si avvicina quindi preparati all\'epico confronto come i più grandi combattenti di <<Paladino Dorato>>, <<Kagero>>, <<Link Joker>>, <<Aqua Force>>, <<Paladino Ombra>>, <<Luna Pallida>> e <<Megacolonia>>! Salva il mondo o conquistalo in nome del Vuoto, decidi il destino del Pianeta Cray!', 22, false, false),
    (0026, 02,'portamazzi,jpg', 'Deck Box', 12, 2.50, 'Ultimate Guard', 'Pratico porta mazzo nero.', 22, false, false),
    (0027, 02,'deckProtector.jpg', 'Deck Protector - Bustine protettive mini', 7, 3.50, 'Ultra Pro', '60 bustine proteggicarte mini nuovo formato (62x89mm). Acid free, NO PVC.', 22, false, false),
    (0028, 02,'deckProtector2.jpg', 'Deck Protector - Bustine protettive standard', 10, 6.00, 'Ultra Pro',  '50 bustine proteggicarte standard (66x91mm). Acid free, NO PVC.', 22, false, false),
    (0029, 02,'mescolatore.jpg', 'Mescolatore carte automatico', 10, 15.00, 'Ultra Pro', 'Mescolatore carte automatico (due mazzi) strutturato. Non vi resta che premere il pulsante per farlo lavorare al vostro posto. Questo mescolatore accetta carte formato bridge o poker e funziona con 4 batterie 1.5 V/AA. NB: carte e batterie non incluse.', 22, true, false),
    (0030, 02,'cashbrick50.jpg', 'Cashbrick da 1 euro - (tot.50 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 50 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0031, 02,'cashbrick100.jpg', 'Cashbrick da 2 euro - (tot.100 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 100 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0032, 02,'cashbrick250.jpg', 'Cashbrick da 5 euro - (tot.250 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 250 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0033, 02,'cashbrick500.jpg', 'Cashbrick da 10 euro - (tot.500 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 500 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0034, 02,'cashbrick1000.jpg', 'Cashbrick da 20 euro - (tot.1000 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 1000 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0035, 02,'cashbrick2500.jpg', 'Cashbrick da 50 euro - (tot.2500 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 2500 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0036, 02,'cashbrick5000.jpg', 'Cashbrick da 100 euro - (tot.5000 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 5000 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0037, 02,'cashbrick10000.jpg', 'Cashbrick da 200 euro - (tot.10000 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 10000 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0038, 02,'cashbrick25000.jpg', 'Cashbrick da 500 euro - (tot.25000 euro)', 10, 8.00, 'Hasbro', 'Mazzetta di 50 banconote per valore complessivo di 25000 Euro. Ogni banconota è stampata con speciale carta fina ed inchiostro resistente ed impermeabile. Idoneo anche come semplice regalo o uso decorativo.', 22, true, false),
    (0039, 02,'sacchetto.jpg', 'Sacchetto porta dadi - D&D', 15, 14.90, 'Ultra Pro', 'Blasonato dall\'iconico stemma di Dungeons & Dragons, questo sacchetto è l\'ideale per trasportare i tuoi dadi, miniature e qualsiasi altro ausilio alla battaglia alla tua prossima sessione di gioco! Il sacchetto è in velluto nero Dimensioni 115x210mm.', 22, false, false),
    (0040, 02,'schermoNero.jpg', 'Schermo nero personalizzabile per master', 10, 28.00, 'Hammerdog','Il più grande schermo del mondo della Hammerdog è arrivato finalmente in Italia! Uno Schermo del Master totalmente personalizzabile! Perfetto per i giochi di ruolo, o per qualsiasi gioco in cui è necessario gestire numerose informazioni. Lo schermo è formato da 4 pannelli orizzontali con tasche plastificate su entrambi i lati, per un totale quindi di 8 tasche A4 orizzontali, in cui potete inserire mappe, tabelle e note segrete utili al master da un lato e immagini evocative, tabelle e riferimenti utili ai giocatori dall\'altro.', 22, false, false),
    (0041, 02,'schermoBlu.jpg', 'Schermo blu personalizzabile per master', 10, 28.00, 'Hammerdog','Il più grande schermo del mondo della Hammerdog è arrivato finalmente in Italia! Uno Schermo del Master totalmente personalizzabile! Perfetto per i giochi di ruolo, o per qualsiasi gioco in cui è necessario gestire numerose informazioni. Lo schermo è formato da 4 pannelli orizzontali con tasche plastificate su entrambi i lati, per un totale quindi di 8 tasche A4 orizzontali, in cui potete inserire mappe, tabelle e note segrete utili al master da un lato e immagini evocative, tabelle e riferimenti utili ai giocatori dall\'altro.', 22, false, false),
    (0042, 02,'schermoArgento.jpg', 'Schermo argento personalizzabile per master', 10, 28.00, 'Hammerdog','Il più grande schermo del mondo della Hammerdog è arrivato finalmente in Italia! Uno Schermo del Master totalmente personalizzabile! Perfetto per i giochi di ruolo, o per qualsiasi gioco in cui è necessario gestire numerose informazioni. Lo schermo è formato da 4 pannelli orizzontali con tasche plastificate su entrambi i lati, per un totale quindi di 8 tasche A4 orizzontali, in cui potete inserire mappe, tabelle e note segrete utili al master da un lato e immagini evocative, tabelle e riferimenti utili ai giocatori dall\'altro.', 22, false, false),
    (0043, 02,'schermoRosso.jpg', 'Schermo rosso personalizzabile per master', 10, 28.00, 'Hammerdog','Il più grande schermo del mondo della Hammerdog è arrivato finalmente in Italia! Uno Schermo del Master totalmente personalizzabile! Perfetto per i giochi di ruolo, o per qualsiasi gioco in cui è necessario gestire numerose informazioni. Lo schermo è formato da 4 pannelli orizzontali con tasche plastificate su entrambi i lati, per un totale quindi di 8 tasche A4 orizzontali, in cui potete inserire mappe, tabelle e note segrete utili al master da un lato e immagini evocative, tabelle e riferimenti utili ai giocatori dall\'altro.', 22, false, false),
    (0044, 02,'schermoViola.jpg', 'Schermo viola personalizzabile per master', 10, 25.00, 'Hammerdog','Il più grande schermo del mondo della Hammerdog è arrivato finalmente in Italia! Uno Schermo del Master totalmente personalizzabile! Perfetto per i giochi di ruolo, o per qualsiasi gioco in cui è necessario gestire numerose informazioni. Lo schermo è formato da 4 pannelli orizzontali con tasche plastificate su entrambi i lati, per un totale quindi di 8 tasche A4 orizzontali, in cui potete inserire mappe, tabelle e note segrete utili al master da un lato e immagini evocative, tabelle e riferimenti utili ai giocatori dall\'altro.', 22, false, false),
    (0045, 02,'schermoVerde.jpg', 'Schermo verdepersonalizzabile per master', 10, 25.00, 'Hammerdog','Il più grande schermo del mondo della Hammerdog è arrivato finalmente in Italia! Uno Schermo del Master totalmente personalizzabile! Perfetto per i giochi di ruolo, o per qualsiasi gioco in cui è necessario gestire numerose informazioni. Lo schermo è formato da 4 pannelli orizzontali con tasche plastificate su entrambi i lati, per un totale quindi di 8 tasche A4 orizzontali, in cui potete inserire mappe, tabelle e note segrete utili al master da un lato e immagini evocative, tabelle e riferimenti utili ai giocatori dall\'altro.', 22, false, false),
    (0046, 02,'schermoRosa.jpg', 'Schermo rossa personalizzabile per master', 10, 25.00, 'Hammerdog','Il più grande schermo del mondo della Hammerdog è arrivato finalmente in Italia! Uno Schermo del Master totalmente personalizzabile! Perfetto per i giochi di ruolo, o per qualsiasi gioco in cui è necessario gestire numerose informazioni. Lo schermo è formato da 4 pannelli orizzontali con tasche plastificate su entrambi i lati, per un totale quindi di 8 tasche A4 orizzontali, in cui potete inserire mappe, tabelle e note segrete utili al master da un lato e immagini evocative, tabelle e riferimenti utili ai giocatori dall\'altro.', 22, false, false),
    (0047, 02,'valigetta.jpg', 'Valigetta porta carte con tracolla', 4, 24.99, 'Ultra Pro', 'Uno splendido zainetto portacarte creato appositamente per contenere carte già avvolte dalle loro bustine protettrici!', 22, false, true),
    (0048, 02,'portfolioD&D.jpg', 'D&D 5th Edition - Character Folio Tomb of Annihilation', 5, 12.50, 'Ultra Pro', 'Che il tuo personaggio sia fiero e forgiato dalle battaglie o giovane ed ingenuo, necessita di essere protetto dai pericoli del mondo. Con due pagine da 18 tasche ad inserimento laterale, potrai tenere al sicuro fino a 36 carte incantesimo di formato Standard. Invece con le 10 pagine da una tasca ti aiuteranno a contenere al meglio la tua scheda del personaggio e le tue note. Tieni le tue informazioni segrete con l\'utilizzo dei Character Folio. Contiene fino a 36 carte incantesimo e 10 schede personaggio.', 22, false, false),
    (0049, 02,'reggicarte.jpg', 'Reggicarte in plastica', 12, 6.50, 'Hammerdog', 'Ideale per i clienti con una sola mano o mobilità limitata,  per una maggiore comodità e semplicità. Ogni supporto può contenere fino a 15 carte da gioco di dimensioni standard.', 22, false, false),
    (0050, 02,'gettoniera.jpg', 'Vassoio gettoniera', 7, 7.00, 'Hasbro', 'Pratico vassoio gettoniera per 450 fiches, con due comode maniglie e coperchio, per mettere tutto in ordine. E\' realizzato in plastica trasparente.', 22, false, false),
    (0051, 02,'sabot.jpg', 'Sabot trasparente', 5, 4.50, 'Ultra Pro', 'Sabot in acrilico trasparente, senza manico, utilizzabile in qualsiasi tipo di gioco di carte. Dimensioni: Cm(23x10x9,2).', 22, true, true),
    (0052, 02,'sabot.jpg', 'Sabot in legno', 5, 7.50, 'Ultra Pro', 'Sabot realizzato in legno di ciliegio, senza manico, utilizzabile in qualsiasi tipo di gioco di carte. Dimensioni: Cm(23x10x9,2).', 22, true, true),
    (0053, 02,'reggicarte2.jpg', 'Reggicarte in legno', 12, 6.50, 'Hammerdog', 'Ideale per i clienti con una sola mano o mobilità limitata,  per una maggiore comodità e semplicità. Ogni supporto può contenere fino a 15 carte da gioco di dimensioni standard.', 22, false, false),
	(0054, 02,'scatola.jpg', 'Scatola in latta', 7, '5.00', 'Modiano', 'Pratica scatola in latta adatta a contenere due mazzi di carte.', 22, false, false),
    (0055, 01,'sussed.jpg', 'Sussed di tutto un po\'', 12, 25.00, 'Good toy', 'Un piacevole gioco a quiz per tutta la famiglia, che stimola la conversazione faccia a faccia. Sfida i giocatori a esprimere la loro vera personalità e a scoprire quella degli altri: con oltre 200 situazioni tra cui scegliere, avrai bisogno del potere della ragione e dell’intuizione per scoprire chi conosce meglio chi!', 22, true, true),
    (0056, 01,'yooloo.jpg', 'YOOLOO', 11, 24.99, 'Cranio Creations', 'Un nuovo e semplice gioco di carte per partite veloci e appassionanti, adatto anche come gioco educativo per bambini da usare a casa, a scuola, all\'asilo (centri diurni) oppure come divertente gioco da tavolo anche in vacanza o in viaggio. I giocatori cercano di ottenere quanti più punti possibili con le carte da gioco più alte, ma attenzione: se una carta viene tirata due volte, non rientra nella classifica!', 22, true, true),
    (0057, 01,'dixit.jpg', 'Dixit', 3, 21.50, 'Libellud', 'Dixit è un gioco splendidamente illustrato che fa appello alla fantasia e all\'intuito. Per trovare l\'immagine chiave, lasciatevi trasportare dalle vostre idee!',22, false, true),
    (0058, 01,'pictionary.jpg','Pictionary', 1, 20.00, 'Libellud', 'Pictionary è il gioco da disegnare dove non conta saper disegnare. Dividetevi in due squadre e sfidatevi sul tabellone per giungere per primi al traguardo. Per avanzare dovrete disegnare le parole presenti sulle carte indizio e farle indovinare ai vostri compagni. Ma non è così semplice: dovrete fare i conti con la clessidra. Vince la squadra con più affinità, scaltrezza e mano lesta, ma se si sbaglia a disegnare e indovinare il gioco diventa ancora più divertente e si ride il doppio. E voi cosa vedrete: un fiore o un uovo fritto?', 22, true, true),
    (0059, 01,'indomimando.jpg','Indomimando', 2, 33.95, 'Hasbro', 'Prova ad indovinare ciò che i tuoi compagni in modo pietoso stanno cercando di farti capire! Indomimando è il nuovo gioco da tavolo basato sull\'intuito e sull\'affiatamento: pescate le carte, dividetevi in squadre, mimate e... buona fortuna!', 22, true, false),
    (0060, 01,'yugioh.jpg','Yu-Gi-Oh! Trading Card Game',22, 45.00, 'Konami', 'Il Gioco di carte di Yu-Gi-Oh!, noto anche come Yu-Gi-Oh! Trading Card Game, è un gioco di carte collezionabili reale derivato da un analogo gioco immaginario che appare nel manga e anime Yu-Gi-Oh! Sfida a duello gli altri partecipanti, sfrutta al massimo il tuo deck per azzerare i punti vita dei tuoi avversari e fatti baciare dalla fortuna: pescando carte speciali, potrai vincere il duello automaticamente! Cosa aspetti?', 22, true, false),
    (0061, 01,'skyjo.jpg', 'SKYJO', 7, 25.50, 'Magilano', 'Questo é il nome dell\'emozionante nuovo gioco di carte di Magilano che promette tanto divertimento per le vostre serate in compagnia. Lo scopo del gioco di carte SKYJO é di fare il minor numero di punti possibile su più turni. Alla fine di ogni turno, i punti sono contati e aggiunti al punteggio precedente di ciascun giocatore. Una volta che un giocatore raggiunge 100 o più punti, il gioco finisce e il giocatore con il punteggio più basso vince la partita. Raccogliere punti bassi significa collezionare carte con il numero più basso possibile e, se possibile, addirittura negativi.', 22, false, true),
    (0062, 01,'uno.jpg', 'UNO', 11, 20.00, 'Mattel Games', 'Non c’è età, regione, nazionalità, interessi che tengano: dall’anno della sua nascita UNO è un gioco amato da tanti. Cento dodici carte per gioire, esultare, arrabbiarsi e ed emozionarsi insieme alla famiglia o agli amici, dopo la scuola o il sabato sera, sul treno o sul divano, in spiaggia o sulla neve, con chi, quando e dove vuoi tu. La giocata più temuta è il cattivo +4. Attenzione: può creare dipendenza.', 22, false, true),
    (0063, 01,'skipbo.jpg', 'SKIPBO',2, 17.50, 'Mattel Games', 'Skip-Bo è l\'entusiasmante gioco di carte da mettere in sequenza dagli stessi creatori di UNO. I giocatori sfruttano abilità e strategia per creare mazzi con numeri in sequenza (2, 3, 4...), posizionando le carte fino a quando non ne avranno più da giocare. Una volta distribuite un mazzo di carte ad ogni giocatore, il gioco inizia pescando una carta dal mazzo centrale e costruendo fino a quattro mazzi di "costruzione". Le carte jolly Skip-Bo danno una scossa alle situazioni statiche e possono essere giocate come un numero qualsiasi. Usate queste carte con astuzia per vincere. Il primo giocatore che usa tutte le carte del proprio mazzo Skip-Bo vince. Include 162 carte e istruzioni.',22, false, false),
    (0064, 01,'jumanji.jpg','JUMANJI', 5, 35.00, 'Editrice giochi', 'Chi non ha mai desiderato giocare in prima persona al famoso gioco da tavolo di "Jumanji", ora è possibile. Ispirata al film originale uscito nel 1995, questa edizione del gioco, che nella pellicola creò il panico in città, con creature venute da un\'altra dimensione grazie al tiro dei dadi da parte dei protagonisti, conquisterà appassionati e nuove generazioni. L’obiettivo è quello di raggiungere per primo il centro del tabellone, lanciando il dado, smarcando il rinoceronte e decodificando i messaggi segreti sulle carte. Attenzione, se iniziate a giocare dovete finire.', 22, true, true),
    (0065, 01,'indovina.jpg','Indovina chi?', 4, 27.00, 'Hasbro Gaming', 'Ecco la versione classica di Indovina Chi?, il gioco originale in cui si devono indovinare le identità misteriose. Il tuo personaggio misterioso indossa un cappello? Oppure ha gli occhi azzurri? I bambini si divertiranno un mondo a fare domande per scoprire chi è il personaggio misterioso. Chi riesce per primo ad azzeccarne l’identità, vince la partita.', 22, true, false),
    (0066, 01,'munchkin.jpg','Munchkin', 3, 25.00, 'Raven', 'Uccidi i mostri! Prendi il tesoro! Elimina i tuoi compagni! Inoltratevi nel dungeon. Uccidete tutto quello che si muove. Fate fuori i vostri compagni e rubategli l\'equipaggiamento. Afferrate il tesoro e correte. Ammettetelo: vi piace… Questo gioco di carte non collezionabile cattura l\'esperienza del tipico gioco di ruolo... senza tutte quelle stupidaggini sull\'interpretazione. Tutto quello che dovete fare è uccidere i mostri e prendere gli oggetti magici.', 22, true, true),
	(0067, 01,'descent.jpg','Descent - Viaggi nelle tenebre', 5, 67.50, 'Raven', 'Gioco da tavolo in cui un giocatore assume il ruolo di malvagio signore supremo, mentre fino a 4 persone assumono i panni di valorosi eroi intenti a sgominare i suoi piani. Durante ogni partita, gli eroi intraprendono avventure in varie locazioni per combattere mostri, raccogliere tesori e impedire che il signore supremo metta in atto i suoi vili propositi.', 22, true, true),
    (0068, 01,'witcher.jpg','The Witcher', 3, 45.50, 'Need Games', 'Il gioco di ruolo di The Witcher vi permetterà di calarvi in una della ambientazioni fantasy videoludiche di maggior successo degli ultimi anni! Grazie a questo innovativo gioco di ruolo basato sul sistema Fuzion, in grado di supportare gruppi di gioco hardcore ma anche giocatori alle prime armi nel mondo dell\'interpretazione, avrete l\'occasione di conoscere a fondo il mondo di Geralt di Rivia. Esplorate ancora più in dettaglio questo universo che avete imparato ad amare nel corso di molteplici ore di videogioco, visitate le città più famose ed incontrate i personaggi della serie videoludica, ma non fermatevi qui. Grazie a questo gioco di ruolo potrete conoscere cittadine semisconosciute o personaggi secondari che celano storie che avrete l\'occasione di vivere con un\'intensità senza precedenti.', 22, false, false),
    (0069, 01,'signoreanelli.jpg', 'Il Signore degli Anelli - Avventure nella Terra di Mezzo', 5, 55.00, 'Giochi uniti', 'Il Signore degli Anelli: Avventure nella Terra di Mezzo è ambientato nei diciassette anni che intercorrono dalla Festa d\'Addio di Bilbo alla partenza dell\'Anello dalla Contea, come descritto nel romanzo di J.R.R. Tolkien Il Signore degli Anelli.™ Un giocatore assumerà il ruolo di Sauron, che cerca di dominare la Terra di Mezzo con le sue scellerate trame e i suoi malvagi servitori. Fino a tre altri giocatori assumeranno il ruolo di eroi con il compito di mantenere a bada l\'oscurità, finché i piani di Gandalf non saranno maturi. Per far ciò, gli eroi dovranno intraprendere pericolose imprese e avranno a che fare con famosi personaggi della Terra di Mezzo, per ottenere il loro aiuto e la loro conoscenza. Giocherai come Sauron, reclamando il potere su tutta la Terra di Mezzo? O sarai invece uno degli Eroi, opponendoti all\'Oscuro Signore?', 22, false, true),
    (0070, 01,'mythos.jpg', 'Mythos- Terrificanti Indagini nella Arkham di Lovecraft ', 6, 36.90, 'Giochi uniti', 'OTTO ORIGINALI MISTERI DELL\'ORRORE Benvenuto ad Arkham, Massachusetts, la tenebrosa città inventata da H.P. Lovecraft, il leggendario scrittore del fantastico. Sei un investigatore che opera al fianco del direttore della Biblioteca della Miskatonic University, l\'esimio professor Henry Armitage, incaricato di risolvere inquietanti misteri. A tua disposizione ci sono il quotidiano L\'Eco di Arkham, la Rubrica e la Mappa della città. Dovrai consultare i tuoi informatori, esaminare indizi, interrogare e inseguire individui sospetti. False piste e colpi di scena sono sempre dietro l\'angolo e le apparenze spesso ingannano.', 22, true, false),
    (0071, 01,'mascarade.jpg', 'Mascarade', 7, 19.99, 'Raven', 'Giudice o ladro, re o contadino, strega o vescovo. . . Partecipa alla Mascarade e rivela le identità altrui! Fino a 13 personaggi diversi di cui assumere il ruolo per tentare di diventare il giocatore più ricco alla fine della partita. Mascarade è un gioco di bluff basato sui personaggi, creato da Bruno Faidutti; da 2 a 13 giocatori. Ogni giocatore riceve una carta personaggio a faccia in giù. Durante la partita i giocatori si scambiano i personaggi, senza che nessuno possa mai essere sicuro di quale carta si trovi davanti! L’obiettivo dei giocatori è usare i poteri dei personaggi per ottenere 13 monete d’oro. Tuttavia, se un qualsiasi giocatore fa bancarotta, la partita termina immediatamente e il giocatore più ricco vince la partita.', 22, false, true),
    (0072, 01,'saboteur.jpg', 'Saboteur', 2, 15.70, 'Need Games', 'In Saboteur i giocatori sono industriosi nani minatori che in gruppo cercheranno di scavare profonde gallerie alla ricerca di un tesoro, avendo a loro disposizione piccone, lampada e carrello. Sfortunatamente però, nella compagnia si nasconde qualche pericoloso sabotatore con il celato intento di mandare tutto all\'aria. Quando i cercatori d\'oro riusciranno a creare il giusto percorso e a raggiungere i tesori, verranno ricompensati con le pepite d\'oro lasciando i sabotatori a mani vuote. Tuttavia, se saranno i cercatori d\'oro a fallire, spetterà ai sabotatori ricevere la ricompensa. Il problema sta nel fatto che la verità sui propri ruoli rimane sconosciuta: i ruoli verranno rivelati solo quando l\'oro dovrà essere suddiviso. ', 22, false, false),
    (0073, 01,'lupus.jpg','Lupus in tabula', 6, 22.45, 'Giochi uniti','Nello sperduto villaggio di Tabula, alcuni abitanti sono affetti da licantropia. Ogni notte diventano lupi mannari e, per placare i loro istinti, sbranano un innocente. Di giorno i superstiti si riuniscono dibattendo sul da farsi: alla fine della discussione linciano uno di loro, credendolo un lupo mannaro. Chi sopravvivrà al massacro? Chi risolverà il mistero delle notti di luna piena? Un gioco per tanti che ormai è un classico. Per vincere vi serviranno intuito da detective o una buona dose di faccia tosta.', 22, false, false),
    (0074, 01,'burraco.jpg','Burraco', 5, 15.00, 'Modiano', '2 mazzi da 54 carte per uno dei classici di sempre: Burraco.', 22, false, false),
    (0075, 01,'thegame.jpg','The Game Extreme', 6, 22.00, 'dv Giochi', 'Il seguito del diabolico gioco di carte cooperativo The Game. Nel gioco sono incluse 28 carte “comando” che daranno del filo da torcere anche ai giocatori più scafati. Se giochi una carta comando, i giocatori dovranno eseguire il comando esattamente, o la partita è persa. Nonostante le semplici regole, battere il gioco sembrerà davvero impossibile; solo con un gruppo affiatato e tenace i giocatori potranno sperare di spuntarla. Giocabile anche "in solitario".', 22, true, true),
    (0076, 01,'thegame1.jpg', 'The Game', 6, 18.65, 'dv Giochi', 'THE GAME è l’avversario da battere. Nel corso della partita, al centro del tavolo si formano quattro mucchietti di carte. Due hanno i numeri crescenti da 1 a 99, gli altri due i numeri decrescenti da 100 a 2. Tutti i partecipanti giocano insieme nella stessa squadra e cercano di calare sui quattro mucchietti il maggior numero di carte, meglio se tutte e 98!', 22, false, true),
    (0077, 02,'valigetta1.jpg','Valigetta porta miniature', 7, 6.50, 'Hasbro', 'Questa valigetta porta miniature del modello MINI PLUS è adatta per contenere: ripiani porta miniature Halfl Size (HS), massimo 145 mm di altezza totale dei ripiani. La valigetta è composta di materiale morbido ed elastico, i piani di spugna che è possibile inserire sono completamente personalizzabili. Questo articolo non include i ripiani porta miniature che sono venduti separatamente.', 22, false, false),
	(0078, 02,'clessidra2.jpg', 'Clessidra classic gialla',7, 2.00, 'Koplow Games','Clessidra in vetro con basi gialle. Un minuto e mezzo di pioggia di granelli.', 22, false, false),
    (0079, 02,'clessidra3.jpg', 'Clessidra classic blu',7, 2.00, 'Koplow Games','Clessidra in vetro con basi blu. Un minuto e mezzo di pioggia di granelli.', 22, false, false),
    (0080, 02,'clessidra4.jpg', 'Clessidra classic rossa',7, 2.00, 'Koplow Games','Clessidra in vetro con basi rosse. Un minuto e mezzo di pioggia di granelli.', 22, false, false),
    (0081, 02,'clessidra5.jpg', 'Clessidra classic nera',7, 2.00, 'Koplow Games','Clessidra in vetro con basi nere. Un minuto e mezzo di pioggia di granelli.', 22, false, false),
	(0082, 02,'custodia.jpg','Custodia maxi porta carte', 5, 30.00, 'ANTS','Tutte le carte in un case: il portacarte è dotato di 4 divisori rimovibili, da 2200 carte totali e una tasca in rete per contenere ulteriori piccoli accessori.', 22, false, true),
    (0083, 01,'eredita.jpg','L\'Eredità', 5, 17.50, 'Clementoni', 'Il famoso quiz TV prende vita in un gioco da tavolo appassionante e coinvolgente. Sfida gli amici in tutte le prove della trasmissione, dal "Dominio musicale" ai "Calci di rigore" e alla "Ghigliottina"...chi riuscirà ad indovinare la parola finale e vincere?', 22, false, false),
    (0084, 01,'reazione.jpg','Reazione a catena', 5, 12.50, 'Clementoni', '"Reazione a catena" torna in libreria nella nuova edizione per ritrovare su carta una selezione dei migliori giochi del programma televisivo che consente a tutti, e con divertimento, di tenere "in allenamento" la mente e scoprire o riscoprire curiosità della nostra splendida lingua. Come i concorrenti del gioco, ogni lettore può sfidare se stesso, o gli amici, sulla capacità di indovinare e completare parole e "catene" di vocaboli, mettendo alla prova la propria conoscenza dell\'italiano.', 22, true, false),
    (0085, 01,'soliti.jpg','I soliti ignoti', 6, 15.50, 'Clementoni', 'Il famoso programma TV prende vita in un divertente gioco da tavolo per tutta la famiglia. Contiene un tabellone con identità nascoste e carte "mestiere" da abbinare a ciascuna di queste... chi sarà il più bravo a svelarle tutte e vincere? Un gioco coinvolgente per lanciarsi in divertenti sfide con parenti e amici.', 22, false, false),
    (0086, 01,'vampire.jpg','Vampire: The Eternal Struggle', 4, 35.95, 'Raven', '\'The Eternal Struggle\' è il tema portante del gioco: ogni giocatore entra nei panni di un \'Methuselah\', un vampiro antico e potente, tanto potente da essere considerato una leggenda per i vampiri più giovani, i quali dubitano della stessa esistenza dei Methuselah credendo di perseguire i propri fini.. mentre la realtà li vede marionette nelle mani dei Methuselah stessi che dall\'ombra li usano, pedine atte a soddisfare giochi di potere di ben più vaste proporzioni il cui fine è il danneggiamento indiretto di altri Methuselah... che aspetti?', 22, true, false),
    (0087, 02,'miniatureD&D.jpg','Dungeons & Dragons Icons of the Realms', 3, 12.00, 'Wizkids', '6 miniature dei celebri protagonisti di Dungeons & Dragons.20 x 30 x 30 cm', 22, true, true),
    (0088, 02,'grizzly&D','Dungeons & Dragons Grizzly',4, 15.00,'Wizkids', 'Il grizzly di Dungeons & Dragons in tutta la sua ferocia. 20 x 30 x 30 cm.', 22, true, true),
    (0089, 02,'lupo','Dungeons & Dragons Wolf', 4, 16.00, 'Wizkids','Il lupo di Dungeons & Dragons in tutta la sua eleganza e tenacia. 20 x 30 x 30 cm.', 22, true, true);

  INSERT INTO accessorio(nomeCategoria, descrizioneCategoria,codiceProdotto) VALUES
	('Accessorio','Accessori per giochi di ruolo',0003),
    ('Accessorio','Accessori per giochi di ruolo',0004),
    ('Accessorio','Accessori per giochi di ruolo',0009),
    ('Accessorio','Accessori per giochi di carte',0010),
    ('Accessorio','Accessori per giochi da tavolo',0016),
    ('Accessorio','Accessori per giochi da tavolo',0019),
    ('Accessorio','Accessori per giochi di carte', 0026),
    ('Accessorio','Accessori per giochi di carte', 0027),
    ('Accessorio','Accessori per giochi di carte', 0028),
    ('Accessorio','Accessori per giochi di carte', 0029),
    ('Accessorio','Accessori per giochi da tavolo',0030),
    ('Accessorio','Accessori per giochi da tavolo',0031),
    ('Accessorio','Accessori per giochi da tavolo',0032),
    ('Accessorio','Accessori per giochi da tavolo',0033),
    ('Accessorio','Accessori per giochi da tavolo',0034),
    ('Accessorio','Accessori per giochi da tavolo',0035),
    ('Accessorio','Accessori per giochi da tavolo',0036),
    ('Accessorio','Accessori per giochi da tavolo',0037),
    ('Accessorio','Accessori per giochi da tavolo',0038),
    ('Accessorio','Accessori per giochi di ruolo', 0039),
    ('Accessorio','Accessori per giochi di ruolo', 0040),
    ('Accessorio','Accessori per giochi di ruolo', 0041),
    ('Accessorio','Accessori per giochi di ruolo', 0042),
    ('Accessorio','Accessori per giochi di ruolo', 0043),
    ('Accessorio','Accessori per giochi di ruolo', 0044),
    ('Accessorio','Accessori per giochi di ruolo', 0045),
    ('Accessorio','Accessori per giochi di ruolo', 0046),
    ('Accessorio','Accessori per giochi di carte', 0047),
    ('Accessorio','Accessori per giochi di ruolo', 0048),
    ('Accessorio','Accessori per giochi di carte', 0049),
    ('Accessorio','Accessori per giochi di carte', 0050),
	('Accessorio','Accessori per giochi di carte', 0051),
    ('Accessorio','Accessori per giochi di carte', 0052),
    ('Accessorio','Accessori per giochi di carte', 0053),
    ('Accessorio','Accessori per giochi di carte', 0054),
    ('Accessorio','Accessori per giochi di ruolo', 0077),
	('Accessorio','Accessori per giochi da tavolo',0078),
    ('Accessorio','Accessori per giochi da tavolo',0079),
    ('Accessorio','Accessori per giochi da tavolo',0080),
    ('Accessorio','Accessori per giochi da tavolo',0081),
	('Accessorio','Accessori per giochi di carte', 0082),
    ('Accessorio','Accessori per giochi di ruolo', 0087),
	('Accessorio','Accessori per giochi di ruolo', 0088);

    

    


    
INSERT INTO gioco (codiceProdotto,nomeCategoria,descrizioneCategoria,durata,etaConsigliata,numgiocatori) VALUES
	(0001,'Gioco','Gioco da tavolo','variabile',6,'2+'),
    (0002,'Gioco','Gioco di ruolo','variabile',14,'2+'),
    (0005,'Gioco','Gioco di carte','60\'',12,'2'),
    (0006,'Gioco','Gioco da tavolo','90\'',16,'4-8'),
    (0007,'Gioco','Gioco da tavolo','30\'',14,'4+'),
    (0008,'Gioco','Gioco da tavolo','120\'',14,'2-4'),
    (0011,'Gioco','Gioco da tavolo', 'variabile', 7, '2-4'),
    (0012,'Gioco','Gioco da tavolo', '120\'', 13, '2-4'),
    (0013,'Gioco','Gioco di ruolo', 'variabile', 14, '2+'),
    (0014,'Gioco','Gioco di carte', 'variabile', 14, '2'),
    (0015,'Gioco','Gioco di carte', 'variabile', 14, '2+'),
    (0017,'Gioco','Gioco da tavolo', 'variabile', 8, '2-4'),
    (0018,'Gioco','Gioco di carte', '60\'', 8, '2-4'),
    (0020,'Gioco','Gioco di ruolo','variabile', 12, '2+'),
    (0021,'Gioco','Gioco di ruolo', '30\'', 8, '2-6'),
    (0022,'Gioco','Gioco di ruolo', '90\'', 10, '2+'),
    (0023,'Gioco','Gioco di ruolo', '45\'', 12, '2-4'),
    (0024,'Gioco','Gioco di ruolo', 'variabile', 12, '2+'),
    (0025,'Gioco','Gioco di carte', 'variabile', 12, '2-4'),
	(0055,'Gioco','Gioco da tavolo', 'variabile', 6, '2-10'),
	(0056,'Gioco','Gioco di carte', '30\'', 6, '2-4'),
    (0057,'Gioco','Gioco da tavolo', '30\'', 8, '3-6'),
    (0058,'Gioco','Gioco da tavolo', 'variabile', 10, '2-4'),
    (0059,'Gioco','Gioco da tavolo', '45\'', 10,'4-8'),
	(0060,'Gioco','Gioco di carte', '90\'', 6, '2-4'),
    (0061,'Gioco','Gioco di carte', '60\'', 10,'2-4'),
    (0062,'Gioco','Gioco di carte', '60\'', 7,'2+'),
    (0063,'Gioco','Gioco di carte', 'variabile' , 7,'2+'),
    (0064,'Gioco','Gioco da tavolo', '60\'', 8, '2-4'),
	(0065,'Gioco','Gioco da tavolo', '60\'', 8, '2-4'),
    (0066,'Gioco','Gioco di ruolo', '60\'', 8, '3-6'),
    (0067,'Gioco','Gioco di ruolo', '60\'', 14,'2-5'),
    (0068,'Gioco','Gioco di ruolo','45\'',14,'2-4'),
    (0069,'Gioco','Gioco di ruolo', '60\'', 12, '2-4'),
	(0070,'Gioco','Gioco di ruolo', '60\'', 14, '2-10'),
    (0071,'Gioco','Gioco di ruolo', '45\'', 12, '2-6'),
	(0072,'Gioco','Gioco di ruolo', '60\'', 14, '2-8'),
    (0073,'Gioco','Gioco di ruolo','45\'', 16, '2-6'),
    (0074,'Gioco','Gioco di carte','30\'', 4,'2-4'),
    (0075,'Gioco','Gioco di carte','45\'', 14,'2-4'),
	(0076,'Gioco','Gioco di carte','45\'', 14,'2-4'),
    (0083,'Gioco','Gioco da tavolo','60\'', 12,'2-6'),
	(0084,'Gioco','Gioco da tavolo','60\'', 12,'2-6'),
	(0085,'Gioco','Gioco da tavolo','60\'', 12,'2-6'),
	(0086,'Gioco','Gioco di carte','30\'', 14,'2-4');


    
INSERT INTO ordine(codiceOrdine,indirizzoSpedizione,tipoSpedizione,dataOrdine,dataSpedizione,codiceSpedizione,codicePagamento,importo,metodo,indirizzoFatturazione) VALUES
	(00001,02,'Raccomandata','2019/07/02','2019/07/05',0010,1,15.3,112,'Via Paolo Uccello 8'),
    (00002, 04,'Prioritaria','2019/06/15','2019/06/22',0011,2,35, 111,'Via Uguale 0'),
    (00003, 04,'Celere','2019/05/01','2019/05/08',0022,3,28, 113, 'Corso Umberto 27'),
    (00004, 03,'Celere','2019/06/26','2019/07/03',0034,5,25, 111, 'Corso Maratona 28' ),
    (00005, 01,'Prioritaria','2019/07/4','2019/07/11',025,7,40,112,'Via della morte 06'),
    (00006, 03,'Raccomandata','2019/09/1','2019/09/08',044,9,90.95,111,'Via Napoleone 01'),
    (00007, 03,'Raccomandata','2019/08/10','2019/08/17',059,8,64,113,'Via Verdi 45'),
    (00008, 02,'Celere','2019/08/05','2019/08/12',012,14,30,112,'Via Condotti 22'),
    (00009, 04,'Prioritaria','2019/10/12','2019/10/19',01,28,34,113,'Via Pitagora 90'),
    (00010, 01,'Prioritaria','2019/11/21','2019/11/28',026,41,55,111,'Via Uguale 54');
    
    
    
INSERT INTO indirizzo(codiceIndirizzo,via,civico,citta, cap) VALUES
    (01,'via dall Università', 53,'Aversa', 80200),
    (02,'via Vittorio Emanuele',89,'Napoli',80010),
    (03, 'via eruzione',70,'Pompei',83020),
    (04,'via dal carcere',25,'Scampia',82120);
    
INSERT INTO metodoPagamento(circuito,numCarta,cvv,scadenza) VALUES
	('visa',1234321,119,'12/2019'),
    ('mastercard',5678765,773,'01/2022'),
    ('american express',3456543,223,'01/2024');
    
    
INSERT INTO effettua(username,codiceOrdine) VALUES
	('Brontolo',00001),
    ('Athos',00002),
    ('Eolo',00003),
    ('Dotto',00004),
    ('Mammolo',00005),
    ('Gongolo',00006),
    ('Cucciolo',00007),
    ('Athos',00008),
    ('Pisolo',00009),
    ('Portos',00010);
    
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
    
/*INSERT INTO pagamento(username,codiceP) VALUES
	('Mammolo',111),
    ('Mammolo',112),
    ('Mammolo',113);*/


INSERT INTO possiede(username,numCarta) VALUES
	('Mammolo',1234321),
    ('Mammolo',5678765),
    ('Mammolo',3456543);


INSERT INTO spedizione(username,codiceIndirizzo) VALUES
	('Mammolo',01),
    ('Mammolo',04);