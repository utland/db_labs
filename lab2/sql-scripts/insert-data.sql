insert into users (login, password, address, phone, email, photo_url) values 
('utland', '0000', 'м. Київ, вул. Хрещатик, 21, кв. 5', '+49 23 548 438', 'utland@gmail.com', null),
('sizonenko', '1111', null, '+9 875 238 540', 'sizonenko@gmail.com', null),
('ilya', '7842', 'м. Львів, пл. Ринок, 10', '+380 73 834 747', 'ilya@gmail.com', null),
('john', 'fhwjkhhk938', 'м. Київ, пр. Перемоги, 45, офіс 301', '+1 348 3478 34', 'freedom000@gmail.com', 'https://www.dreamstime.com/royalty-free-stock-photography-typical-american-college-teenager-image20227417');

insert into supplier (name, phone, email, logo_url) values
('Apple Inc.', '+18002752273', 'contact@apple.com', 'http://example.com/logos/apple.png'),
('Roshen', '+380443338000', 'info@roshen.com.ua', 'http://example.com/logos/roshen.png'),
('Eldorado', '+380444998877', 'support@eldorado.ua', 'http://example.com/logos/eldorado.png'),
('Наш Формат', '+380443609890', 'office@nashformat.ua', null);

insert into category (name) values
('Смартфони'),
('Солодощі'),
('Книги'),
('Побутова техніка');

insert into product (name, price, description, supplier_id, category_id) values
('Смартфон Apple iPhone 15 Pro', 45000, 'Новий флагман з титановим корпусом та процесором A17 Bionic.', 1, 1),
('Шоколад "Чайка"', 45, 'Класичний чорний шоколад від українського виробника.', 2, 2),
('Книга "Атлант розправив плечі"', 550, 'Бестселер Айн Ренд у трьох томах, український переклад.', 4, 3),
('Телевізор Samsung Neo QLED', 32500, 'Телевізор з діагоналлю 55 дюймів та роздільною здатністю 4K.', 3, 4),
('Цукерки "Вечірній Київ"', 250, 'Подарункова коробка шоколадних цукерок з цілим фундуком.', 2, 2),
('Книга "1984"', 400, 'Класика антиутопії від Дж. Орвелла', 4, 3);

insert into orders (order_date, status, order_address, user_id) values
('2025-10-15', 'completed', 'м. Київ, вул. Хрещатик, 21, кв. 5', 1),
('2025-10-18', 'in process', 'м. Львів, пл. Ринок, 10', 3),
('2025-10-15', 'completed', 'м. Київ, пр. Перемоги, 45, офіс 301', 4),
('2025-11-19', 'waiting', 'м. Київ, пр. Перемоги, 45, офіс 301', 4),
('2025-12-08', 'completed', 'м. Одеса, вул. Дерибасівська, 1', 2),
('2025-10-20', 'cancelled', 'м. Одеса, вул. Дерибасівська, 1', 2);

insert into order_product (order_id, product_id, amount, price) values
(1, 1, 1, 45000),
(2, 2, 5, 45),
(2, 5, 2, 250),
(2, 3, 1, 550),
(3, 5, 3, 250),
(4, 3, 2, 550),
(6, 4, 2, 32500),
(5, 1, 1, 45000);

insert into cart_product (user_id, product_id, amount) values
(1, 2, 4),
(3, 6, 2),
(2, 1, 1);

insert into review (user_id, product_id, evaluation, comment, review_date) values
(1, 1, 5, 'Чудовий телефон! Дуже швидкий та стильний. Камера просто неймовірна.', '2025-11-01'),
(2, 3, 4, 'Смачний шоколад, як у дитинстві. Але хотілося б трохи менше цукру.', '2025-10-05'),
(4, 5, 5, 'Книга, яка змінює світогляд. Якість друку та перекладу на висоті!', '2025-11-22');