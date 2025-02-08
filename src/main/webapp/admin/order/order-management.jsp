

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/6/2025
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--import DateTimeFormatter--%>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
                    <form method="get" action="/admin/orders" class="input-group">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Tìm kiếm ...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">Tìm Kiếm</button>
                          </span>
                    </form><!-- /input-group -->
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
                    <th class="text-center">Thanh toán</th>
                    <th class="text-center">Ngày đặt hàng</th>
                    <th class="text-center">Trạng thái</th>
                    <th class="text-center">Hành Động</th>

                </tr>
                </thead>
                <tbody>
                <!-- Duyệt qua danh sách các đơn hàng -->
                <c:forEach var="entry" items="${orderUserMap}">
                    <c:set var="order" value="${entry.key}"/>
                    <c:set var="user" value="${entry.value}"/>
                    <tr>
                        <td class="text-center">${order.id}</td>
                        <td class="text-center">${user.id}</td>
                        <td class="text-center">${user.fullName}</td>
                        <td class="text-center">${user.phone}</td>
                        <td class="text-center">${order.paymentMethod}</td>
                        <td class="text-center">${order.orderDate.format(DateTimeFormatter.ofPattern("HH:mm:ss dd/MM/yyyy"))}</td>

                        <c:if test="${order.status == 'PENDING'}">
                            <td class="text-center">Chờ xác nhận</td>
                        </c:if>
                        <c:if test="${order.status == 'SHIPPING'}">
                            <td class="text-center">Đang giao</td>
                        </c:if>
                        <c:if test="${order.status == 'DELIVERED'}">
                            <td class="text-center">Đã giao</td>
                        </c:if>
                        <c:if test="${order.status == 'CANCELLED'}">
                            <td class="text-center">Đã hủy</td>
                        </c:if>
                        <td class="text-center">
                            <a href="/admin/orders?action=displayDetail&id=${order.id}" class="btn btn-success">Chi tiết</a>
                            <c:if test="${order.status == 'PENDING'}">
                                <button class="btn btn-primary">Xác nhận</button>
                                <button class="btn btn-danger">Huỷ đơn</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <%@include file="/common/paging.jsp"%>
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
