<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/tablib.jsp"%>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="../../static/css/category-management.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <title>Quản lý danh mục</title>
  </head>

  <body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
      <%@include file="/admin/components/admin-sidebar.jsp"%>
    </div>
    <!-- end sidebar -->
    <!-- start header -->
    <div class="main-content" id="header" style="margin-left: 0">
      <%@include file="/admin/components/admin-header.jsp"%>
    </div>
    <!-- end header -->
    <div class="main-content">
      <main>
        <div class="main">
          <main class="main-content row my-table-custom">
            <!--style="display: flex; position: relative; height: min-content;"> -->
            <div class=" " style="width: 100%">
              <h1 class="text-center" style="margin-bottom: 20px">
                Quản lý Danh mục
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
                    ><strong>Hiển thị (1- 10)</strong> trên 100 danh mục</span
                  >
                  <a
                    href="./add-category.html"
                    class="btn btn-primary"
                    style="float: right"
                    >Thêm danh mục</a
                  >
                </div>
              </div>
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th class="text-center">id</th>
                    <th class="text-center">Tên danh mục</th>
                    <th class="text-center">Mô tả</th>
                    <th class="text-center">Hành Động</th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach items="${categories}" var="cate">

                  <tr>
                    <td class="text-center">${cate.id}</td>
                    <td class="text-center">${cate.name}</td>
                    <td class="text-center">${cate.description}</td>
                    <td class="text-center">
                      <button class="btn btn-primary">Sửa</button>
                      <button class="btn btn-danger">Xóa</button>
                    </td>
                  </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
            <%@include file="/common/paging.jsp"%>
          </main>
        </div>
      </main>
    </div>
    <label for="sidebar" class="body-label" id="body-label"></label>


    <script src="../../static/js/category-management.js"></script>
  </body>
</html>
