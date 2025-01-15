<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/tablib.jsp"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm nhãn hàng</title>
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
          <h1 class="text-center " style="margin-bottom: 20px;">
            <c:choose>
              <c:when test="${empty coupon}">Thêm mới Mã giảm giá</c:when>
              <c:otherwise>Sửa Mã giảm giá #${coupon.id}</c:otherwise>
            </c:choose>
          </h1>
          <form class="" action="#" method="post" style="padding: 0 100px 0 100px;">
            <div class="row">
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group">
                  <label for="soldQuantity" class="input-group-addon" id="basic-addon1">Code</label>
                  <input type="text" name="soldQuantity" id="soldQuantity" class="form-control" placeholder="Code..."
                         aria-describedby="basic-addon1" value="${coupon.code}">
                </div>
              </div>
            </div>
            <div class="row " >
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group">
                  <label class="input-group-addon" id="basic-addon1" for="costPrice" >Giá trị đơn hàng thấp nhất</label>
                  <input type="text" id="costPrice" name="costPrice" class="form-control" placeholder="Giá trị đơn hàng thấp nhất..."
                         aria-describedby="basic-addon1" value="${coupon.minOrderValue}">
                </div>
              </div>
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group" >
                  <label for="price" class="input-group-addon" id="basic-addon1">Loại giảm giá</label>
                  <input type="text" id="price" name="price" class="form-control" placeholder="Loại giảm giá..."
                         aria-describedby="basic-addon1" value="${coupon.discountType}">
                </div>
              </div>
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group" >
                  <label for="price" class="input-group-addon" id="basic-addon1">Giá trị giảm giá</label>
                  <input type="text" id="price" name="price" class="form-control" placeholder="Giá trị giảm giá..."
                         aria-describedby="basic-addon1" value="${coupon.discountValue}">
                </div>
              </div>
            </div>
            <div class="row " >
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group">
                  <label class="input-group-addon" id="basic-addon1" for="costPrice" >Giá trị giảm giá tối đa</label>
                  <input type="text" id="costPrice" name="costPrice" class="form-control" placeholder="Giá trị giảm giá tối đa..."
                         aria-describedby="basic-addon1" value="${coupon.maxDiscountValue}">
                </div>
              </div>
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group" >
                  <label for="price" class="input-group-addon" id="basic-addon1">Ngày bắt đầu</label>
                  <input type="text" id="price" name="price" class="form-control" placeholder="Ngày bắt đầu..."
                         aria-describedby="basic-addon1" value="${coupon.startDate}">
                </div>
              </div>
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group" >
                  <label for="price" class="input-group-addon" id="basic-addon1">Ngày kết thúc</label>
                  <input type="text" id="price" name="price" class="form-control" placeholder="Ngày kết thúc..."
                         aria-describedby="basic-addon1" value="${coupon.endDate}">
                </div>
              </div>
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group" >
                  <label for="price" class="input-group-addon" id="basic-addon1">Số lượng sử dụng</label>
                  <input type="text" id="price" name="price" class="form-control" placeholder="Số lượng sử dụng..."
                         aria-describedby="basic-addon1" value="${coupon.currentUsage}">
                </div>
              </div>
                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                    <div class="input-group" >
                    <label for="price" class="input-group-addon" id="basic-addon1">Số lượng sử dụng tối đa</label>
                    <input type="text" id="price" name="price" class="form-control" placeholder="Số lượng sử dụng tối đa..."
                             aria-describedby="basic-addon1" value="${coupon.maxUsage}">
                    </div>
                </div>
              <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group" >
                  <label for="price" class="input-group-addon" id="basic-addon1">Hiệu lực</label>
                  <input type="text" id="price" name="price" class="form-control" placeholder="true or false..."
                         aria-describedby="basic-addon1" value="${coupon.isAvailable}">
                </div>
            <div style="margin-top: 20px;" class="text-center">
              <button class="btn-lg btn-danger" style="width: 200px;" type="button" onclick="history.back()">Huỷ bỏ</button>
              <button class="btn-lg btn-primary" style="width: 200px;" type="submit">
                <c:choose>
                  <c:when test="${empty coupon}">Thêm sản phẩm</c:when>
                  <c:otherwise>Lưu chỉnh sửa</c:otherwise>
                </c:choose>
              </button>
            </div>
          </form>
        </div>

      </main>
      <label for="sidebar" class="body-label" id="body-label"></label>
    </div>
    <script>
      document
        .getElementById("imageInput")
        .addEventListener("change", function (event) {
          const file = event.target.files[0]; // Lấy tệp được chọn
          if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
              document.getElementById("output").hidden = false;
              document
                .getElementById("output")
                .setAttribute("src", e.target.result);
            };
            reader.readAsDataURL(file); // Chuyển đổi tệp thành Base64
          } else {
            alert("No file selected!");
          }
        });
    </script>
    <script src="../../static/js/bootstrap.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    <script src="../../static/js/admin.js"></script>
    <script src="../../static/js/category-management.js"></script>
  </body>
</html>
