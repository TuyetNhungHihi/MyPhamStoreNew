<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Đổi mật khẩu</title>
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
    <link
      rel="stylesheet"
      type="text/css"
      href="../static/css/change-pass.css"
    />
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
    <!-- Header Wrapper End -->
    <!-- Main Content -->
    <div class="container-fluid">
      <div class="row main-content bg-success text-center" style="width: 30%">
        <div class="col-md-12 col-xs-12 col-sm-12 login_form">
          <div class="container-fluid">
            <div class="row">
              <h2>Đổi mật khẩu</h2>
            </div>
            <div class="row">
              <form control="" class="form-group">
                <div class="row">
                  <input
                    type="text"
                    name="password"
                    id="password"
                    class="form__input"
                    placeholder="Mật khẩu cũ"
                  />
                </div>
                <div class="row">
                  <!-- <span class="fa fa-lock"></span> -->
                  <input
                    type="password"
                    name="new-password"
                    id="new-password"
                    class="form__input"
                    placeholder="Mật khẩu mới"
                  />
                </div>
                <div class="row">
                  <!-- <span class="fa fa-lock"></span> -->
                  <input
                    type="password"
                    name="re-new-password"
                    id="re-new-password"
                    class="form__input"
                    placeholder="Nhập lại mật khẩu mới"
                  />
                </div>
                <div
                  id="error-message"
                  class="alert alert-danger"
                  hidden
                  role="alert"
                ></div>
                <div class="row">
                  <input type="submit" value="Đổi mật khẩu" class="btn" />
                </div>
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

      fetch("./footer.html")
        .then((response) => {
          return response.text();
        })
        .then((data) => {
          footer.innerHTML = data;
        });
      fetch("./nav.html")
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
