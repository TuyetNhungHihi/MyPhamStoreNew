<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/6/2025
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Quản lý đơn đặt hàng</title>
    <link rel="stylesheet" href="../../static/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!--srart theme style -->
    <link rel="stylesheet" type="text/css" href="../../static/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../static/css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="../../static/css/responsive.css" />
    <!-- favicon links -->
    <link rel="shortcut icon" type="image/png" href="../../static/images/header/favicon.png" />
    <link rel="stylesheet"
          href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../../static/css/category-management.css">
    <link rel="stylesheet" href="../../static/css/admin-management.css">
    z
</head>

<body>

<div class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar " id="sidebar">
        <%@include file="/admin/components/admin-sidebar.jsp"%>
    </div>
    <!-- end sidebar -->
    <!-- start header -->
    <div class="main-content" id="header" style="margin-left: 0; height: fit-content;">
        <%@include file="/admin/components/admin-header.jsp"%>
    </div>
    <!-- end header -->

    <!-- Main Content -->
    <main class="main-content row my-table-custom" ><!--style="display: flex; position: relative; height: min-content;"> -->
        <div class=" " style="width: 100%;">
            <h1 class="text-center " style="margin-bottom: 20px;">Quản lý đơn đặt hàng</h1>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Tìm kiếm đơn đặt hàng...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Tìm Kiếm</button>
                          </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <span style="float: left; margin-top: 5px;"><strong>Hiển thị (1- 10)</strong> trên 100 đơn đặt hàng</span>
                </div>
            </div>
            <table class="table table-striped ">
                <thead >
                <tr>
                    <th  class="text-center">Mã đơn</th>
                    <th class="text-center">Mã khách hàng</th>
                    <th class="text-center">Tên người nhận</th>
                    <th class="text-center">Số điện thoại</th>
                    <th class="text-center">Địa chỉ nhận hàng</th>
                    <th class="text-center">Thanh toán</th>
                    <th class="text-center">Trạng thái</th>
                    <th class="text-center">Hành Động</th>

                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="text-center">1</td>
                    <td class="text-center" >2</td>
                    <td class="text-center">Nguyễn Ngọc Hân</td>
                    <td class="text-center">0123456789</td>
                    <td class="text-center">linh trung, thủ đức, tp.hcm</td>
                    <td class="text-center">MOMO</td>
                    <td class="text-center"  >Chờ thanh toán</td>
                    <td class="text-center">
                        <a href="/src/main/webapp/admin/order/order-detail.html" class="btn btn-success">Chi tiết</a>
                        <button class="btn btn-primary">Xác nhận</button>
                        <button class="btn btn-danger">Huỷ đơn</button>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">2</td>
                    <td class="text-center" >1</td>
                    <td class="text-center">Nguyễn Hân Ngọc</td>
                    <td class="text-center">9876543210</td>
                    <td class="text-center">linh trung, thủ đức, tp.hcm</td>
                    <td class="text-center">Paypal</td>
                    <td class="text-center"  >Đã thanh toán(Chờ xác nhận)</td>
                    <td class="text-center">
                        <a href="/src/main/webapp/admin/order/order-detail.html" class="btn btn-success">Chi tiết</a>
                        <button class="btn btn-primary">Xác nhận</button>
                        <button class="btn btn-danger">Huỷ đơn</button>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">2</td>
                    <td class="text-center" >1</td>
                    <td class="text-center">Nguyễn Hân Ngọc</td>
                    <td class="text-center">9876543210</td>
                    <td class="text-center">linh trung, thủ đức, tp.hcm</td>
                    <td class="text-center">Paypal</td>
                    <td class="text-center"  >Chưa thanh toán</td>
                    <td class="text-center">
                        <a href="/src/main/webapp/admin/order/order-detail.html" class="btn btn-success">Chi tiết</a>
                        <button class="btn btn-primary">Xác nhận</button>
                        <button class="btn btn-danger">Huỷ đơn</button>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">3</td>
                    <td class="text-center" >3</td>
                    <td class="text-center">Hân Nguyễn Ngọc</td>
                    <td class="text-center">9876543210</td>
                    <td class="text-center">linh trung, thủ đức, tp.hcm</td>
                    <td class="text-center">Paypal</td>
                    <td class="text-center"  > Đã xác nhận</td>
                    <td class="text-center">
                        <a href="/src/main/webapp/admin/order/order-detail.html" class="btn btn-success">Chi tiết</a>
                        <button class="btn btn-danger">Huỷ đơn</button>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">4</td>
                    <td class="text-center" >3</td>
                    <td class="text-center">Ngọc Hân Nguyễn </td>
                    <td class="text-center">9876543210</td>
                    <td class="text-center">linh trung, thủ đức, tp.hcm</td>
                    <td class="text-center">COD</td>
                    <td class="text-center"  >Trả về</td>
                    <td class="text-center">
                        <a href="/src/main/webapp/admin/order/order-detail.html" class="btn btn-success">Chi tiết</a>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">5</td>
                    <td class="text-center" >3</td>
                    <td class="text-center">Ngọc Nguyễn Hân  </td>
                    <td class="text-center">9876543210</td>
                    <td class="text-center">linh trung, thủ đức, tp.hcm</td>
                    <td class="text-center">COD</td>
                    <td class="text-center"  > Đã huỷ</td>
                    <td class="text-center">
                        <a href="/src/main/webapp/admin/order/order-detail.html" class="btn btn-success">Chi tiết</a>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">5</td>
                    <td class="text-center" >3</td>
                    <td class="text-center">Ngọc Nguyễn Hân  </td>
                    <td class="text-center">9876543210</td>
                    <td class="text-center">linh trung, thủ đức, tp.hcm</td>
                    <td class="text-center">COD</td>
                    <td class="text-center"  > Giao thành công</td>
                    <td class="text-center">
                        <a href="/src/main/webapp/admin/order/order-detail.html" class="btn btn-success">Chi tiết</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div style="width: 100%;" class="text-center">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li >
                        <a class="previous-btn" href="#" aria-label="Previous" >
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li class="active"><a  href="#">3</a></li>
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
    <label for="sidebar" class="body-label" id="body-label"></label>
</div>

<script src="../../static/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
<script src="../../static/js/admin.js"> </script>
<script src="../../static/js/category-management.js"></script>
</body>

</html>
