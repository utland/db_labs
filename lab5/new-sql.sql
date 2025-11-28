create table if not exists tag (
	tag_id serial primary key,
	tag_name varchar(20) not null
);

create table if not exists channel_tag (
	tag_id integer not null references tag(tag_id),
	channel_id integer not null references channel(channel_id),
	primary key(tag_id, channel_id)
);

create table if not exists channel (
	channel_id serial primary key,
	channel_name varchar(30) not null,
	logo_url text not null
);

create table if not exists post (
	post_id serial primary key,
	title varchar(50) not null,
	description text not null,
	channel_id integer not null references channel(channel_id)
)

create table if not exists comment (
	comment_id serial primary key,
	customer_id integer not null references customer(customer_id),
	post_id integer not null references post(post_id),
	comment_text text not null,
)

create table if not exists customer (
	customer_id serial primary key,
	login varchar(20) not null unique,
	password varchar(60) not null,
	address varchar(50),
	email varchar(25) not null unique,
	photoURL text,
	customer_name varchar(30) not null
);

create table if not exists customer_channel (
    customer_id integer not null references customer(customer_id),
	channel_id integer not null references channel(channel_id),
	primary key(order_id, product_id),
);
