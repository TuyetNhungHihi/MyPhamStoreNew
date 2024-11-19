-- Bảng user
INSERT INTO `user` (`full_name`, `email`, `password`, `phone`, `date_of_birth`, `gender`, `avatar`, `is_active`) VALUES
('Alice Smith', 'alice@example.com', 'password123', '0123456789', '1990-01-01', 'FEMALE', null, true),
('Bob Johnson', 'bob@example.com', 'password123', '0987654321', '1985-05-12', 'MALE', null, true),
('Charlie Brown', 'charlie@example.com', 'password123', '0112233445', '1992-11-23', 'OTHER', null, true),
('Diana Prince', 'diana@example.com', 'password123', '0678901234', '1993-07-19', 'FEMALE', null, true),
('Ethan Hunt', 'ethan@example.com', 'password123', '0241357913', '1987-09-30', 'MALE', null, false),
('Fiona Gallagher', 'fiona@example.com', 'password123', '0867425791', '1994-03-08', 'FEMALE', null, true),
('George Stark', 'george@example.com', 'password123', '0812345678', '1988-05-15', 'MALE', null, true),
('Hannah Adams', 'hannah@example.com', 'password123', '0909876543', '1995-10-22', 'FEMALE', null, true),
('Ian McKellen', 'ian@example.com', 'password123', '0711122233', '1983-04-17', 'MALE', null, true),
('Jane Doe', 'jane@example.com', 'password123', '0111199999', '1996-12-05', 'FEMALE', null, true);

-- Bảng role
INSERT INTO `role` (`name`, `description`) VALUES
('Admin', 'Has full access to the system'),
('Customer', 'Can purchase products and leave reviews'),
('Editor', 'Can edit content'),
('Viewer', 'Can view content but not modify');

