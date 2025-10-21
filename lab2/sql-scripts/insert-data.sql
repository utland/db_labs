insert into users (login, password, address, phone, email, photoURL) values 
("utland", "0000", "м. Київ, вул. Хрещатик, 21, кв. 5", "+49 23 548 38438", "utland@gmail.com", null),
("sizonenko", "1111", null, "+9 875 238 540", "sizonenko@gmail.com", null),
("ilya", "7842", "м. Львів, пл. Ринок, 10", "+380 973 834 7347", "ilya@gmail.com", null),
("john", "fhwjkhhk938", "м. Київ, пр. Перемоги, 45, офіс 301", "+1 348 3478 34", "freedom000@gmail.com", "https://www.dreamstime.com/royalty-free-stock-photography-typical-american-college-teenager-image20227417"),

insert into supplier (name, phone, email, logo) values
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
('Смартфон Apple iPhone 15 Pro', 45000, 'Новий флагман з титановим корпусом та процесором A17 Bionic.', 17, 21),
('Шоколад "Чайка"', 45, 'Класичний чорний шоколад від українського виробника.', 18, 22),
('Книга "Атлант розправив плечі"', 550, 'Бестселер Айн Ренд у трьох томах, український переклад.', 20, 23),
('Телевізор Samsung Neo QLED', 32500, 'Телевізор з діагоналлю 55 дюймів та роздільною здатністю 4K.', 19, 24),
('Цукерки "Вечірній Київ"', 250, 'Подарункова коробка шоколадних цукерок з цілим фундуком.', 18, 22);

insert into orders (order_date, status, adress, user_id) values
('2025-10-15', 'completed', 'м. Київ, вул. Хрещатик, 21, кв. 5', 17),
('2025-10-18', 'in process', 'м. Львів, пл. Ринок, 10', 19),
('2025-10-19', 'waiting', 'м. Київ, пр. Перемоги, 45, офіс 301', 20),
('2025-10-20', 'cancelled', 'м. Одеса, вул. Дерибасівська, 1', 18);

insert into order_product (order_id, product_id, amount, price) values
(1, 26, 1, 45000),
(2, 27, 5, 45),
(2, 28, 1, 550),
(3, 30, 3, 250);
(4, 28, 2, 550);

insert into cart_product (user_id, product_id, amount) values
(17, 29, 1),
(18, 26, 1),
(18, 30, 2);

insert into review (user_id, product_id, evaluation, comment, review_date) values
(17, 1, 5, 'Чудовий телефон! Дуже швидкий та стильний. Камера просто неймовірна.', '2025-10-17'),
(18, 2, 4, 'Смачний шоколад, як у дитинстві. Але хотілося б трохи менше цукру.', '2025-10-05'),
(20, 3, 5, 'Книга, яка змінює світогляд. Якість друку та перекладу на висоті!', '2025-09-22');