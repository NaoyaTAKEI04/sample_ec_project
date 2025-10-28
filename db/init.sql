-- =========================================
-- テーブル作成
-- =========================================

-- ユーザーテーブル
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    is_admin BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 商品テーブル
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 注文テーブル
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total_price DECIMAL(10,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 注文明細テーブル（注文ごとの商品）
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL
);

-- =========================================
-- ダミーデータ投入
-- =========================================

-- ユーザー10件（1人は管理者）
INSERT INTO users (name, email, password, is_admin) VALUES
('Admin User', 'admin@example.com', 'adminpass', true),
('User 1', 'user1@example.com', 'password1', false),
('User 2', 'user2@example.com', 'password2', false),
('User 3', 'user3@example.com', 'password3', false),
('User 4', 'user4@example.com', 'password4', false),
('User 5', 'user5@example.com', 'password5', false),
('User 6', 'user6@example.com', 'password6', false),
('User 7', 'user7@example.com', 'password7', false),
('User 8', 'user8@example.com', 'password8', false),
('User 9', 'user9@example.com', 'password9', false);

-- 商品20件
INSERT INTO products (name, description, price, stock) VALUES
('Organic Coffee Beans 250g', 'Freshly roasted Arabica coffee beans.', 1200.00, 20),
('Matcha Latte Mix', 'Japanese green tea latte mix with soy.', 850.00, 35),
('Moringa Powder 100g', 'Superfood rich in vitamins and minerals.', 950.00, 50),
('Brown Rice 1kg', 'High-quality brown rice from Niigata.', 700.00, 15),
('Olive Oil 500ml', 'Extra virgin olive oil.', 1200.00, 25),
('Green Tea Bag 50pcs', 'Premium Japanese green tea.', 600.00, 40),
('Honey 250g', 'Natural wildflower honey.', 800.00, 30),
('Almonds 200g', 'Raw organic almonds.', 900.00, 20),
('Chia Seeds 200g', 'Superfood for healthy diet.', 850.00, 25),
('Oatmeal 500g', 'Organic rolled oats.', 400.00, 50),
('Coconut Oil 500ml', 'Cold pressed coconut oil.', 1000.00, 30),
('Protein Powder 1kg', 'Whey protein for fitness.', 3000.00, 20),
('Dark Chocolate 100g', '70% cacao chocolate.', 500.00, 40),
('Granola 500g', 'Crunchy and healthy.', 650.00, 30),
('Soy Milk 1L', 'Organic soy milk.', 400.00, 50),
('Rice Crackers 200g', 'Traditional Japanese snack.', 300.00, 35),
('Herbal Tea 30pcs', 'Relaxing herbal tea bags.', 550.00, 25),
('Cashew Nuts 200g', 'Roasted cashew nuts.', 950.00, 20),
('Quinoa 500g', 'High-protein grain.', 1200.00, 15),
('Pasta 500g', 'Italian durum wheat pasta.', 500.00, 40);

-- 注文30件（ランダムユーザー・合計価格は適当に設定）
INSERT INTO orders (user_id, total_price) VALUES
(2, 2050.00),(3, 1500.00),(4, 950.00),(5, 3000.00),(6, 1250.00),
(7, 2750.00),(8, 1800.00),(9, 2100.00),(10, 1950.00),(2, 1200.00),
(3, 850.00),(4, 1100.00),(5, 950.00),(6, 1400.00),(7, 1750.00),
(8, 2000.00),(9, 1500.00),(10, 1300.00),(2, 1050.00),(3, 900.00),
(4, 1250.00),(5, 1350.00),(6, 1600.00),(7, 1450.00),(8, 1700.00),
(9, 1850.00),(10, 1950.00),(2, 2100.00),(3, 2200.00),(4, 2300.00);

-- 注文明細（ランダム商品・数量1〜5個程度）
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),(1, 3, 1),(2, 2, 1),(2, 5, 2),(3, 4, 1),(3, 6, 3),
(4, 7, 2),(4, 1, 1),(5, 8, 1),(5, 2, 2),(6, 9, 1),(6, 10, 2),
(7, 3, 2),(7, 4, 1),(8, 5, 1),(8, 6, 1),(9, 7, 2),(9, 8, 1),
(10, 9, 3),(10, 10, 2),(11, 11, 1),(11, 12, 2),(12, 13, 1),(12, 14, 2),
(13, 15, 1),(13, 16, 2),(14, 17, 1),(14, 18, 1),(15, 19,2),(15, 20,1);
