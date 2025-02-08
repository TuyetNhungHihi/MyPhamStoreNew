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





INSERT INTO `orders` (`id`, `address_id`, `user_id`, `status`, `payment_method`, `shipping_fee`, `note`, `total_price`, `order_date`, `confirmed_at`) VALUES
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

INSERT INTO `coupon` (`code`, `min_order_value`, `discount_type`, `discount_value`, `start_date`, `end_date`, `current_usage`, `max_usage`, `created_at`, `is_available`)
VALUES 
('SAVE10', 50000, 'PERCENTAGE', 10, '2025-01-01', '2025-12-31', 0, 100, NOW(), TRUE),
('DISCOUNT20', 100000, 'PERCENTAGE', 20, '2025-01-01', '2025-12-31', 0, 200, NOW(), TRUE),
('FIXED50', 200000, 'FIXED', 50000, '2025-02-01', '2025-11-30', 0, NULL, NOW(), TRUE),
('WELCOME25', 0, 'PERCENTAGE', 25, '2025-01-15', '2025-12-15', 0, 50, NOW(), TRUE),
('WINTER15', 50000, 'FIXED', 15000, '2025-01-01', '2025-03-31', 0, 300, NOW(), TRUE),
('SUMMER10', 100000, 'PERCENTAGE', 10, '2025-06-01', '2025-08-31', 0, 500, NOW(), TRUE),
('FREESHIP', 0, 'FIXED', 30000, '2025-01-01', '2025-12-31', 0, 1000, NOW(), TRUE),
('BRANDOFF50', 300000, 'FIXED', 50000, '2025-01-20', '2025-07-20', 0, 100, NOW(), TRUE),
('SHOPMORE30', 50000, 'PERCENTAGE', 30, '2025-02-01', '2025-05-01', 0, NULL, NOW(), TRUE),
('EXTRA100', 200000, 'FIXED', 100000, '2025-01-01', '2025-04-30', 0, 50, NOW(), TRUE),
('NEWYEAR20', 100000, 'PERCENTAGE', 20, '2025-01-01', '2025-01-31', 0, 150, NOW(), TRUE),
('SPRINGSALE15', 150000, 'PERCENTAGE', 15, '2025-03-01', '2025-05-31', 0, NULL, NOW(), TRUE),
('AUTUMN20', 80000, 'PERCENTAGE', 20, '2025-09-01', '2025-11-30', 0, 200, NOW(), TRUE),
('HOLIDAY50', 0, 'FIXED', 50000, '2025-12-01', '2025-12-31', 0, 300, NOW(), TRUE),
('STUDENT10', 50000, 'PERCENTAGE', 10, '2025-01-01', '2025-12-31', 0, 1000, NOW(), TRUE),
('LOYALTY25', 100000, 'PERCENTAGE', 25, '2025-01-01', '2025-12-31', 0, 200, NOW(), TRUE),
('BULKBUY30', 200000, 'PERCENTAGE', 30, '2025-01-01', '2025-06-30', 0, NULL, NOW(), TRUE),
('FLASHSALE50', 0, 'PERCENTAGE', 50, '2025-01-15', '2025-01-20', 0, 500, NOW(), TRUE),
('WEEKEND15', 100000, 'PERCENTAGE', 15, '2025-01-01', '2025-12-31', 0, 100, NOW(), TRUE),
('SPECIAL100', 300000, 'FIXED', 100000, '2025-01-01', '2025-03-31', 0, 50, NOW(), TRUE);


INSERT INTO `myphamstoredb`.`user` (`id`, `full_name`, `email`, `password`, `phone`, `date_of_birth`, `gender`, `status`, `last_login`, `created_at`, `updated_at`)
VALUES ('1', 'admin', 'admin@gmail.com', '$2a$10$JNKRA4nCHtm9f/bR8JOK1esDVwRKulplrtAhdvRppfvqskmgR1/3u', '012123123', '2025-02-06', 'MALE', 'ACTIVE', '2025-02-08 09:26:34', '2025-02-08 09:26:34', '2025-02-08 09:26:34');
insert into user_has_role values(1,1);