# Звіт до лабороторної 2
## Тема: Перетворення ER-діаграми на схему PostgreSQL
## Діаграма-ER від pgadmin
![diagram-er-pgadmin](/lab2/screenshots/pgadmin-diagrama.png)
## Результати select-запитів
+ User Table

![users](/lab2/screenshots/user-table.png)
+ Product Table

![products](/lab2/screenshots/product-table.png)
+ Supplier Table

![suppliers](/lab2/screenshots/supplier-table.png)
+ Category Table

![category](/lab2/screenshots/category-table.png)
+ Order Table

![orderss](/lab2/screenshots/order-table.png)
+ Review Table

![review](/lab2/screenshots/review-table.png)
+ OrderProduct Table

![order-product](/lab2/screenshots/orderProduct-table.png)
+ CartProduct Table

![cart-product](/lab2/screenshots/cartProduct-table.png)
## Список таблиць з стовбцями
User - Зберігає інформацію про зареєстрованих користувачів.
+ user_id (PK): Унікальний ідентифікатор користувача.
+ login, password: Дані для автентифікації.
+ adress, phone, email: Контактна інформація.
+ photo_url: Посилання на зображення профілю.

Product - Зберігає інформацію про товари в каталозі.
+ product_id (PK): Унікальний ідентифікатор товару.
+ name: Назва
+ description: Детальний опис
+ price: Поточна ціна товару.

Order - Зберігає загальну інформацію про замовлення.
+ order_id (PK): Унікальний ідентифікатор замовлення.
+ order_date: Дата та час створення замовлення.
+ status: Поточний статус (напр., "в обробці", "відправлено").
+ order_address: Адреса доставки для цього замовлення.

Review - Зберігає відгуки користувачів про товари.
+ review_id (PK): Унікальний ідентифікатор відгука.
+ evaluation: Числова оцінка (напр., від 1 до 5).
+ text: Текстовий коментар.
+ review_date: Дата публікації відгука.

Category - Довідник категорій товарів.
+ category_id (PK): Унікальний ідентифікатор категорії.
+ name: Назва категорії.

Supplier - Довідник постачальників товарів.
+ supplier_id (PK): Унікальний ідентифікатор постачальника.
+ name, phone, email: Назва та контактні дані.
+ logo_url: Посилання на логотип.

CartProduct(асоціативна сутність)
+ product_id (FK): Ідентифікатор товару.
+ user_id (FK): Ідентифікатор кошика.
+ amount: Кількість одиниць товару.

OrderProduct(асоціативна сутність)
+ product_id (FK): Ідентифікатор товару.
+ order_id (FK): Ідентифікатор замовлення.
+ amount: Кількість одиниць товару.
+ price: Ціна товару на момент покупки.
+ Order - Product (багато-до-багатьох через OrderProduct): Одне замовлення може включати багато товарів, і один товар може бути частиною багатьох різних замовлень. Таблиця OrderProduct фіксує, які товари, в якій кількості та за якою ціною були включені до конкретного замовлення.



