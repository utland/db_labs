# Звіт до лабороторної 3
## Тема: Маніпулювання даними SQL
### SQL-запити
Спочатку зробимо sql запит до таблиці "product", об'єднавши з "category" та "supplier"
```sql
select c.category_id, s.supplier_id, p.product_id, p.name as product, s.name as supplier, c.name as category 
from product p
left join supplier s using (supplier_id)
left join category c using (category_id)
```
Результат:
![select](/lab3/screenshots/select-p.png)

На основі отриманих даних зробимо UPDATE деяких колонок
```sql
update category set name = 'Електронні пристрої' where category_id = 1;

update supplier set name = 'Nash Format' where supplier_id = 4;

update product set name = 'Samsung Neo QLED', price = 35000 where product_id = 4;
```
Результат:
![update](/lab3/screenshots/select-upd-p.png)

Видалимо запис та записи з інших таблиць, які пов'язані відношенням 
```sql
delete from cart_product where product_id = 6;

delete from order_product where product_id = 6;

delete from product where product_id = 6;
```
Результат:
![delete](/lab3/screenshots/select-dl-p.png)

### Список таблиць з стовбцями
User - Зберігає інформацію про зареєстрованих користувачів
+ user_id (PK): Унікальний ідентифікатор користувача
+ login, password: Дані для автентифікації
+ adress, phone, email: Контактна інформаці
+ photo_url: Посилання на зображення профілю

Product - Зберігає інформацію про товари в каталозі.
+ product_id (PK): Унікальний ідентифікатор товару.
+ name: Назва
+ description: Детальний опис
+ price: Поточна ціна товару
+ supplier_id (FK): Зовнішній ключ, який посилається на таблицю supplier(supplier_id)
+ category_id (FK): Зовнішній ключ, який посилається на таблицю category(category_id)

Order - Зберігає загальну інформацію про замовлення
+ order_id (PK): Унікальний ідентифікатор замовлення
+ order_date: Дата та час створення замовлення
+ status: Поточний статус (напр., "в обробці", "відправлено")
+ order_address: Адреса доставки для цього замовлення
+ user_id (FK): Зовнішній ключ, який посилається на таблицю users

Review - Зберігає відгуки користувачів про товари
+ review_id (PK): Унікальний ідентифікатор відгука
+ evaluation: Числова оцінка (від 1 до 5)
+ text: Текстовий коментар
+ review_date: Дата публікації відгука
+ user_id (FK): Зовнішній ключ, який посилається на таблицю user(user_id)
+ product_id (FK): Зовнішній ключ, який посилається на таблицю product(product_id)

Category - Довідник категорій товарів.
+ category_id (PK): Унікальний ідентифікатор категорії.
+ name: Назва категорії.

Supplier - Довідник постачальників товарів.
+ supplier_id (PK): Унікальний ідентифікатор постачальника.
+ name, phone, email: Назва та контактні дані.
+ logo: Посилання на логотип.

CartProduct(асоціативна сутність)
+ product_id (FK): Ідентифікатор товару.
+ cart_id (FK): Ідентифікатор кошика.
+ amount: Кількість одиниць товару.

OrderProduct(асоціативна сутність)
+ product_id (FK): Ідентифікатор товару.
+ order_id (FK): Ідентифікатор замовлення.
+ amount: Кількість одиниць товару.
+ price: Ціна товару на момент покупки.

+ Order - Product (багато-до-багатьох через OrderProduct): Одне замовлення може включати багато товарів, і один товар може бути частиною багатьох різних замовлень. Таблиця OrderProduct фіксує, які товари, в якій кількості та за якою ціною були включені до конкретного замовлення.



