use myphamstoredb;
-- Dữ liệu mẫu cho bảng `user`
INSERT INTO `user` (`id`, `full_name`, `email`, `password`, `phone`, `date_of_birth`, `gender`, `avatar`, `status`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'Nguyen Van A', 'a.nguyen@gmail.com', 'password123', '0987654321', '1990-01-01', 'MALE', 'avatar1.png', 'ACTIVE', '2024-11-30 10:00:00', NOW(), NOW()),
(2, 'Tran Thi B', 'b.tran@gmail.com', 'password456', '0978543210', '1995-02-02', 'FEMALE', 'avatar2.png', 'ACTIVE', '2024-11-29 09:30:00', NOW(), NOW()),
(3, 'Le Van C', 'c.le@gmail.com', 'password789', '0967854320', '1987-03-03', 'MALE', 'avatar3.png', 'ACTIVE', '2024-11-28 08:20:00', NOW(), NOW()),
(4, 'Pham Thi D', 'd.pham@gmail.com', 'password101', '0954321987', '1992-04-04', 'FEMALE', 'avatar4.png', 'ACTIVE', '2024-11-27 12:15:00', NOW(), NOW()),
(5, 'Do Van E', 'e.do@gmail.com', 'password202', '0943219876', '1989-05-05', 'MALE', 'avatar5.png', 'ACTIVE', '2024-11-26 10:45:00', NOW(), NOW()),
(6, 'Hoang Thi F', 'f.hoang@gmail.com', 'password303', '0932198765', '1996-06-06', 'FEMALE', 'avatar6.png', 'ACTIVE', '2024-11-25 11:30:00', NOW(), NOW()),
(7, 'Vu Van G', 'g.vu@gmail.com', 'password404', '0921987654', '1991-07-07', 'MALE', 'avatar7.png', 'ACTIVE', '2024-11-24 14:00:00', NOW(), NOW()),
(8, 'Bui Thi H', 'h.bui@gmail.com', 'password505', '0919876543', '1993-08-08', 'FEMALE', 'avatar8.png', 'ACTIVE', '2024-11-23 16:20:00', NOW(), NOW()),
(9, 'Ngo Van I', 'i.ngo@gmail.com', 'password606', '0908765432', '1994-09-09', 'MALE', 'avatar9.png', 'ACTIVE', '2024-11-22 18:30:00', NOW(), NOW()),
(10, 'Nguyen Thi J', 'j.nguyen@gmail.com', 'password707', '0897654321', '1988-10-10', 'FEMALE', 'avatar10.png', 'ACTIVE', '2024-11-21 20:10:00', NOW(), NOW()),
(11, 'Tran Van K', 'k.tran@gmail.com', 'password808', '0886543210', '1990-11-11', 'MALE', 'avatar11.png', 'ACTIVE', '2024-11-20 10:15:00', NOW(), NOW()),
(12, 'Le Thi L', 'l.le@gmail.com', 'password909', '0875432109', '1992-12-12', 'FEMALE', 'avatar12.png', 'ACTIVE', '2024-11-19 13:30:00', NOW(), NOW()),
(13, 'Pham Van M', 'm.pham@gmail.com', 'password010', '0864321098', '1985-01-13', 'MALE', 'avatar13.png', 'ACTIVE', '2024-11-18 15:45:00', NOW(), NOW()),
(14, 'Do Thi N', 'n.do@gmail.com', 'password111', '0853210987', '1997-02-14', 'FEMALE', 'avatar14.png', 'ACTIVE', '2024-11-17 17:00:00', NOW(), NOW()),
(15, 'Hoang Van O', 'o.hoang@gmail.com', 'password212', '0842109876', '1986-03-15', 'MALE', 'avatar15.png', 'ACTIVE', '2024-11-16 19:15:00', NOW(), NOW()),
(16, 'Vu Thi P', 'p.vu@gmail.com', 'password313', '0831098765', '1998-04-16', 'FEMALE', 'avatar16.png', 'ACTIVE', '2024-11-15 21:30:00', NOW(), NOW()),
(17, 'Bui Van Q', 'q.bui@gmail.com', 'password414', '0820987654', '1987-05-17', 'MALE', 'avatar17.png', 'ACTIVE', '2024-11-14 22:45:00', NOW(), NOW()),
(18, 'Ngo Thi R', 'r.ngo@gmail.com', 'password515', '0819876543', '1995-06-18', 'FEMALE', 'avatar18.png', 'ACTIVE', '2024-11-13 10:00:00', NOW(), NOW()),
(19, 'Nguyen Van S', 's.nguyen@gmail.com', 'password616', '0808765432', '1990-07-19', 'MALE', 'avatar19.png', 'ACTIVE', '2024-11-12 11:15:00', NOW(), NOW()),
(20, 'Tran Thi T', 't.tran@gmail.com', 'password717', '0797654321', '1989-08-20', 'FEMALE', 'avatar20.png', 'ACTIVE', '2024-11-11 13:30:00', NOW(), NOW());

