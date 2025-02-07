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
    <link rel="stylesheet" type="text/css" href="../static/css/history.css" />
    <!-- favicon links -->
    <link rel="shortcut icon" type="image/png" href="../static/images/header/favicon.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<body>
<%--<!-- preloader Start -->--%>
<%--&lt;%&ndash;<div id="preloader">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div id="status">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <img src="../static/images/header/preloader.gif" id="preloader_image" alt="loader">&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--<!-- Top Scroll Start -->--%>
<%--<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>--%>
<%--<!-- Top Scroll End -->--%>
<%--<!-- Header Wrapper Start -->--%>
<%--<%@include file="component/nav.jsp"%>--%>
<%--<%@include file="component/header.jsp"%>--%>
<%--<!-- Header Wrapper End -->--%>

<%--<div class="container">--%>
<%--    <h1>Lịch Sử Mua Hàng</h1>--%>
<%--    <div class="order-list">--%>
<%--        <c:forEach var="order" items="${orderHistory}">--%>
<%--            <div class="order">--%>
<%--                <div class="order-header">--%>
<%--                    <span class="order-date"><i class="fas fa-calendar-alt"></i> ${order.orderDate}</span>--%>
<%--                    <span class="order-status ${order.status.toLowerCase()}"><i class="fas fa-check-circle"></i> ${order.status}</span>--%>
<%--                </div>--%>
<%--                <div class="order-details">--%>
<%--                    <c:forEach var="product" items="${order.products}">--%>
<%--                        <div class="product">--%>
<%--                            <img src="${product.thumbnail}" alt="${product.name}">--%>
<%--                            <div class="product-info">--%>
<%--                                <h3>${product.name}</h3>--%>
<%--                                <p>Số lượng: ${product.quantity}</p>--%>
<%--                                <p>Giá: ${product.price} VNĐ</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--                <div class="order-total">--%>
<%--                    <strong>Tổng cộng: ${order.totalPrice} VNĐ</strong>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- Brandlogo Wrapper End -->--%>
<%--<%@include file="component/footer.jsp"%>--%>
<%--<!-- Footer Wrapper End -->--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    document.addEventListener("DOMContentLoaded", function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        var preloader = document.getElementById("preloader");&ndash;%&gt;--%>
<%--&lt;%&ndash;        if (preloader) {&ndash;%&gt;--%>
<%--&lt;%&ndash;            preloader.style.display = "none";&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    });&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--<!--main js file start-->--%>
<%--<script src="../static/js/jquery_min.js"></script>--%>
<%--<script src="../static/js/wow.js"></script>--%>
<%--<script src="../static/js/bootstrap.js"></script>--%>
<%--<script src="../static/js/owl.carousel.js"></script>--%>
<%--<script src="../static/js/modernizr.js"></script>--%>
<%--<script src="../static/js/jquery.magnific-popup.js"></script>--%>
<%--<script src="../static/js/jquery.dlmenu.js"></script>--%>
<%--<script src="../static/js/jquery.sticky.js"></script>--%>
<%--<script src="../static/js/jquery.menu-aim.js"></script>--%>
<%--<script src="../static/js/camera.min.js"></script>--%>
<%--<script src="../static/js/jquery.easing.1.3.js"></script>--%>
<%--<script src="../static/js/jquery.inview.min.js"></script>--%>
<%--<script src="../static/js/custom.js"></script>--%>
<%--<!--main js file end-->--%>
<%--<!-- demo feature -->--%>
<%--<script src="../static/js/demo/login-label.js"></script>--%>

<%--</body>--%>
<%--</html>--%>


<div id="preloader">
    <div id="status">
        <img src="../static/images/header/preloader.gif" id="preloader_image" alt="loader">
    </div>
</div>
<!-- Top Scroll Start -->
<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>
<!-- Top Scroll End -->
<%@include file="component/nav.jsp"%>
<%@include file="component/header.jsp"%>
<!-- Header Wrapper Start -->
<div class="ss_inner_title_wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="ss_inner_title_cont_wrapper">
                    <ul>
                        <li>
                            <a href="#"><i class="fa fa-home"></i></a>&nbsp;&nbsp; >
                        </li>
                        <li>Lịch sử đơn hàng</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content -->
<div class="container" >
    <div style="height: 50px; background-color: white;z-index: 10;; width: 100vw;"></div>
    <div class="container px-4 mt-4">
        <h1>Lịch sử đơn hàng  </h1>

        <hr class="mt-0 mb-4">
        <hr class="container">
        <div class="row d-flex">
            <!-- Profile picture section -->
            <div class="col-md-4">
                <div class="card mb-4">
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
            </div>
        </div>
        </hr>
    </div>
</div>
</div>
<!-- end content -->
<!-- Footer Wrapper End -->
<%@include file="component/footer.jsp"%>


<script src="../static/js/jquery_min.js"></script>
<script src="../static/js/wow.js"></script>
<script src="../static/js/bootstrap.js"></script>
<script src="../static/js/owl.carousel.js"></script>
<script src="../static/js/modernizr.js"></script>
<script src="../static/js/jquery.magnific-popup.js"></script>
<script src="../static/js/jquery.dlmenu.js"></script>
<script src="../static/js/jquery.sticky.js"></script>
<script src="../static/js/jquery.menu-aim.js"></script>
<script src="../static/js/camera.min.js"></script>
<script src="../static/js/jquery.easing.1.3.js"></script>
<script src="../static/js/jquery.inview.min.js"></script>
<script src="../static/js/custom.js"></script>

</body>
</html>
