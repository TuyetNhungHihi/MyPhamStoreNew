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
            <h1 class="text-center " style="margin-bottom: 20px;">Quản lý Nhãn hàng</h1>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-lg-6">
                    <form method="get" action="/admin/brands" class="input-group">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Tìm kiếm ...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">Tìm Kiếm</button>
                          </span>
                    </form><!-- /input-group -->
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
                    <th class="text-center">Tên nhãn hàng</th>
                    <th class="text-center">Logo</th>
                    <th class="text-center">Đang bán</th>
                    <th class="text-center">Hành Động</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="brand" items="${brands}">
                    <tr>
                        <td class="text-center">${brand.id}</td>
                        <td >${brand.name}</td>
                        <td class="text-center">${brand.logo}đ</td>
                        <td class="text-center"  >
                            <c:choose>
                                <c:when test="${brand.isAvailable}">
                                    <span class="active-product"></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="unactive-product"></span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-center">
                            <a href="<c:url value="/admin/brands?action=edit&id=${brand.id}"/>" class="btn btn-primary">Sửa</a>
                            <c:choose>
                                <c:when test="${brand.isAvailable}">
                                    <a href="<c:url value="/admin/brands?action=stopBuying&id=${brand.id}&currentPage=${currentPage}&pageSize=${pageSize}&keyword=${keyword}&orderBy=${orderBy}"/>" class="btn btn-warning">Ngưng Bán</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="/admin/brands?action=startBuying&id=${brand.id}&currentPage=${currentPage}&pageSize=${pageSize}&keyword=${keyword}&orderBy=${orderBy}"/>" class="btn btn-success">Bán</a>
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