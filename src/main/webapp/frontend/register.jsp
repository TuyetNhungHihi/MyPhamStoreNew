<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!-- 
Template Name: big basket
Version: 1.0.0
Author: 
Website: 
Purchase: 
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
  <!--<![endif]-->

  <head>
    <meta charset="utf-8" />
    <title>Đăng kí</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="big basket" />
    <meta
      name="keywords"
      content="big basket, Ecommerce, Store, Mall, online Shopping"
    />
    <meta name="author" content="" />
    <meta name="MobileOptimized" content="320" />
    <!--srart theme style -->
    <link rel="stylesheet" type="text/css" href="../static/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/bootstrap.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="../static/css/font-awesome.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="../static/css/owl.carousel.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="../static/css/owl.theme.default.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="../static/css/magnific-popup.css"
    />
    <link rel="stylesheet" type="text/css" href="../static/css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/dl-menu.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/camera.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/style.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="../static/css/responsive.css"
    />
    <link rel="stylesheet" type="text/css" href="../static/css/sidebar.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/register.css" />
    <!-- favicon links -->
    <link
      rel="shortcut icon"
      type="image/png"
      href="../static/images/header/favicon.png"
    />
  </head>

  <body>
    <!-- preloader Start -->
    <div id="preloader">
      <div id="status">
        <img
          src="../static/images/header/preloader.gif"
          id="preloader_image"
          alt="loader"
        />
      </div>
    </div>
    <!-- Top Scroll Start -->
    <a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>
    <!-- Top Scroll End -->
    <!-- Header Wrapper Start -->
    <div id="nav"></div>
    <!-- Main Content -->
    <div class="form-bg">
      <div class="container">
        <div class="row">
          <div class="col-md-offset-3 col-md-6">
            <div class="form-container">
              <div class="col-md-4 text-center company__info">
                <img
                  src="../static/images/logo/logo3.svg"
                  alt="Logo"
                  title="big basket"
                  class="img-responsive"
                />
              </div>
              <h3 class="title">Đăng kí</h3>
              <form class="form-horizontal">
                <div class="form-group">
                  <label>Họ và tên</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Họ và tên"
                  />
                </div>
                <div class="form-group">
                  <label>Email của bạn</label>
                  <input
                    type="email"
                    class="form-control"
                    placeholder="Địa chỉ email"
                  />
                </div>
                <div class="form-group">
                  <label>Mật khẩu</label>
                  <input
                    id="password"
                    name="password"
                    type="password"
                    class="form-control"
                    placeholder="Mật khẩu"
                    pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                    title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm 1 chữ hoa, 1 chữ số và 1 ký tự đặc biệt (@$!%*?&)"
                    required
                  />
                </div>
                <div class="form-group">
                  <label>Nhập lại mật khẩu</label>
                  <input
                    type="password"
                    id="re-password"
                    name="re-password"
                    class="form-control"
                    placeholder="Nhập lại mật khẩu"
                    pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                    title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm 1 chữ hoa, 1 chữ số và 1 ký tự đặc biệt (@$!%*?&)"
                    required
                  />
                </div>
                <div
                  id="password-error-message"
                  class="alert alert-danger"
                  role="alert"
                  style="font-size: medium"
                  hidden
                >
                  mật khẩu không khớp!
                </div>
                <h4 class="sub-title">Thông tin cá nhân</h4>
                <div class="form-group">
                  <label>Số điện thoại</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Số điện thoại"
                  />
                </div>
                <div class="form-group">
                  <label>Ngày sinh</label>
                  <input type="date" class="form-control" />
                </div>
                <div class="form-group">
                  <label>Giới tính : </label>
                  <span style="margin-left: 20px">
                    <input type="radio" id="Nam" name="gender" value="Nam" />
                    <label for="Nam">Nam</label>
                  </span>

                  <span style="margin-left: 15px">
                    <input type="radio" id="Nu" name="gender" value="Nữ" />
                    <label for="Nu">Nữ</label>
                  </span>
                </div>
                <div class="check-terms">
                  <input type="checkbox" class="checkbox" />
                  <span class="check-label">Tôi đồng ý với các điều khoản</span>
                </div>
                <span class="signin-link"
                  >Đã có tài khoản? Nhấn vào đây để
                  <a href="login.jsp">Đăng nhập</a></span
                >
                <button class="btn signup">Tạo tài khoản</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Brandlogo Wrapper End -->

    <div id="footer"></div>
    <script>
      const header = document.getElementById("header");
      const footer = document.getElementById("footer");
      const nav = document.getElementById("nav");

      fetch("./footer.jsp")
        .then((response) => {
          return response.text();
        })
        .then((data) => {
          footer.innerHTML = data;
        });
      fetch("./nav.jsp")
        .then((response) => {
          return response.text();
        })
        .then((data) => {
          nav.innerHTML = data;
        });
    </script>
    <!--main js file start-->
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
