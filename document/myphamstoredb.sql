create database myphamstoredb;

use myphamstoredb;

CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` nvarchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) UNIQUE NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` ENUM ('MALE', 'FEMALE', 'OTHER') NOT NULL,
  `avatar` varchar(500),
  `status` ENUM ('NONE', 'ACTIVE', 'INACTIVE') not null,
  `last_login` datetime,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `user_has_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL
);

CREATE TABLE `address` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `recipient_name` nvarchar(255) NOT NULL,
  `recipient_phone` varchar(15) NOT NULL,
  `city` nvarchar(255) NOT NULL,
  `district` nvarchar(255) NOT NULL,
  `ward` nvarchar(255) NOT NULL,
  `note` nvarchar(255),
  `is_default` boolean DEFAULT false,
  `is_active` boolean DEFAULT true,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `brand` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` nvarchar(255) NOT NULL,
  `logo` varchar(500) NOT NULL,
  `is_available` boolean default true,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `parent_id` int DEFAULT null,
  `name` nvarchar(255) NOT NULL,
  `description` varchar(500) null,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `product_image` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `product_id` int
);

CREATE TABLE `product` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` nvarchar(255) NOT NULL,
  `price` int NOT NULL,
  `cost_price` int NOT NULL,
  `stock` int NOT NULL,
  `sold_quantity` int default 0,
  `description` text  null,
  `is_available` boolean DEFAULT true,
  `thumbnail` varchar(500) NOT NULL,
  `brand_id` int ,
  `category_id` int,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);
CREATE TABLE product_variant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    name NVARCHAR(255) DEFAULT NULL, -- Tên phiên bản (VD: "Màu đỏ", "500ml")
    price INT NOT NULL,
    stock INT DEFAULT 0,
    sold_quantity INT DEFAULT 0,
    thumbnail TEXT(500) DEFAULT NULL, -- Ảnh riêng cho phiên bản
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE `review` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `product_id` int,
  `rating` int NOT NULL,
  `comment` text null,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `address_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` ENUM ('PENDING', 'AWAITING_PAYMENT', 'CONFIRMED', 'PREPARING', 'SHIPPING', 'DELIVERY_FAILED', 'DELIVERED', 'CANCELED', 'RETURNING', 'RETURNED') DEFAULT 'PENDING',
  `payment_method` varchar(255),
  `shipping_fee` int default 0,
  `note` varchar(500) null,
  `total_price` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT (now()),
  `confirm_at` datetime DEFAULT (now())
);

CREATE TABLE `order_detail` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_price` int NOT NULL
);

CREATE TABLE `slide` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `image` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  is_available BOOLEAN NOT NULL DEFAULT TRUE,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `contact` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `title` nvarchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` ENUM ('PENDING', 'DONE') NOT NULL DEFAULT 'PENDING',
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `payment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `user_id` int,
  `method` varchar(255) NOT NULL,
  `status` ENUM ('PENDING', 'COMPLETED', 'FAILED', 'REFUNDED', 'CANCELLED') NOT NULL,
  `amount` int NOT NULL,
  `transaction_id` varchar(255),
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now())
);

CREATE TABLE `coupon` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `code` varchar(50) UNIQUE NOT NULL,
  `min_order_value` int DEFAULT 0,
  `discount_type` enum('PERCENTAGE','FIXED') NOT NULL,
  `discount_value` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `current_usage` int DEFAULT 0,
  `max_usage` int  null,
  `created_at` datetime DEFAULT (now()),
  `is_available` boolean default true,
  `brand_id` int null
<<<<<<< HEAD

=======
>>>>>>> 0882a4ccc82f6bc420f3ef22a92f07f9c346986c
);


CREATE TABLE `wishlist` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `product_id` int,
  `created_at` datetime DEFAULT (now())
);

ALTER TABLE `user_has_role` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_has_role` ADD FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

ALTER TABLE `address` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `category` ADD FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

ALTER TABLE `product_image` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `wishlist` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `wishlist` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `coupon` ADD FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);
