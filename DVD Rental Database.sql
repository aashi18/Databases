create database rentdvds;
use rentdvds;
create table filmcategory
(
	filmid smallint not null auto_increment,
    categoryid tinyint not null,
    lastupdate timestamp,
    primary key(filmid,categoryid)
);
create table lang
(
	languageid tinyint not null auto_increment,
	namee varchar(50),
	lastupdate timestamp,
	primary key(languageid)
);
create table inventory
(
	inventoryid mediumint not null auto_increment,
	filmid smallint,
	storeid int,
    lastupdate timestamp,
	primary key(inventoryid)
	
);
create table rental
(
	rentalid int not null auto_increment,
	rentaldate datetime,
	inventoryid mediumint,
	customerid smallint,
	returndate datetime,
	staffid tinyint,
	lastupdate timestamp,
	primary key(rentalid)
	
);
create table category
(
	categoryid tinyint,
    namee varchar(50),
	lastupdate timestamp,
    primary key(categoryid)
);
create table film
(	
	filmid smallint not null auto_increment,
	title  varchar(255) not null,
	description text,
	releaseyear year,   
	languageid  tinyint not null,
	originallanguageid tinyint,
	rentalduration  tinyint not null,
	rentalrate decimal(4,2),        
	length smallint not null,
	replacementcost decimal(5,2),
	rating enum("Great","Good","Fine","Okay","Not Bad","Bad"),
	specialfeatures set("Trailers","Comments","Deleted Scenes","Behind the Scenes"),
	lastupdate timestamp,         
	primary key(filmid),
	foreign key(languageid) references lang(languageid)
);
create table store
(
	storeid int not null auto_increment,
	staffid tinyint not null,
	addressid smallint not null,
	lastupdate timestamp,
	primary key(storeid)
);
create table payment
(
	paymentid smallint not null auto_increment,
	customerid smallint not null,
	staffid tinyint not null,
	rentalid int not null,
	amount decimal(5,2),
	paymentdate datetime,
	lastupdate timestamp,
	primary key(paymentid)
	
);
create table customer
(
	customerid smallint not null auto_increment,
	storeid int not null,
	firstname varchar(45),
	lastname varchar(45),
	email varchar(50),
	addressid smallint not null,
	active tinyint,
	createdate datetime,
	lastupdate timestamp,
	primary key(customerid)
	
);
create table actor
(
	actorid smallint not null auto_increment,
	firstname varchar(45),
	lastname varchar(45),
	lastupdate timestamp,
	primary key(actorid)
);
create table filmactor
(
	actorid smallint not null,
	filmid smallint not null,
	lastupadte timestamp,
	primary key(actorid,filmid)
);
create table filmtext
(
	filmid smallint not null auto_increment,
	title varchar(255),
	description text,
	primary key(filmid)
);
create table staff
(
	staffid tinyint not null auto_increment,
	firstname varchar(45),
	lastname varchar(45),
	addressid smallint not null,
	picture blob,
	email varchar(50),
	storeid int,
	active tinyint,
	username varchar(50),
	password varchar(50),
	lastupdate timestamp,
	primary key(staffid)
);
create table address
(
	addressid smallint not null auto_increment,
	address varchar(50),
	address2 varchar(50),
	district varchar(50),
	cityid smallint,
	postalcode varchar(10),
	phone varchar(20),
	lastupdate timestamp,
	primary key(addressid)
	
);
create table city
(
	cityid smallint not null auto_increment,
	city varchar(50),
	countryid smallint not null,
	lastupdate timestamp,
	primary key(cityid)
	
);
create table country
(
	countryid smallint not null auto_increment,
	country varchar(50),
	lastupdate timestamp,
	primary key(countryid)
);
use rentdvds;
alter table inventory
add foreign key(filmid) references film(filmid),
add foreign key(storeid) references store(storeid);

alter table rental
add foreign key(inventoryid) references inventory(inventoryid),
add	foreign key(customerid) references customer(customerid),
add foreign key(staffid) references staff(staffid);

alter table payment
add foreign key(customerid) references customer(customerid),
add	foreign key(staffid) references staff(staffid),
add	foreign key(rentalid) references rental(rentalid);
alter table store
add foreign key(staffid) references staff(staffid),
add	foreign key(addressid) references address(addressid);


alter table customer
add foreign key(storeid) references store(storeid),
add foreign key(addressid) references address(addressid);
alter table customer 
modify column storeid int not null;
alter table staff 
modify column storeid int;

alter table staff
add foreign key(addressid) references address(addressid),
add	foreign key(storeid) references store(storeid);

alter table address
add foreign key(cityid) references city(cityid);

alter table city
add foreign key(countryid) references country(countryid);



   
	
	
	
	

	
	
	
	











	