-- Dữ liệu mẫu cho bảng `role`
INSERT INTO `role` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Quản trị viên hệ thống', NOW(), NOW()),
(2, 'Customer', 'Khách hàng', NOW(), NOW()),
(3, 'Moderator', 'Người kiểm duyệt nội dung', NOW(), NOW()),
(4, 'Seller', 'Người bán hàng', NOW(), NOW()),
(5, 'Support', 'Nhân viên hỗ trợ', NOW(), NOW()),
(6, 'Viewer', 'Người xem', NOW(), NOW()),
(7, 'Guest', 'Khách ghé thăm', NOW(), NOW()),
(8, 'VIP Customer', 'Khách hàng VIP', NOW(), NOW()),
(9, 'Editor', 'Người chỉnh sửa nội dung', NOW(), NOW()),
(10, 'Manager', 'Quản lý', NOW(), NOW());

-- Dữ liệu mẫu cho các bảng khác sẽ được tạo tương tự


-- Dữ liệu mẫu cho bảng `user_has_role`
INSERT INTO `user_has_role` (`user_id`, `role_id`) VALUES
(1, 1), (2, 2), (3, 2), (4, 3), (5, 4),
(6, 1), (7, 5), (8, 2), (9, 4), (10, 3),
(11, 2), (12, 1), (13, 4), (14, 2), (15, 3),
(16, 5), (17, 1), (18, 2), (19, 3), (20, 4);

