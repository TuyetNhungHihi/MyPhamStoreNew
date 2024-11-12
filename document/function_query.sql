use myphamstoredb;

-- chức năng xem sản phẩm (kết hợp phân trang)-- 
-- DELIMITER //
-- CREATE PROCEDURE get_paginated_products(IN items_per_page INT, IN page_number INT)
-- BEGIN
--     DECLARE offset_value INT;
--     
--     -- Tính toán offset
--     SET offset_value = (page_number - 1 ) * items_per_page;
-- 	
--     -- Truy vấn để lấy sản phẩm phân trang
--     SELECT Product.id AS product_id, Product.name AS product_name, 
--            Product.price AS product_price, Product.stock AS product_stock,
--            Product.soldQuantity AS product_sold_quantity, 
--            Brand.name AS brand_name, Category.name AS category_name, 
--            Product.createdDate AS product_created_date
--     FROM Product
--     JOIN Brand ON Product.brandId = Brand.id
--     JOIN Category ON Product.categoryId = Category.id
--     ORDER BY Product.createdDate DESC
--     LIMIT items_per_page OFFSET offset_value;
-- END //

-- DELIMITER ;
-- CALL get_paginated_products(3, 1);

    
 --    Chức năng tìm kiếm sản phẩm
-- DELIMITER //

-- CREATE PROCEDURE search_product_with_multiple_conditions(
--     IN search_name VARCHAR(255), IN min_price DECIMAL(10,2), IN max_price DECIMAL(10,2), IN min_stock INT, IN max_stock INT, IN brand_name VARCHAR(255))
-- BEGIN
--     SELECT Product.id AS product_id, 
--            Product.name AS product_name, 
--            Product.price AS product_price, 
--            Product.stock AS product_stock,
--            Brand.name AS brand_name, 
--            Category.name AS category_name
--     FROM Product
--     JOIN Brand ON Product.brandId = Brand.id
--     JOIN Category ON Product.categoryId = Category.id
--     WHERE (Product.name LIKE CONCAT('%', search_name, '%') OR search_name IS NULL)
--       AND (Product.price BETWEEN min_price AND max_price OR (min_price IS NULL AND max_price IS NULL))
--       AND (Product.stock BETWEEN min_stock AND max_stock OR (min_stock IS NULL AND max_stock IS NULL))
--       AND (Brand.name LIKE CONCAT('%', brand_name, '%') OR brand_name IS NULL)
--     ORDER BY Product.createdDate DESC;
-- END //
-- DELIMITER ;
-- call search_product_with_multiple_conditions('1', null, null, null, null, null)

-- Chức năng thêm sản phẩm
-- DELIMITER //

-- CREATE PROCEDURE insert_order(
--     IN p_order_total DECIMAL(10,2),
--     IN p_status VARCHAR(255),
--     IN p_payment_method VARCHAR(255),
--     IN p_recipient_name VARCHAR(255),
--     IN p_recipient_phone VARCHAR(255),
--     IN p_address_id INT,
--     IN p_customer_id INT
-- )
-- BEGIN
--     INSERT INTO `Order` (orderDate, orderTotal, status, paymentMethod, recipientName, recipientPhone, addressId, customerId)
--     VALUES (NOW(), p_order_total, p_status, p_payment_method, p_recipient_name, p_recipient_phone, p_address_id, p_customer_id);
-- END //

-- DELIMITER ;
-- CALL insert_order(500.00, 'Pending', 'Credit Card', 'Customer One', '0123456789', 2, 1);

-- Chức năng lịch sử order
-- DELIMITER //

-- CREATE PROCEDURE order_history(IN p_customer_id INT)
-- BEGIN
--     SELECT o.id AS order_id, 
--            o.orderDate, 
--            o.orderTotal, 
--            o.status, 
--            o.paymentMethod
--     FROM `Order` o
--     WHERE o.customerId = p_customer_id
--     ORDER BY o.orderDate DESC;
-- END //

-- DELIMITER ;
-- CALL order_history(1);

-- xem thông tin cá nhân

-- DELIMITER //

-- CREATE PROCEDURE get_customer_info(IN p_customer_id INT)
-- BEGIN
--     SELECT *
--     FROM Customer
--     WHERE id = p_customer_id;
-- END //

-- DELIMITER ;
-- call get_customer_info(2)

-- đổi mật khẩu
DELIMITER //
CREATE PROCEDURE change_password(
    IN p_customer_id INT,
    IN p_old_password VARCHAR(255),
    IN p_new_password VARCHAR(255)
)
BEGIN
    -- Kiểm tra mật khẩu cũ có đúng không
    IF EXISTS (SELECT 1 FROM Customer WHERE id = p_customer_id AND password = p_old_password) THEN
        -- Nếu đúng, cập nhật mật khẩu mới
        UPDATE Customer
        SET password = p_new_password
        WHERE id = p_customer_id;
    ELSE
        -- Nếu mật khẩu cũ sai, phát sinh lỗi
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu cũ không đúng!';
    END IF;
END //
DELIMITER ;
CALL change_password(1, 'old_password123', 'new_password456');



