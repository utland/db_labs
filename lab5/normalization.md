# Звіт до лабороторної 5
## Тема: Нормалізація бази даних 

## User Table
```sql
create table if not exists users (
    user_id serial primary key,
	login varchar(20) not null unique,
	password varchar(60) not null,
	address varchar(50),
	phone varchar(15) not null,
	email varchar(25) not null unique,
	photoURL text
);
```
### Функціональня залежність
+ user_id -> login, password, address, phone, email, photoURL
+ login -> user_id, password, address, phone, email, photoURL
+ email -> user_id, password, address, phone, email, photoURL

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK простий, частокова залежність неможлива
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

## Order Table 
```sql
create table if not exists orders (
    order_id serial primary key,
	order_date date not null,
	status order_status not null,
	address varchar(50) ,
	user_id integer not null references users(user_id)
);
```
### Функціональня залежність
+ order_id -> order_date, status, address, user_id

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK простий, частокова залежність неможлива
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

## Supplier Table 
```sql
create table if not exists supplier (
    supplier_id serial primary key,
	name varchar(50) not null,
	phone varchar(15) not null,
	email varchar(20) not null,
	logo text
);
```
### Функціональня залежність
+ supplier_id -> name, phone, email, logo

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK простий, частокова залежність неможлива
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

## Category Table 
```sql
create table if not exists category (
    category_id serial primary key,
	name varchar(20) not null
);
```
### Функціональня залежність
+ category_id -> name

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK простий, частокова залежність неможлива
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

## Product Table 
```sql
create table if not exists product (
    product_id serial primary key,
	name varchar(30) not null,
	price integer not null check (price > 0),
	description text not null,
	supplier_id integer not null references supplier(supplier_id),
	category_id integer not null references category(category_id)
);
```
### Функціональня залежність
+ product_id -> name, price, description, supplier_id, category_id

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK простий, частокова залежність неможлива
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

## Review Table 
```sql
create table if not exists review (
    review_id serial primary key,
	user_id integer not null references users(user_id),
	product_id integer not null references product(product_id),
	evaluation smallint not null check (evaluation >= 1 and evaluation <= 5),
	comment text,
	review_date date not null
);
```
### Функціональня залежність
+ review_id -> evaluation, comment, review_date, user_id, product_id

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK простий, частокова залежність неможлива
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

## OrderProduct Table 
```sql
create table if not exists order_product (
    order_id integer not null references orders(order_id),
	product_id integer not null references product(product_id),
	primary key(order_id, product_id),
	amount integer not null check (amount > 0),
	price integer not null check (price > 0)
);
```
### Функціональня залежність
+ (order_id, product_id) -> amount, price

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK складений, жодний неключовий атрибут не залежить тільки від одного ключа, часткова залежність відсутня
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

## CartProduct Table 
```sql
create table if not exists cart_product (
    user_id integer not null references users(user_id),
	product_id integer not null references product(product_id),
	amount integer not null check (amount > 0)
);
```
### Функціональня залежність
+ (user_id, product_id) -> amount

### Перевірка критеріїв
+ 1NF - усі атрибути є атомарними, повторюваних стовпців немає
+ 2NF - PK складений, жодний неключовий атрибут не залежить тільки від одного ключа, часткова залежність відсутня
+ 3NF - транзитивна залежність відсутня, жоден неключовий атрибут не залежить від іншого

---
