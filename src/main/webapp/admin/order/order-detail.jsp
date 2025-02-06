<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/6/2025
  Time: 11:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
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
    <main class="main-content row my-table-custom">
        <!--style="display: flex; position: relative; height: min-content;"> -->
        <div class=" " style="width: 100%;">
            <h1 class="text-center " style="margin-bottom: 20px;">Chi tiết đơn đặt hàng <strong>#12</strong></h1>
            <form class="" action="#" method="post" style="padding: 0 100px 0 100px;">
                <div class="row">
                    <div class="col-md-12 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label class="input-group-addon" for="recipientName" id="basic-addon1">Tên Người Nhận</label>
                            <input readonly type="text" class="form-control" id="recipientName" name="recipientName"  value="Nguyễn Ngọc Hân"
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label for="soldQuantity" class="input-group-addon" id="basic-addon1">Địa chỉ nhận hàng</label>
                            <input type="text" name="soldQuantity" id="soldQuantity" class="form-control" readonly value="Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội"
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                </div>
                <div class="row " >
                    <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label class="input-group-addon" id="basic-addon1" for="createdAt">Ngày đặt đơn</label>
                            <input type="text" id="createdAt" name="createdAt" class="form-control" value="01-11-2024 11:11:11" readonly
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label class="input-group-addon" id="basic-addon1" for="confirmAt">Ngày xác nhận</label>
                            <input type="text" id="confirmAt" name="confirmAt" class="form-control" value="01-12-2024 11:11:11" readonly
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label class="input-group-addon" id="basic-addon1" for="status">Trạng thái</label>
                            <input type="text" id="status" name="status" class="form-control" value="Đã giao hàng" readonly
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label class="input-group-addon" id="basic-addon1" for="paymentMethod">Thanh toán</label>
                            <input type="text" id="paymentMethod" name="paymentMethod" class="form-control" value="Momo" readonly
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label class="input-group-addon" id="basic-addon1" for="shippingFee">Phí vận chuyển</label>
                            <input type="text" id="shippingFee" name="shippingFee" class="form-control" value="2,000đ" readonly
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                        <div class="input-group">
                            <label class="input-group-addon" id="basic-addon1" for="totalPrice">Tổng tiền</label>
                            <input type="text" id="totalPrice" name="totalPrice" class="form-control" value="202,000đ" readonly
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-12"" style="margin-top: 20px;">
                    <div class="input-group">
                        <label for="note" class="input-group-addon" id="basic-addon1">Ghi chú của khách hàng</label>
                        <input id="note" type="text"  class="form-control" readonly value="Nhìu hành tí nha chú!"
                               aria-describedby="basic-addon1"></input>
                    </div>
                </div>
        </div>
        <div class="col-md-12 col-xs-12" style="margin-top: 20px;">
            <div>Các sản phẩm đã đặt</div>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center" scope="col">Id</th>
                            <th class="text-center" scope="col">Tên sản phẩm</th>
                            <th class="text-center" scope="col">Số lượng</th>
                            <th class="text-center" scope="col">Giá</th>
                            <th class="text-center" scope="col">Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="text-center" scope="row">1</th>
                            <td class="text-center">Son môi tung của</td>
                            <td class="text-center">2</td>
                            <td class="text-center">50,000đ</td>
                            <td class="text-center">100,000đ</td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">2</th>
                            <td class="text-center">Tẩy trang</td>
                            <td class="text-center">2</td>
                            <td class="text-center">50,000đ</td>
                            <td class="text-center">100,000đ</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div style="margin-top: 20px;" class="text-center">
            <button class="btn-lg btn-danger" style="width: 200px;" type="button" onclick="history.back()">Quay Lại</button>
        </div>
        </form>
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
