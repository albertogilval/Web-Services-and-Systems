CREATE TABLE Usuario (
	aliasPropio VARCHAR(40),
	nombre VARCHAR(15),
	apellidos VARCHAR(20),
	foto VARCHAR(20),
	sexo INT,
	contrasenya VARCHAR(15),
	correo VARCHAR(30),
	moderador BOOLEAN,
	lugar VARCHAR (20),
	PRIMARY KEY(aliasPropio)
);

CREATE TABLE Aporte (
	id INT NOT NULL AUTO_INCREMENT,
	titulo VARCHAR(50),
	cuerpo VARCHAR(2048),
	fecha DATE,
	tipo VARCHAR(15),
	aliasU VARCHAR(15),
	img VARCHAR(50),
	PRIMARY KEY(id),
	FOREIGN KEY(aliasU) REFERENCES Usuario(aliasPropio) ON DELETE CASCADE
);

CREATE TABLE Valoracion (
    valoracion INT,
    aliasU VARCHAR(15),
    idA INT,
    PRIMARY KEY (aliasU, idA),
    FOREIGN KEY (aliasU) REFERENCES Usuario (aliasPropio) ON DELETE CASCADE,
    FOREIGN KEY (idA) REFERENCES Aporte (id) ON DELETE CASCADE
);

CREATE TABLE Suscripcion(
  aliasU  VARCHAR(15),
  aliasU2  VARCHAR(15),
  PRIMARY KEY(aliasU, aliasU2),
  FOREIGN KEY(aliasU) REFERENCES Usuario(aliasPropio),
  FOREIGN KEY(aliasU2) REFERENCES Usuario(aliasPropio)
);

CREATE TABLE Comentario (
    id INT NOT NULL AUTO_INCREMENT,
    idA INT,
    cuerpo VARCHAR(150),
    fecha DATE,
    idU VARCHAR(15),
    PRIMARY KEY (id),
    FOREIGN KEY (idA) REFERENCES Aporte (id) ON DELETE CASCADE,
    FOREIGN KEY (idU) REFERENCES Usuario (aliasPropio) ON DELETE CASCADE
);

CREATE TABLE Etiqueta (
	id INT NOT NULL AUTO_INCREMENT,
	idA INT,
	cuerpo VARCHAR(10),
	PRIMARY KEY (id),
	FOREIGN KEY (idA) REFERENCES Aporte (id) ON DELETE CASCADE
);

CREATE TABLE Imagen (
	id INT,
	idA INT,
	PRIMARY KEY (id),
	FOREIGN KEY (idA) REFERENCES Aporte (id) ON DELETE CASCADE
);


INSERT INTO Usuario (aliasPropio, nombre, apellidos, foto, sexo, contrasenya, correo, moderador,lugar) values ('I like trains', 'Pepe', 'Garcia', 'I_like_trains.jpg', 1, '1234', 'ejemplo@dominio.com', FALSE, 'Valladolid');
INSERT INTO Usuario (aliasPropio, nombre, apellidos, foto, sexo, contrasenya, correo, moderador,lugar) values ('mineturtle', 'Tom', 'Ska', 'Tom.jpg', 1, '1234', 'ejemplo2@dominio.com', FALSE, 'Madrid');
INSERT INTO Usuario (aliasPropio, nombre, apellidos, foto, sexo, contrasenya, correo, moderador,lugar) values ('I like boats', 'Tom', 'Ska', 'boats.jpg', 1, '1234', 'ejemplo3@dominio.com', FALSE, 'Valencia');
INSERT INTO Usuario (aliasPropio, nombre, apellidos, foto, sexo, contrasenya, correo, moderador,lugar) values ('The orb', 'Tom', 'Ska', 'orb.jpg', 1, '1234', 'ejemplo4@dominio.com', FALSE, 'Valladolid');

INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Hypno', 'Casi todos conoceremos a Drowzee, un Pokémon carismático y alegre. Bien, si conocemos a Drowzee,	también conoceremos su evolución: Hypno. Hypno ha sido visto en capítulos de Pokémon y juegos de la misma saga.	Uno de los sucesos más recordados de este Pokémon es el caso de Pedrita, una niña de Isla Secunda. ', '2017-04-29', 'Creepypasta', 'I like trains','Hypnos.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Isaac es el verdadero enemigo en su propio juego', 'The Binding of Isaac es un juego de acción RPG con fuertes elementos de tipo Roguelike, en el cual los niveles son generados aleatoriamente. En el transcurso del viaje de un niño llamado Isaac ', '2017-04-29', 'Creepypasta', 'I like trains','isaac.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Pokemon es todo un sueño', 'Pokémon ( Pokemon?) es una franquicia, que originalmente comenzó como un videojuego RPG,	pero debido a su popularidad ha logrado expandirse a otros medios de entretenimiento como series de televisión, ', '2017-04-29', 'Creepypasta', 'I like trains','pikachu.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Talking angela, un videojuego peligroso', 'Como muchos ya sabrán, en las redes sociales hay una aplicación llamada "Talking Angela": te hace preguntas y tú a ella, igual que el famoso programa "Cleverbot", en que tú hablas con un robot de Internet. ', '2017-04-29', 'Creepypasta', 'I like trains','angela.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Dark Link', 'Lo admito, fue una mala idea. He leído las historias en Internet, y sé que debería saber mejor que nadie que comprar un cartucho para Nintendo 64 en una tienda extraña en el medio de la nada es mala idea. Pero bueno, esa parecía una vieja tienda regular. Nada sospechosa, sin carteles espeluznantes o empleados raros. ', '2017-04-29', 'Creepypasta', 'I like trains','link.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Herobrine', 'Hace poco, había creado un nuevo mundo para un jugador en Minecraft. Todo era normal al principio, cuando comencé a talarherobrineárboles para fabricar una mesa de trabajo. Me di cuenta de que algo se movía entre la densa niebla.', '2017-04-29', 'Creepypasta', 'I like trains','herobrine.jpg');

INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Assassins Creed 2 Pulpo Gigante', 'Aunque este es un juego no oficial de la xbox, tiene un secreto bastante interesante, solo consiste en ingresar a una de las Asassins tomb (visitaziones secret) hay un cuarto hasta el fondo del lugar donde se encuentra un mecanismo para activar unas palancas que nos sirven para movernos, pero al activarlas comenzará a moverse', '2017-04-29', 'Easteregg', 'I like trains','creed2.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Adventure "El Primer Huevo de Pascua', 'Adventure fue un juego desarrollado para el atari 2600 y es considerado el primer juego de acción y aventura, además de contener el primer easter egg en la historia de los video juegos; el easter egg se conseguía dentro de las catacumbas del castillo negro ', '2017-04-29', 'Easteregg', 'I like trains','adventure.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Halo 3 - Password', 'La saga de Halo es de las mas numerosas en cuanto a easter eggs (craneos  ) pero en Halo 3 hay una escena en la que uno de nuestros aliados intenta entrar a una habitación, pero desde adentro otra voz le responde que necesita decir la contraseña (password) ofreciendonos una escena muy divertida.', '2017-04-29', 'Easteregg', 'I like trains','halo3.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values (' Left 4 Dead 2 - Midnight Riders Tour Bus', 'En la saga de Left 4 Dead, the Midnight Riders son una banda que al parecer son de los pocos sobrevivientes del apocalipsis zombie, en la segunda parte de este juego hay un momento en donde se encuentra un tren abandonado ', '2017-04-29', 'Easteregg', 'I like trains','tainl4d2.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('GTA IV - Corazón de la ciudad', 'atravesado fronteras y que además esta lleno de secretos el mas asombroso podría ser el que se encuentra	en la isla feliz justo dentro de la estatua que parodia a la estatua de la libertad, para ingresar tendrás que robar un helicoptero para poder llegar a lo alto de la estatua justo donde hay unas puertas', '2017-04-29', 'Easteregg', 'I like trains','heart_of_liberty.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Sega se burlaba de Nintendo en sus juegos de Sonic ', 'Sonic The Hedgehog ( Sonikku za Hejjihoggu?, lit. Sonic el erizo) es un personaje de videojuegos y la mascota creada por y para Sega. Es el personaje principal de la saga con su mismo nombre; también está presente en cómics, dibujos animados y libros. ', '2017-04-29', 'Easteregg', 'I like trains','sonic.jpg');

INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('La saga Dark Souls la mas dificil existente', 'Dark Souls tiene lugar en el reino ficticio de Lordran. Los jugadores toman el papel de un personaje humano semimuerto que ha sido elegido para realizar un peregrinaje para descubrir el destino de los no muertos. ', '2017-04-29', 'Curiosidades', 'I like trains','dark_souls.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Curiosidad sobre la máscara de Majora', 'The Legend of Zelda (Zeruda no Densetsu?) es una serie de videojuegos de acción-aventura creada por los diseñadores japoneses Shigeru Miyamoto y Takashi Tezuka, 1 y desarrollada por Nintendo, empresa que también se encarga de su distribución','2017-04-29', 'Curiosidades', 'I like trains','link.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Rumores sobre una remasterización', 'Jak and Daxter es una serie de videojuegos creada por Naughty Dog. Hay tres juegos de la serie principal y tres spin-off, aunque éstos también se consideran parte del argumento de la serie principal.','2017-04-29', 'Curiosidades', 'I like trains','jak-and-daxter.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Nueva manera de desbloquear circuito secreto', 'Y es que si bien sabíamos que Obélix se cayó en la marmita de la poción mágica cuando era pequño («Siempre el mismo cuento!», como dice a menudo mi abuela.','2017-04-29', 'Curiosidades', 'I like trains','asterix.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('El otro dia dijo wismichu', 'Y resulta que empieza siempre los videos como decia Obelix el barbaro como Ovax que se cayó en la marmita de la poción mágica cuando era pequño (Siempre el mismo cuento, como dice a menudo mi abuela.', '2017-04-29', 'Curiosidades', 'I like trains','stuntman.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Kratos el dios de la vida',  'Al querer romper el pacto de sangre con Ares, las furias, encargadas de castigar a los que cometieran dicha acción, comenzaron a hacerle ver visiones a Kratos. Orkos, hijo de las furias, traiciona a sus madres y a su padre, Ares, al descubrir que planeaban destronar a Zeus del mandato del Olimpo',  '2017-04-29', 'Curiosidades', 'I like trains','gow.jpg');

INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Ace sobrevivió', 'Portgas D. Ace (Potogasu D. Esu?) cuyo nombre original al nacer fue Gol D. Ace (Goru D. Esu?), fue el hijo de Gol D. Roger, el hombre que se convirtió en el Rey de los Piratas, y su amante Portgas D. Rouge. En su infancia pasaría a convertirse en el hermano mayor adoptivo de Monkey D. Luffy y Sabo', '2017-04-29', 'Teoria', 'I like trains','ace.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Hatoful Boyfriend esta basado en la vida real', 'Hatoful Boyfriend: A School of Hope and White Wings(Japanese: Hepburn: Hatofuru kareshi ~kibo no gakuen to shiroi tsubasa~?) is a Japanese dojin soft otome visual novel released in 2011 for Microsoft Windows and OS X.', '2017-04-29', 'Teoria', 'I like trains','paloma.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Super Mario Bros 3 obra de teatro', 'Super Mario Bros. 3 (Supa Mario Burazazu Suri?, también conocido como Mario 3, Super Mario 3 y SMB3) es el último videojuego de plataformas de la franquicia Mario para la consola Nintendo Entertainment System.', '2017-04-29', 'Teoria', 'I like trains','mario.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Mente maestra detrás del Kingdom Hearts ', 'Kingdom Hearts (Kingudamu Hatsu?) es el nombre de la serie de videojuegos, perteneciente al género de juegos de rol de acción, desarrollado y publicado por Square Enix.', '2017-04-29', 'Teoria', 'I like trains','Kingdom_Hearts.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Worms denunciado por violencia a los gusanos ', 'Worms es un videojuego de estrategia militar por turnos desarrollado por Team17 y lanzado en 1995. Es el primer juego de la saga de videojuegos Worms.', '2017-04-29', 'Teoria', 'I like trains','worms.jpg');
INSERT INTO Aporte (titulo, cuerpo, fecha, tipo, aliasU, img) values ('Leon Squall murio después del primer disco ', 'Final Fantasy VIII (Fainaru Fantaji Eito) es un videojuego de tipo RPG desarrollado por Squaresoft en 1999 para el sistema PlayStation, aunque posteriormente salió una versión para PC. Es la octava entrega de la serie de videojuegos Final Fantasy y el primero en contar con un tema musical cantado para el juego.', '2017-04-29', 'Teoria', 'I like trains','squall.jpg');





INSERT INTO Etiqueta (idA, cuerpo) values (6, 'SaludoA');
INSERT INTO Etiqueta (idA, cuerpo) values (6, 'SaludoE');
INSERT INTO Etiqueta (idA, cuerpo) values (5, 'SaludoTick');

INSERT INTO Etiqueta (idA, cuerpo) values (12, 'SaludoAe');
INSERT INTO Etiqueta (idA, cuerpo) values (12, 'SaludoEX');
INSERT INTO Etiqueta (idA, cuerpo) values (11, 'Saludocko');

INSERT INTO Etiqueta (idA, cuerpo) values (18, 'SaludoAe');
INSERT INTO Etiqueta (idA, cuerpo) values (18, 'SaludoEX');
INSERT INTO Etiqueta (idA, cuerpo) values (17, 'SaludoTio');

INSERT INTO Etiqueta (idA, cuerpo) values (24, 'SaludoAe');
INSERT INTO Etiqueta (idA, cuerpo) values (24, 'SaludoEX');
INSERT INTO Etiqueta (idA, cuerpo) values (23, 'SaludoTko');

INSERT INTO Valoracion(valoracion, aliasU, idA) values (1, 'mineturtle', 1);
INSERT INTO Valoracion(valoracion, aliasU, idA) values (1, 'The orb', 1);