-- Dữ liệu mẫu cho bảng `address`
INSERT INTO `address` (`id`, `user_id`, `recipient_name`, `recipient_phone`, `city`, `district`, `ward`, `note`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nguyen Van A', '0987654321', 'Hanoi', 'Hoan Kiem', 'Ly Thai To', 'Giao trong giờ hành chính', true, NOW(), NOW()),
(2, 2, 'Tran Thi B', '0978543210', 'Hanoi', 'Dong Da', 'Lang Ha', 'Không giao trước 8h sáng', false, NOW(), NOW()),
(3, 3, 'Le Van C', '0967854320', 'Ho Chi Minh', 'District 1', 'Ben Thanh', null, true, NOW(), NOW()),
(4, 4, 'Pham Thi D', '0954321987', 'Ho Chi Minh', 'District 7', 'Tan Phu', 'Gọi trước khi giao', true, NOW(), NOW()),
(5, 5, 'Do Van E', '0943219876', 'Danang', 'Hai Chau', 'Thach Thang', null, false, NOW(), NOW()),
(6, 6, 'Hoang Thi F', '0932198765', 'Danang', 'Ngu Hanh Son', 'My An', null, true, NOW(), NOW()),
(7, 7, 'Vu Van G', '0921987654', 'Hanoi', 'Thanh Xuan', 'Khuat Duy Tien', 'Không giao buổi trưa', false, NOW(), NOW()),
(8, 8, 'Bui Thi H', '0919876543', 'Hanoi', 'Long Bien', 'Ngoc Lam', null, true, NOW(), NOW()),
(9, 9, 'Ngo Van I', '0908765432', 'Ho Chi Minh', 'District 3', 'Vo Thi Sau', null, true, NOW(), NOW()),
(10, 10, 'Nguyen Thi J', '0897654321', 'Ho Chi Minh', 'District 10', 'Ba Thang Hai', null, false, NOW(), NOW()),
(11, 11, 'Tran Van K', '0886543210', 'Hanoi', 'Dong Da', 'Kham Thien', null, true, NOW(), NOW()),
(12, 12, 'Le Thi L', '0875432109', 'Danang', 'Son Tra', 'Phuoc My', null, true, NOW(), NOW()),
(13, 13, 'Pham Van M', '0864321098', 'Hanoi', 'Ba Dinh', 'Nguyen Thai Hoc', null, false, NOW(), NOW()),
(14, 14, 'Do Thi N', '0853210987', 'Hanoi', 'Hoan Kiem', 'Hang Bong', null, true, NOW(), NOW()),
(15, 15, 'Hoang Van O', '0842109876', 'Ho Chi Minh', 'District 5', 'Tran Hung Dao', null, false, NOW(), NOW()),
(16, 16, 'Vu Thi P', '0831098765', 'Ho Chi Minh', 'District 7', 'Phu My Hung', null, true, NOW(), NOW()),
(17, 17, 'Bui Van Q', '0820987654', 'Hanoi', 'Cau Giay', 'Duy Tan', null, true, NOW(), NOW()),
(18, 18, 'Ngo Thi R', '0819876543', 'Danang', 'Cam Le', 'Hoa Tho', null, true, NOW(), NOW()),
(19, 19, 'Nguyen Van S', '0808765432', 'Hanoi', 'Hoang Mai', 'Tam Trinh', null, false, NOW(), NOW()),
(20, 20, 'Tran Thi T', '0797654321', 'Ho Chi Minh', 'District 8', 'Pham The Hien', null, true, NOW(), NOW());

-- Dữ liệu mẫu cho bảng `brand`
INSERT INTO `brand` (`id`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Oreal', 'loreal_logo.png', NOW(), NOW()),
(2, 'Maybelline', 'maybelline_logo.png', NOW(), NOW()),
(3, 'MAC', 'mac_logo.png', NOW(), NOW()),
(4, 'Estee Lauder', 'estee_lauder_logo.png', NOW(), NOW()),
(5, 'Dior', 'dior_logo.png', NOW(), NOW()),
(6, 'Chanel', 'chanel_logo.png', NOW(), NOW()),
(7, 'Lancome', 'lancome_logo.png', NOW(), NOW()),
(8, 'Clinique', 'clinique_logo.png', NOW(), NOW()),
(9, 'Bobbi Brown', 'bobbi_brown_logo.png', NOW(), NOW()),
(10, 'NARS', 'nars_logo.png', NOW(), NOW()),
(11, 'Shiseido', 'shiseido_logo.png', NOW(), NOW()),
(12, 'Urban Decay', 'urban_decay_logo.png', NOW(), NOW()),
(13, 'Benefit', 'benefit_logo.png', NOW(), NOW()),
(14, 'Sephora', 'sephora_logo.png', NOW(), NOW()),
(15, 'Fenty Beauty', 'fenty_beauty_logo.png', NOW(), NOW()),
(16, 'Tarte', 'tarte_logo.png', NOW(), NOW()),
(17, 'Too Faced', 'too_faced_logo.png', NOW(), NOW()),
(18, 'Huda Beauty', 'huda_beauty_logo.png', NOW(), NOW()),
(19, 'Anastasia', 'anastasia_logo.png', NOW(), NOW()),
(20, 'Charlotte Tilbury', 'charlotte_tilbury_logo.png', NOW(), NOW());

INSERT INTO `category` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'Devices like phones, laptops, and accessories', NOW(), NOW()),
(2, 'Fashion', 'Clothing, shoes, and accessories', NOW(), NOW()),
(3, 'Home Appliances', 'Appliances for daily use in the home', NOW(), NOW()),
(4, 'Health & Beauty', 'Skincare, haircare, and wellness products', NOW(), NOW()),
(5, 'Books', 'Fiction, non-fiction, and academic books', NOW(), NOW()),
(6, 'Sports & Outdoors', 'Outdoor gear and sports equipment', NOW(), NOW()),
(7, 'Toys', 'Toys for children of all ages', NOW(), NOW()),
(8, 'Furniture', 'Furniture for living rooms, bedrooms, and offices', NOW(), NOW()),
(9, 'Food & Beverage', 'Groceries, snacks, and drinks', NOW(), NOW()),
(10, 'Automotive', 'Car accessories, tools, and parts', NOW(), NOW()),
(11, 'Baby Products', 'Diapers, bottles, and baby essentials', NOW(), NOW()),
(12, 'Music & Movies', 'CDs, DVDs, and entertainment media', NOW(), NOW()),
(13, 'Computers', 'Laptops, desktops, and computer accessories', NOW(), NOW()),
(14, 'Garden & Outdoors', 'Gardening tools, plants, and outdoor furniture', NOW(), NOW()),
(15, 'Pets', 'Food, toys, and accessories for pets', NOW(), NOW()),
(16, 'Jewelry', 'Rings, necklaces, and watches', NOW(), NOW()),
(17, 'Stationery', 'Pens, notebooks, and office supplies', NOW(), NOW()),
(18, 'Tools', 'Power tools, hand tools, and hardware', NOW(), NOW()),
(19, 'Music Instruments', 'Guitars, drums, and other musical instruments', NOW(), NOW()),
(20, 'Art & Craft', 'Art supplies and DIY craft materials', NOW(), NOW());


-- Dữ liệu mẫu cho bảng `product`
INSERT INTO `product` (`id`, `name`, `price`, `cost_price`, `stock`, `sold_quantity`, `description`, `is_available`, `thumbnail`, `brand_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Oreal Face Wash', 200000, 150000, 500, 120, 'Deep cleansing face wash', true, 'loreal_face_wash.png', 1, 2, NOW(), NOW()),
(2, 'Maybelline Lipstick', 300000, 200000, 300, 90, 'Matte finish lipstick', true, 'maybelline_lipstick.png', 2, 5, NOW(), NOW()),
(3, 'MAC Foundation', 600000, 450000, 100, 45, 'Long-lasting foundation', true, 'mac_foundation.png', 3, 6, NOW(), NOW()),
(4, 'Dior Perfume - Women', 1200000, 1000000, 50, 30, 'Elegant fragrance for women', true, 'dior_perfume_women.png', 5, 12, NOW(), NOW()),
(5, 'Chanel Perfume - Men', 1300000, 1100000, 40, 20, 'Sophisticated scent for men', true, 'chanel_perfume_men.png', 6, 11, NOW(), NOW()),
(6, 'Lancome Moisturizer', 500000, 400000, 200, 80, 'Hydrating moisturizer', true, 'lancome_moisturizer.png', 7, 3, NOW(), NOW()),
(7, 'Clinique Shampoo', 300000, 250000, 150, 60, 'Gentle shampoo for all hair types', true, 'clinique_shampoo.png', 8, 8, NOW(), NOW()),
(8, 'Bobbi Brown Brushes', 400000, 300000, 200, 75, 'Professional makeup brushes', true, 'bobbi_brown_brushes.png', 9, 20, NOW(), NOW()),
(9, 'Urban Decay Nail Polish', 150000, 100000, 300, 110, 'Vibrant nail polish colors', true, 'urban_decay_nail_polish.png', 12, 17, NOW(), NOW()),
(10, 'Benefit Lotions', 450000, 350000, 150, 50, 'Soothing body lotions', true, 'benefit_lotions.png', 13, 15, NOW(), NOW()),
(11, 'Sephora Lipstick', 320000, 250000, 180, 70, 'Rich pigment lipstick', true, 'sephora_lipstick.png', 14, 5, NOW(), NOW()),
(12, 'Fenty Beauty Foundation', 550000, 450000, 90, 35, 'Flawless finish foundation', true, 'fenty_beauty_foundation.png', 15, 6, NOW(), NOW()),
(13, 'Huda Beauty Eyeshadow', 700000, 600000, 120, 65, 'High-pigment eyeshadow', true, 'huda_beauty_eyeshadow.png', 18, 4, NOW(), NOW()),
(14, 'Anastasia Brow Pencil', 300000, 250000, 200, 90, 'Perfect brow pencil', true, 'anastasia_brow_pencil.png', 19, 19, NOW(), NOW()),
(15, 'Too Faced Conditioner', 350000, 300000, 180, 50, 'Nourishing hair conditioner', true, 'too_faced_conditioner.png', 17, 9, NOW(), NOW()),
(16, 'Charlotte Tilbury Blush', 600000, 500000, 80, 40, 'Soft-focus blush', true, 'charlotte_tilbury_blush.png', 20, 4, NOW(), NOW()),
(17, 'Shiseido Nail Remover', 200000, 150000, 300, 120, 'Quick nail polish remover', true, 'shiseido_nail_remover.png', 11, 18, NOW(), NOW()),
(18, 'Tarte Body Wash', 400000, 300000, 140, 70, 'Gentle body wash', true, 'tarte_body_wash.png', 16, 14, NOW(), NOW()),
(19, 'Benefit Hair Serum', 550000, 450000, 100, 45, 'Silky hair serum', true, 'benefit_hair_serum.png', 13, 7, NOW(), NOW()),
(20, 'MAC Compact Powder', 500000, 400000, 150, 60, 'Smooth compact powder', true, 'mac_compact_powder.png', 3, 4, NOW(), NOW());

INSERT INTO `product_variant` (`id`, `product_id`, `name`, `price`, `stock`, `sold_quantity`, `thumbnail`, `is_available`, `created_at`, `updated_at`)
VALUES
-- Variants for Oreal Face Wash
(1, 1, 'Travel Size 50ml', 180000, 150, 40, 'loreal_face_wash_50ml.png', true, NOW(), NOW()),
(2, 1, 'Standard 150ml', 200000, 300, 60, 'loreal_face_wash_150ml.png', true, NOW(), NOW()),
(3, 1, 'Family Pack 300ml', 350000, 50, 20, 'loreal_face_wash_300ml.png', true, NOW(), NOW()),

-- Variants for Maybelline Lipstick
(4, 2, 'Shade Ruby Red', 310000, 100, 30, 'maybelline_lipstick_ruby_red.png', true, NOW(), NOW()),
(5, 2, 'Shade Coral Pink', 320000, 100, 30, 'maybelline_lipstick_coral_pink.png', true, NOW(), NOW()),
(6, 2, 'Shade Nude Brown', 300000, 100, 30, 'maybelline_lipstick_nude_brown.png', true, NOW(), NOW()),

-- Variants for MAC Foundation
(7, 3, 'Shade Light', 620000, 40, 15, 'mac_foundation_light.png', true, NOW(), NOW()),
(8, 3, 'Shade Medium', 600000, 40, 15, 'mac_foundation_medium.png', true, NOW(), NOW()),
(9, 3, 'Shade Dark', 600000, 20, 15, 'mac_foundation_dark.png', true, NOW(), NOW()),

-- Variants for Dior Perfume - Women
(10, 4, '50ml Bottle', 1200000, 30, 10, 'dior_perfume_women_50ml.png', true, NOW(), NOW()),
(11, 4, '75ml Bottle', 1500000, 15, 10, 'dior_perfume_women_75ml.png', true, NOW(), NOW()),
(12, 4, '100ml Bottle', 1800000, 5, 10, 'dior_perfume_women_100ml.png', true, NOW(), NOW()),

-- Variants for Chanel Perfume - Men
(13, 5, '50ml Bottle', 1300000, 20, 5, 'chanel_perfume_men_50ml.png', true, NOW(), NOW()),
(14, 5, '75ml Bottle', 1600000, 15, 5, 'chanel_perfume_men_75ml.png', true, NOW(), NOW()),
(15, 5, '100ml Bottle', 2000000, 5, 5, 'chanel_perfume_men_100ml.png', true, NOW(), NOW()),

-- Variants for Lancome Moisturizer
(16, 6, '50ml Jar', 500000, 100, 20, 'lancome_moisturizer_50ml.png', true, NOW(), NOW()),
(17, 6, '100ml Jar', 800000, 80, 30, 'lancome_moisturizer_100ml.png', true, NOW(), NOW()),
(18, 6, '150ml Jar', 1100000, 20, 30, 'lancome_moisturizer_150ml.png', true, NOW(), NOW()),

-- Variants for Clinique Shampoo
(19, 7, '250ml Bottle', 300000, 80, 30, 'clinique_shampoo_250ml.png', true, NOW(), NOW()),
(20, 7, '500ml Bottle', 500000, 50, 20, 'clinique_shampoo_500ml.png', true, NOW(), NOW()),
(21, 7, '1000ml Bottle', 900000, 20, 10, 'clinique_shampoo_1000ml.png', true, NOW(), NOW()),

-- Variants for Bobbi Brown Brushes
(22, 8, 'Travel Set', 350000, 100, 30, 'bobbi_brown_brushes_travel_set.png', true, NOW(), NOW()),
(23, 8, 'Professional Set', 450000, 80, 30, 'bobbi_brown_brushes_professional_set.png', true, NOW(), NOW()),
(24, 8, 'Limited Edition Set', 550000, 20, 15, 'bobbi_brown_brushes_limited.png', true, NOW(), NOW());


INSERT INTO `review` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 'Good quality!', NOW(), NOW()),
(2, 2, 2, 4, 'Nice product.', NOW(), NOW()),
(3, 3, 3, 3, 'Average.', NOW(), NOW()),
(4, 4, 4, 5, 'Highly recommend!', NOW(), NOW()),
(5, 5, 5, 2, 'Not satisfied.', NOW(), NOW()),
(6, 6, 6, 4, 'Worth the price.', NOW(), NOW()),
(7, 7, 7, 5, 'Amazing!', NOW(), NOW()),
(8, 8, 8, 3, 'Okay.', NOW(), NOW()),
(9, 9, 9, 5, 'Fantastic!', NOW(), NOW()),
(10, 10, 10, 1, 'Bad experience.', NOW(), NOW()),
(11, 11, 11, 5, 'Loved it!', NOW(), NOW()),
(12, 12, 12, 4, 'Good.', NOW(), NOW()),
(13, 13, 13, 2, 'Not as expected.', NOW(), NOW()),
(14, 14, 14, 5, 'Perfect!', NOW(), NOW()),
(15, 15, 15, 3, 'Fine.', NOW(), NOW()),
(16, 16, 16, 4, 'Very good.', NOW(), NOW()),
(17, 17, 17, 5, 'Amazing experience.', NOW(), NOW()),
(18, 18, 18, 2, 'Below average.', NOW(), NOW()),
(19, 19, 19, 4, 'Decent.', NOW(), NOW()),
(20, 20, 20, 5, 'Excellent!', NOW(), NOW());


INSERT INTO `order` (`id`, `address_id`, `user_id`, `status`, `payment_method`, `shipping_fee`, `note`, `total_price`, `order_date`, `confirm_at`) VALUES
(1, 1, 1, 'PENDING', 'COD', 30000, 'Handle with care', 500000, NOW(), NOW()),
(2, 2, 2, 'CONFIRMED', 'Online', 25000, 'Deliver ASAP', 800000, NOW(), NOW()),
(3, 3, 3, 'DELIVERED', 'COD', 20000, 'No special instructions', 1200000, NOW(), NOW()),
(4, 4, 4, 'PENDING', 'COD', 35000, 'Handle with care', 450000, NOW(), NULL),
(5, 5, 5, 'DELIVERED', 'Online', 15000, 'Ring the bell twice', 900000, NOW(), NOW()),
(7, 7, 7, 'PENDING', 'COD', 30000, 'Leave at door', 700000, NOW(), NULL),
(8, 8, 8, 'DELIVERED', 'Online', 20000, '', 950000, NOW(), NOW()),
(9, 9, 9, 'CONFIRMED', 'COD', 30000, '', 600000, NOW(), NOW()),
(10, 10, 10, 'DELIVERED', 'COD', 15000, 'Deliver in the evening', 400000, NOW(), NOW()),
(11, 11, 11, 'PENDING', 'Online', 25000, '', 500000, NOW(), NULL),
(12, 12, 12, 'CONFIRMED', 'COD', 20000, '', 750000, NOW(), NOW()),
(13, 13, 13, 'DELIVERED', 'COD', 30000, 'Handle with care', 850000, NOW(), NOW()),

(15, 15, 15, 'PENDING', 'COD', 35000, '', 550000, NOW(), NULL),
(16, 16, 16, 'DELIVERED', 'Online', 20000, 'Call before arriving', 300000, NOW(), NOW()),
(17, 17, 17, 'CONFIRMED', 'COD', 25000, '', 800000, NOW(), NOW()),
(18, 18, 18, 'DELIVERED', 'COD', 15000, 'Deliver to front desk', 650000, NOW(), NOW()),

(20, 20, 20, 'DELIVERED', 'Online', 30000, 'Leave at security gate', 900000, NOW(), NOW());



INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `total_price`) VALUES
(1, 1, 1, 2, 400000),
(2, 1, 2, 1, 100000),
(3, 2, 3, 3, 900000),
(4, 2, 4, 1, 300000),
(5, 3, 5, 2, 600000),
(6, 3, 6, 1, 600000),
(7, 4, 7, 2, 400000),
(8, 4, 8, 1, 50000),
(9, 5, 9, 3, 600000),
(10, 5, 10, 1, 300000),
(12, 7, 12, 2, 400000),
(13, 7, 13, 1, 300000),
(14, 8, 14, 2, 500000),
(15, 9, 15, 1, 300000),
(16, 10, 16, 1, 400000),
(17, 11, 17, 2, 500000),
(18, 12, 18, 3, 750000),
(19, 13, 19, 2, 700000);


INSERT INTO `payment` (`id`, `order_id`, `user_id`, `method`, `status`, `amount`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'COD', 'COMPLETED', 500000, 'TX123456', NOW(), NOW()),
(2, 2, 2, 'Online', 'COMPLETED', 800000, 'TX123457', NOW(), NOW()),
(3, 3, 3, 'COD', 'COMPLETED', 1200000, 'TX123458', NOW(), NOW()),
(4, 4, 4, 'COD', 'PENDING', 450000, 'TX123459', NOW(), NULL),
(5, 5, 5, 'Online', 'COMPLETED', 900000, 'TX123460', NOW(), NOW()),
(7, 7, 7, 'COD', 'PENDING', 700000, 'TX123462', NOW(), NULL),
(8, 8, 8, 'Online', 'COMPLETED', 950000, 'TX123463', NOW(), NOW()),
(9, 9, 9, 'COD', 'COMPLETED', 600000, 'TX123464', NOW(), NOW()),
(10, 10, 10, 'COD', 'COMPLETED', 400000, 'TX123465', NOW(), NOW()),
(11, 11, 11, 'Online', 'PENDING', 500000, 'TX123466', NOW(), NULL),
(12, 12, 12, 'COD', 'COMPLETED', 750000, 'TX123467', NOW(), NOW()),
(13, 13, 13, 'COD', 'COMPLETED', 850000, 'TX123468', NOW(), NOW()),
(15, 15, 15, 'COD', 'PENDING', 550000, 'TX123470', NOW(), NULL),
(16, 16, 16, 'Online', 'COMPLETED', 300000, 'TX123471', NOW(), NOW()),
(17, 17, 17, 'COD', 'COMPLETED', 800000, 'TX123472', NOW(), NOW()),
(18, 18, 18, 'COD', 'COMPLETED', 650000, 'TX123473', NOW(), NOW()),
(20, 20, 20, 'Online', 'COMPLETED', 900000, 'TX123475', NOW(), NOW());

INSERT INTO `coupon` (`code`, `min_order_value`, `discount_type`, `discount_value`, `start_date`, `end_date`, `current_usage`, `max_usage`, `created_at`)
VALUES
('SAVE10', 100000, 'PERCENTAGE', 10, '2025-01-01', '2025-12-31', 0, 100, NOW()),
('SAVE20', 200000, 'PERCENTAGE', 20, '2025-01-01', '2025-12-31', 0, 50, NOW()),
('WELCOME50', 50000, 'FIXED', 50000, '2025-01-01', '2025-12-31', 0, 200, NOW()),
('FREESHIP', 0, 'FIXED', 30000, '2025-01-01', '2025-06-30', 0, NULL, NOW()),
('NEWYEAR25', 250000, 'PERCENTAGE', 25, '2025-01-01', '2025-03-31', 0, 150, NOW()),
('SUMMER15', 150000, 'PERCENTAGE', 15, '2025-06-01', '2025-08-31', 0, 100, NOW()),
('WINTER30', 300000, 'PERCENTAGE', 30, '2025-11-01', '2025-12-31', 0, 50, NOW()),
('LUCKY100', 1000000, 'FIXED', 100000, '2025-01-01', '2025-12-31', 0, 10, NOW()),
('FLASH50', 50000, 'PERCENTAGE', 50, '2025-01-01', '2025-01-07', 0, 500, NOW()),
('HOLIDAY20', 200000, 'PERCENTAGE', 20, '2025-12-15', '2025-12-31', 0, 100, NOW()),
('BIRTHDAY', 0, 'FIXED', 150000, '2025-01-01', '2025-12-31', 0, 30, NOW()),
('SHOPNOW10', 50000, 'PERCENTAGE', 10, '2025-01-01', '2025-12-31', 0, NULL, NOW()),
('SPECIAL5', 100000, 'FIXED', 50000, '2025-01-01', '2025-06-30', 0, 500, NOW()),
('EXTRA30', 300000, 'PERCENTAGE', 30, '2025-03-01', '2025-06-30', 0, 100, NOW()),
('FAMILY20', 200000, 'PERCENTAGE', 20, '2025-07-01', '2025-09-30', 0, 100, NOW()),
('VIP100', 1000000, 'FIXED', 200000, '2025-01-01', '2025-12-31', 0, 5, NOW()),
('MIDWEEK25', 250000, 'PERCENTAGE', 25, '2025-01-01', '2025-01-31', 0, 100, NOW()),
('BLACKFRIDAY', 0, 'PERCENTAGE', 50, '2025-11-25', '2025-11-30', 0, NULL, NOW()),
('CYBERMONDAY', 0, 'PERCENTAGE', 40, '2025-12-01', '2025-12-02', 0, NULL, NOW()),
('STUDENT10', 50000, 'PERCENTAGE', 10, '2025-01-01', '2025-12-31', 0, 300, NOW());
