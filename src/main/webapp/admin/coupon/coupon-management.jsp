<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Quản lý Nhãn hàng</title>
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
            <h1 class="text-center " style="margin-bottom: 20px;">Quản lý Mã Giảm Giá</h1>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Tìm Kiếm</button>
                          </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <span style="float: left; margin-top: 5px;"><strong>Hiển thị (1- 10)</strong> trên 100 nhãn hàng</span>
                    <a href="add-brand.jsp" class="btn btn-primary" style="float: right;">Thêm nhãn hàng</a>
                </div>
            </div>
            <table class="table table-striped ">
                <thead >
                <tr>
                    <th  class="text-center">id</th>
                    <th class="text-center">id nhãn hàng</th>
                    <th class="text-center">Mã Giảm Giá</th>
                    <th class="text-center">Giá trị đơn hàng tối thiểu</th>
                    <th class="text-center">Loại giảm giá</th>
                    <th class="text-center">Giá trị giảm giá</th>
                    <th class="text-center">Giá trị giảm giá tối đa</th>
                    <th class="text-center">Ngày bắt đầu</th>
                    <th class="text-center">Ngày kết thúc</th>
                    <th class="text-center">Số lần sử dụng</th>
                    <th class="text-center">Số lượng sử dụng tối đa</th>
                    <th class="text-center">Còn hiệu lực</th>
                    <th class="text-center">Hành Động</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="coupon" items="${coupons}">
                    <tr>
                        <td class="text-center">${coupon.id}</td>
                        <td class="text-center">${coupon.brand_id}</td>
                        <td class="text-center">${coupon.code}</td>
                        <td class="text-center">${coupon.min_order_value}đ</td>
                        <td class="text-center">${coupon.discount_type}</td>
                        <td class="text-center">${coupon.discount_value}đ</td>
                        <td class="text-center">${coupon.max_discount_value}đ</td>
                        <td class="text-center">${coupon.start_date}</td>
                        <td class="text-center">${coupon.end_date}</td>
                        <td class="text-center">${coupon.current_usage}</td>
                        <td class="text-center">${coupon.max_usage}</td>
                        <td class="text-center">
                            <c:choose>
                                <c:when test="${coupon.isAvailable}">
                                    <span class="badge badge-success">Còn hiệu lực</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-danger">Hết hiệu lực</span>
                                </c:otherwise>
                            </c:choose>
                        <td class="text-center">
                            <a href="<c:url value="/admin/coupon?action=edit&id=${coupon.id}"/>" class="btn btn-primary">Sửa</a>
                            <c:choose>
                                <c:when test="${coupon.isAvailable}">
                                    <a href="<c:url value="/admin/coupon?action=stopBuying&id=${coupon.id}&currentPage=${currentPage}&pageSize=${pageSize}&keyword=${keyword}&orderBy=${orderBy}"/>" class="btn btn-warning">Ngưng Hiệu Lực</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="/admin/coupon?action=startBuying&id=${coupon.id}&currentPage=${currentPage}&pageSize=${pageSize}&keyword=${keyword}&orderBy=${orderBy}"/>" class="btn btn-success">Có Hiệu Lực</a>
                                </c:otherwise>
                            </c:choose>
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