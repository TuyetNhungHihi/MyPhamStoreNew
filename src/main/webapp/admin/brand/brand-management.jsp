<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: haile
  Date: 1/13/2025
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--srart theme style -->
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/animate.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/bootstrap.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/font-awesome.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/owl.carousel.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/owl.theme.default.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/magnific-popup.css"
    />
    <link rel="stylesheet" type="text/css" href="../../static/css/fonts.css" />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/dl-menu.css"
    />
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../../static/css/camera.css" />
    <link rel="stylesheet" type="text/css" href="../../static/css/style.css" />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/responsive.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../static/css/sidebar.css"
    />
    <!-- favicon links -->
    <link
            rel="shortcut icon"
            type="image/png"
            href="../../static/images/header/favicon.png"
    />
    <link
            rel="stylesheet"
            href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css"
    />
    <link rel="stylesheet" href="../../static/css/brand-management.css" />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <title>Quản lý nhãn hàng</title>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar" id="sidebar"></div>
<!-- end sidebar -->
<!-- start header -->
<div class="main-content" id="header" style="margin-left: 0"></div>
<!-- end header -->
<div class="main-content">
    <main>
        <div class="main">
            <div class="cards">
                <div class="card-single">
                    <div class="card-flex">
                        <div class="card-info">
                            <div class="card-head">
                                <span>Các Nhãn hàng nhập vào</span>
                                <small>Số lượng</small>
                            </div>

                            <p class="cost">17,633</p>
                            <small>Ít hơn 2% so với tháng trước</small>
                        </div>

                        <div class="card-chart">
                            <span class="las la-chart-line"></span>
                        </div>
                    </div>
                </div>

                <div class="card-single">
                    <div class="card-flex">
                        <div class="card-info">
                            <div class="card-head">
                                <span>Nhãn hàng bán nhiều nhất</span>
                                <small>Số lượng</small>
                            </div>

                            <p class="cost">57,633</p>
                            <small>Tăng 12% so với tháng trước</small>
                        </div>

                        <div class="card-chart">
                            <span class="green las la-chart-line"></span>
                        </div>
                    </div>
                </div>

                <div class="card-single">
                    <div class="card-flex">
                        <div class="card-info">
                            <div class="card-head">
                                <span>Số lượng sản phẩm của Nhãn hàng còn lại</span>
                                <small>Số lượng</small>
                            </div>

                            <p class="cost">157,633</p>
                            <small>Ít hơn 10% so với tháng trước</small>
                        </div>
                        <div class="card-chart">
                            <span class="orange las la-chart-line"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="body">
            <div class="jobs">
                <main class="main-content row my-table-custom">
                    <!--style="display: flex; position: relative; height: min-content;"> -->
                    <div class=" " style="width: 100%">
                        <h1 class="text-center" style="margin-bottom: 20px">
                            Quản lý Nhãn hàng
                        </h1>
                        <div class="row" style="margin-bottom: 20px">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Tìm kiếm sản phẩm..."
                                    />
                                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                          Tìm Kiếm
                        </button>
                      </span>
                                </div>
                                <!-- /input-group -->
                            </div>
                            <!-- /.col-lg-6 -->
                            <div class="col-lg-6">
                    <span style="float: left; margin-top: 5px"
                    ><strong>Hiển thị (1- 10)</strong> trên 100 Nhãn
                      hàng</span
                    >
                                <a
                                        href="./add-brand.html"
                                        class="btn btn-primary"
                                        style="float: right"
                                >Thêm Nhãn hàng</a
                                >
                            </div>
                        </div>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th class="text-center">id</th>
                                <th class="text-center">Tên Nhãn hàng</th>
                                <th class="text-center">Còn lại</th>
                                <th class="text-center">Đã bán</th>
                                <th class="text-center">Đang bán</th>
                                <th class="text-center">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="brand" items="${brands}">
                                <tr>
                                    <td class="text-center">${brand.id}</td>
                                    <td>${brand.name}</td>
                                    <td class="text-center">${brand.quantity}</td>
                                    <td class="text-center">${brand.sold}</td>
                                    <td class="text-center">
                                        <span class="active-product"></span>
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-primary">Sửa</button>
                                        <button class="btn btn-danger">Xóa</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 100%" class="text-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a class="previous-btn" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li class="active"><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a class="next-btn" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </main>
            </div>
        </section>
    </main>
</div>
<label for="sidebar" class="body-label" id="body-label"></label>

<script>
    const header = document.getElementById("header");
    const sidebar1 = document.getElementById("sidebar");

    fetch("../components/admin-header.html")
        .then((response) => {
            return response.text();
        })
        .then((data) => {
            header.innerHTML = data;
        });
    fetch("../components/admin-sidebar.html")
        .then((response) => {
            return response.text();
        })
        .then((data) => {
            sidebar1.innerHTML = data;
        });
</script>
<script src="../../static/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
<script src="../../static/js/admin.js"></script>
<script src="../../static/js/brand-management.js"></script>
</body>
</html>
