use bikestores

create SCHEMA production;
Go
create SCHEMA sales;
Go

Create table production.categories(
	category_id int IDENTITY (1,1) Primary key,
	category_name NVARCHAR (300) not NULL,

);

Create table production.brands (
	brand_id INT IDENTITY (1,1) Primary key,
	brand_Name Varchar (255) not null
);

Create table production.products(
	product_id int identity (1,1) primary key,
	product_name varchar(255) not null,
	brand_id int not null ,
	category_id int not null ,
	model_year smallint not null ,
	list_price decimal (10,2) not null,
	FOREIGN key (category_id) references production.categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN key (brand_id) references production.brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
	);

create table sales.customers(
	customer_id int identity (1,1) primary key,
	frist_name varchar (255) not null,
	last_name varchar (255) not null,
	phone varchar (25),
	email varchar (255) not null,
	street varchar (255),
	city varchar (50),
	state varchar (25),
	zip_code varchar (5)

);

create table sales.stores(
	store_id int identity (1,1) primary key,
	store_name varchar (255) not null,
	phone varchar (25),
	email varchar (255),
	street varchar (255),
	city varchar (255),
	state varchar (10),
	zip_code varchar (5)
);

CREATE TABLE sales.staffs (
	staff_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25) ,
	active tinyint NOT NULL,
	store_id INT NOT NULL,
	manager_id INT,
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION 
);

CREATE TABLE sales.orders (
order_id INT IDENTITY (1, 1) PRIMARY KEY,
customer_id INT,
order_status tinyint NOT NULL,
order_date DATE NOT NULL,
required_date DATE NOT NULL,
shipped_date DATE,
store_id INT NOT NULL,
staff_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES sales.customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (staff_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE sales.order_items (
order_id INT,
item_id INT,
product_id INT NOT NULL,
quantity INT NOT NULL,
list_price DECIMAL (10, 2) NOT NULL,
discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
PRIMARY KEY (order_id, item_id),
FOREIGN KEY (order_id) REFERENCES sales.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE production.stocks (
store_id INT,
product_id INT,
quantity INT,
PRIMARY KEY (store_id, product_id),
FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);