create table if not exists users (
    user_id serial primary key,
	login varchar(20) not null,
	password varchar(60) not null,
	address varchar(50),
	phone varchar(30) not null,
	email varchar(50) not null,
	photo_url text
);

create type order_status as enum ('waiting', 'in process', 'completed', 'cancelled');

create table if not exists orders (
    order_id serial primary key,
	order_date date not null,
	status order_status not null,
	order_address varchar(50) ,
	user_id integer not null references users(user_id)
);

create table if not exists supplier (
    supplier_id serial primary key,
	name varchar(50) not null,
	phone varchar(15) not null,
	email varchar(20) not null,
	logo_url text
);

create table if not exists category (
    category_id serial primary key,
	name varchar(20) not null
);

create table if not exists product (
    product_id serial primary key,
	name varchar(30) not null,
	price integer not null check (price > 0),
	description text not null,
	supplier_id integer not null references supplier(supplier_id),
	category_id integer not null references category(category_id)
);

create table if not exists order_product (
    order_id integer not null references orders(order_id),
	product_id integer not null references product(product_id),
	primary key(order_id, product_id),
	amount integer not null check (amount > 0),
	price integer not null check (price > 0)
);

create table if not exists cart_product (
    user_id integer not null references users(user_id),
	product_id integer not null references product(product_id),
	amount integer not null check (amount > 0)
);

create table if not exists review (
    review_id serial primary key,
	user_id integer not null references users(user_id),
	product_id integer not null references product(product_id),
	evaluation smallint not null check (evaluation >= 1 and evaluation <= 5),
	comment text,
	review_date date not null
);