create database db1;
use db1;
create table customers
(
      customerno int not null auto_increment,
	  customername varchar(100),
      contactlastname varchar(100),
      contactfirstname varchar(100),
      phone char(10),
      addressline1 varchar(200),
	  addressline2 varchar(200),
      city varchar(100),
      state varchar(100),
      postalcode int,
      country varchar(100),
      salesrepemployeeno bigint,
      creditlimit bigint,
      primary key(customerno),
      foreign key(salesrepemployeeno) references employees(employeeno)
);

create table products
(
	  productcode int not null auto_increment,
      productname varchar(200),
      productline bigint,
      productscale bigint,
	  productvendor varchar(200),
      productdescription text,
      quantityinstock int,
	  buyprice int,
      msrp int,
      primary key(productcode),
	  foreign key(productline) references productlines(productline)
	  
);
create table productlines
(
      productline bigint not null auto_increment,
      textdescription text,
      htmldescription text,
      image blob,
	  primary key(productline)
);
create table orders
(
	  orderno int not null auto_increment,
      orderdate date,
      requireddate date,
      shippeddate date,
	  statuss text,
      comments text,
      customerno int,
      primary key(orderno),
	  foreign key(customerno) references customers(customerno)
);
create table orderdetails
(
	  orderno int not null auto_increment,
      productcode bigint not null,
      quantityordered int,
      priceeach int,
      orderlineno int,
      primary key(orderno , productcode)
);
create table payments
(
	  customerno int not null,
      checkno int not null,
      paymentdate date,
      amount int,
      primary key(customerno,checkno)
);
create table employees
(
	   employeeno bigint not null auto_increment,
       lastname varchar(100),
	   firstname varchar(100),
	   extension varchar(100),
       email text,
       officecode bigint,
       reportsto int,
	   jobtitle tinytext,
       primary key(employeeno),
	   foreign key(officecode) references offices(officecode)
);
create table offices
(
       officecode bigint not null,
	   city varchar(100),
       phone bigint,
       addressline1 varchar(200),
       addressline2 varchar(200),
       state varchar(100),
       country varchar(100),
	   postalcode int,
       territory varchar(100),
	   primary key(officecode)
);
  
       

	  
	  
      
      



	