-- Bảng user_has_role
INSERT INTO `user_has_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 4),
(6, 2),
(7, 3),
(8, 4),
(9, 1),
(10, 2);

-- Bảng permission
INSERT INTO `permission` (`url`) VALUES
('/admin/dashboard'),
('/product/view'),
('/order/manage'),
('/user/edit'),
('/user/view'),
('/content/create'),
('/content/delete'),
('/reports/view'),
('/settings/update'),
('/notifications/send');

-- Bảng role_has_permission
INSERT INTO `role_has_permission` (`role_id`, `permission_id`) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 2), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9);

-- Bảng address
INSERT INTO `address` (`user_id`, `recipient_name`, `recipient_phone`, `city`, `district`, `ward`, `note`, `is_default`) VALUES
(1, 'Alice Smith', '0123456789', 'Hanoi', 'Ba Dinh', 'Phuc Xa', 'Near the park', true),
(2, 'Bob Johnson', '0987654321', 'Ho Chi Minh', 'District 1', 'Ward 2', '', false),
(3, 'Charlie Brown', '0112233445', 'Danang', 'Hai Chau', 'Hoa Thuan Tay', '', true),
(4, 'Diana Prince', '0678901234', 'Hanoi', 'Hoan Kiem', 'Hang Dao', '', false),
(5, 'Ethan Hunt', '0241357913', 'Hue', 'Phu Nhuan', 'Thuy Xuan', '', true),
(6, 'Fiona Gallagher', '0867425791', 'Hanoi', 'Dong Da', 'Lang Ha', '', false),
(7, 'George Stark', '0812345678', 'Can Tho', 'Ninh Kieu', 'An Khanh', '', true),
(8, 'Hannah Adams', '0909876543', 'Hanoi', 'Long Bien', 'Ngoc Thuy', '', false),
(9, 'Ian McKellen', '0711122233', 'Haiphong', 'Ngo Quyen', 'Lach Tray', '', true),
(10, 'Jane Doe', '0111199999', 'Hanoi', 'Cau Giay', 'Trung Hoa', '', false);

-- Bảng brand
INSERT INTO `brand` (`name`, `logo`) VALUES
('L\'Oreal', '/images/brand_loreal.png'),
('Maybelline', '/images/brand_maybelline.png'),
('Dove', '/images/brand_dove.png'),
('Nivea', '/images/brand_nivea.png'),
('The Body Shop', '/images/brand_bodyshop.png'),
('Innisfree', '/images/brand_innisfree.png'),
('Laneige', '/images/brand_laneige.png'),
('Clinique', '/images/brand_clinique.png'),
('Mac', '/images/brand_mac.png'),
('Estee Lauder', '/images/brand_estee.png');

-- Bảng category
INSERT INTO `category` (`parent_id`, `name`) VALUES
(null, 'Cosmetics'),
(1, 'Makeup'),
(1, 'Skincare'),
(1, 'Haircare'),
(2, 'Lip Products'),
(2, 'Eye Products'),
(3, 'Moisturizers'),
(3, 'Cleansers'),
(4, 'Shampoo'),
(4, 'Conditioner');

-- Bảng product
INSERT INTO `product` (`name`, `price`, `stock`, `sold_quantity`, `description`, `attributes`, `is_available`, `thumbnail`, `brand_id`, `category_id`) VALUES
('Matte Lipstick', 250000, 100, 30, 'Long-lasting matte lipstick', '{"color": "red", "size": "5g"}', true, '/images/matte_lipstick.png', 9, 5),
('Moisturizing Cream', 350000, 50, 20, 'Hydrating face cream', '{"type": "cream", "size": "50ml"}', true, '/images/moisturizing_cream.png', 8, 7),
('Shampoo', 150000, 80, 25, 'Refreshing shampoo for all hair types', '{"volume": "500ml"}', true, '/images/shampoo.png', 3, 9),
('Conditioner', 180000, 70, 15, 'Smoothing conditioner', '{"volume": "500ml"}', true, '/images/conditioner.png', 4, 10),
('Eyeliner', 120000, 60, 40, 'Smudge-proof eyeliner', '{"color": "black"}', true, '/images/eyeliner.png', 9, 6),
('Face Cleanser', 200000, 90, 10, 'Gentle facial cleanser', '{"type": "gel", "size": "200ml"}', true, '/images/face_cleanser.png', 6, 8),
('Hair Oil', 250000, 30, 12, 'Nourishing hair oil', '{"volume": "100ml"}', true, '/images/hair_oil.png', 7, 9),
('Body Lotion', 180000, 40, 18, 'Moisturizing body lotion', '{"type": "lotion", "size": "400ml"}', true, '/images/body_lotion.png', 5, 3),
('Sunscreen', 280000, 35, 22, 'SPF 50+ sunscreen', '{"type": "cream", "size": "50ml"}', true, '/images/sunscreen.png', 8, 7),
('Compact Powder', 220000, 50, 30, 'Oil-free compact powder', '{"color": "beige"}', true, '/images/compact_powder.png', 9, 2);

-- Bảng product_image
INSERT INTO `product_image` (`url`, `product_id`) VALUES
('/images/matte_lipstick_1.png', 1),
('/images/matte_lipstick_2.png', 1),
('/images/moisturizing_cream_1.png', 2),
('/images/shampoo_1.png', 3),
('/images/conditioner_1.png', 4),
('/images/eyeliner_1.png', 5),
('/images/face_cleanser_1.png', 6),
('/images/hair_oil_1.png', 7),
('/images/body_lotion_1.png', 8),
('/images/sunscreen_1.png', 9);

-- Bảng review
INSERT INTO `review` (`user_id`, `product_id`, `rating`, `comment`) VALUES
(1, 1, 5, 'Amazing lipstick, great color!'),
(2, 2, 4, 'Very hydrating cream, but a bit greasy.'),
(3, 3, 5, 'Best shampoo I have ever used!'),
(4, 4, 3, 'Conditioner is okay, not extraordinary.'),
(5, 5, 5, 'This eyeliner is fantastic!'),
(6, 6, 4, 'Good cleanser, removes dirt effectively.'),
(7, 7, 5, 'Love the hair oil, makes my hair shiny.'),
(8, 8, 4, 'Great lotion but the scent is strong.'),
(9, 9, 5, 'Perfect sunscreen for daily use.'),
(10, 10, 5, 'Compact powder is lightweight and perfect.');

-- Bảng order
INSERT INTO `order` (`order_date`, `address_id`, `user_id`, `status`, `payment_method`, `note`, `total_price`) VALUES
(NOW(), 1, 1, 'PENDING', 'Cash on Delivery', 'Deliver during morning.', 500000),
(NOW(), 2, 2, 'CONFIRMED', 'Credit Card', '', 350000),
(NOW(), 3, 3, 'SHIPPING', 'Cash on Delivery', 'Call before delivery.', 450000),
(NOW(), 4, 4, 'DELIVERED', 'Credit Card', '', 600000),
(NOW(), 5, 5, 'CANCELED', 'Bank Transfer', '', 200000),
(NOW(), 6, 6, 'PENDING', 'Cash on Delivery', '', 300000),
(NOW(), 7, 7, 'RETURNING', 'PayPal', 'Issue with product.', 150000),
(NOW(), 8, 8, 'RETURNED', 'Credit Card', '', 250000),
(NOW(), 9, 9, 'PENDING', 'Cash on Delivery', '', 400000),
(NOW(), 10, 10, 'DELIVERED', 'Cash on Delivery', '', 500000);

-- Bảng order_detail
INSERT INTO `order_detail` (`order_id`, `product_id`, `quantity`, `total_price`) VALUES
(1, 1, 2, 500000),
(2, 2, 1, 350000),
(3, 3, 3, 450000),
(4, 4, 2, 600000),
(5, 5, 1, 200000),
(6, 6, 3, 300000),
(7, 7, 1, 150000),
(8, 8, 2, 250000),
(9, 9, 1, 400000),
(10, 10, 2, 500000);

-- Bảng slide
INSERT INTO `slide` (`image`, `url`) VALUES
('/images/slide1.png', '/products/matte_lipstick'),
('/images/slide2.png', '/products/moisturizing_cream'),
('/images/slide3.png', '/products/shampoo'),
('/images/slide4.png', '/products/conditioner'),
('/images/slide5.png', '/products/eyeliner'),
('/images/slide6.png', '/products/face_cleanser'),
('/images/slide7.png', '/products/hair_oil'),
('/images/slide8.png', '/products/body_lotion'),
('/images/slide9.png', '/products/sunscreen'),
('/images/slide10.png', '/products/compact_powder');

-- Bảng feedback
INSERT INTO `feedback` (`description`, `status`) VALUES
('Great customer service!', 'DONE'),
('Delivery was late.', 'PENDING'),
('Product quality is good.', 'DONE'),
('Received wrong product.', 'PENDING'),
('The packaging was excellent.', 'DONE'),
('Need more payment options.', 'PENDING'),
('Highly recommend this store!', 'DONE'),
('Website is user-friendly.', 'DONE'),
('Product descriptions are inaccurate.', 'PENDING'),
('Satisfied with my purchase.', 'DONE');

