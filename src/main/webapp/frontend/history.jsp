<%@include file="/common/tablib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch Sử Mua Hàng</title>
    <link rel="stylesheet" type="text/css" href="../static/css/history.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/owl.theme.default.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/magnific-popup.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/dl-menu.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/camera.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/responsive.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/sidebar.css" />
    <!-- favicon links -->
    <link rel="shortcut icon" type="image/png" href="../static/images/header/favicon.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<!-- preloader Start -->
<div id="preloader">
    <div id="status">
        <img src="../static/images/header/preloader.gif" id="preloader_image" alt="loader">
    </div>
</div>
<!-- Top Scroll Start -->
<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>
<!-- Top Scroll End -->
<!-- Header Wrapper Start -->
<%@include file="component/nav.jsp"%>
<%@include file="component/header.jsp"%>
<!-- Header Wrapper End -->

<div class="container">
    <h1>Lịch Sử Mua Hàng</h1>
    <div class="order-list">
        <c:forEach var="order" items="${orderHistory}">
            <div class="order">
                <div class="order-header">
                    <span class="order-date"><i class="fas fa-calendar-alt"></i> ${order.orderDate}</span>
                    <span class="order-status ${order.status.toLowerCase()}"><i class="fas fa-check-circle"></i> ${order.status}</span>
                </div>
                <div class="order-details">
                    <c:forEach var="product" items="${order.products}">
                        <div class="product">
                            <img src="${product.thumbnail}" alt="${product.name}">
                            <div class="product-info">
                                <h3>${product.name}</h3>
                                <p>Số lượng: ${product.quantity}</p>
                                <p>Giá: ${product.price} VNĐ</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="order-total">
                    <strong>Tổng cộng: ${order.totalPrice} VNĐ</strong>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!-- Brandlogo Wrapper End -->
<%@include file="component/footer.jsp"%>
<!-- Footer Wrapper End -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var preloader = document.getElementById("preloader");
        if (preloader) {
            preloader.style.display = "none";
        }
    });
</script>
</body>
</html>