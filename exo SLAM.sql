-- Création de la BD
drop database if exists art_com;
create database art_com;
use art_com;

-- création des tables : 
create table articles(	
	id integer auto_increment,	
	nom varchar(20) not null,
	description varchar(100) not null,	
	prix integer not null,
	primary key(id)
) engine innoDB;

create table clients(	
	id integer auto_increment,	
	nom varchar(20) not null,
	mail varchar(40) not null,	
	primary key(id)
)engine innoDB;

create table commandes(	
	id integer auto_increment,	
	date_commande date not null,
	date_livraison date,	
	id_client integer not null,
	primary key(id)
)engine innoDB;

alter table commandes
add foreign key
(id_client) references clients(id);

create table commandes_articles(	
	id_commande integer not null,	
	id_article integer not null,
	quantite integer not null,	
	prix_unitaire integer not null,
	primary key(id_commande, id_article)
)engine innoDB;

alter table commandes_articles
add foreign key
(id_commande) references commandes(id);

alter table commandes_articles
add foreign key
(id_article) references articles(id);
