-- Создание таблицы clients
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 0),
    city VARCHAR(50)
);

-- Создание таблицы orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    price DECIMAL(10, 2) CHECK (price >= 0),
    order_client_id INT NOT NULL,
    place VARCHAR(100) NOT NULL,
    FOREIGN KEY (order_client_id) REFERENCES clients(client_id)
);

-- Создание таблицы tickets
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    ticket_client VARCHAR(50) NOT NULL,
    csat INT CHECK (csat BETWEEN 1 AND 5),
    text TEXT,
    date DATE NOT NULL,
    ticket_order_id INT NOT NULL,
    FOREIGN KEY (ticket_client) REFERENCES clients(username),
    FOREIGN KEY (ticket_order_id) REFERENCES orders(order_id)
);

-- Вставка данных в таблицу clients
INSERT INTO clients VALUES
(1, 'abrakadabra', 'Сергей', 25, 'Нижний Новгород'),
(2, 'tralalalotralala', 'Иван', 18, 'Тверь'),
(3, 'superbloger', 'Андрей', 28, 'Уфа'),
(4, 'TechBridge', 'Артем', 28, 'Санкт-Петербург'),
(5, 'FoodGrid', 'Ольга', 37, 'Новосибирск'),
(6, 'UrbanEats', 'Дмитрий', 41, 'Казань'),
(7, 'GastroLux', 'Елена', 22, 'Сочи'),
(8, 'QuickBite', 'Игорь', 31, 'Владивосток'),
(9, 'FreshMeal', 'Светлана', 29, 'Екатеринбург'),
(10, 'PrimeDish', 'Роман', 45, 'Ростов-на-Дону');

-- Вставка данных в таблицу orders
INSERT INTO orders VALUES
(1, 1590.00, 1, 'Теремок'),
(2, 3999.00, 2, 'Вкусно и точка'),
(3, 580.00, 3, 'Евразия'),
(4, 2750.00, 4, 'Burger Heroes'),
(5, 4320.00, 5, 'Шоколадница'),
(6, 1890.00, 6, 'Якитория'),
(7, 3450.00, 7, 'Макдоналдс'),
(8, 5100.00, 8, 'KFC'),
(9, 1275.00, 9, 'Subway'),
(10, 2980.00, 10, 'Starbucks');

-- Вставка данных в таблицу tickets
INSERT INTO tickets VALUES
(1, 'abrakadabra', 5, 'Все отлично, спасибо!', '2024-06-19', 1),
(2, 'tralalalotralala', 4, 'Заказ приехал позже', '2024-06-18', 2),
(3, 'superbloger', 1, 'Не доставили одну позицию', '2024-06-17', 3),
(4, 'TechBridge', 3, 'Холодные напитки', '2024-06-16', 4),
(5, 'FoodGrid', 5, 'Быстрая доставка!', '2024-06-15', 5),
(6, 'UrbanEats', 2, 'Перепутан заказ', '2024-06-14', 6),
(7, 'GastroLux', 4, 'Хороший сервис', '2024-06-13', 7),
(8, 'QuickBite', 1, 'Проблема с оплатой', '2024-06-12', 8),
(9, 'FreshMeal', 5, 'Лучший сервис в городе!', '2024-06-11', 9),
(10, 'PrimeDish', 3, 'Не хватило соусов', '2024-06-10', 10);