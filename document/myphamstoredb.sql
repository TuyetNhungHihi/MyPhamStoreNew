CREATE SCHEMA `user`;

CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` nvarchar NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` ENUM ('MALE', 'FEMALE', 'ORTHER') NOT NULL,
  `created_at` datetime DEFAULT 'now()',
  `updated_at` datetime DEFAULT 'now()'
);
