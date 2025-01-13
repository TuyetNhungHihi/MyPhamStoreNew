<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tablib.jsp"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Đăng nhập</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta name="description" content="big basket" />
  <meta name="keywords" content="big basket, Ecommerce, Store, Mall, online Shopping" />
  <meta name="author" content="" />
  <meta name="MobileOptimized" content="320" />

  <!-- Include CSS files dynamically using JSP -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/animate.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/font-awesome.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/owl.carousel.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/owl.theme.default.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/magnific-popup.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/fonts.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/dl-menu.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/reset.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/camera.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/responsive.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/sidebar.css" />
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/login.css" />

  <!-- favicon links -->
  <link rel="shortcut icon" type="image/png" href="<%= request.getContextPath() %>/static/images/header/favicon.png" />
</head>

<body>
<!-- preloader Start -->
<div id="preloader">
  <div id="status">
    <img src="<%= request.getContextPath() %>/static/images/header/preloader.gif" id="preloader_image" alt="loader" />
  </div>
</div>

<!-- Top Scroll Start -->
<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>

<!-- Main Content -->
<div class="container-fluid">
  <div class="row main-content bg-success text-center">
    <div class="col-md-4 text-center company__info">
      <img src="<%= request.getContextPath() %>/static/images/logo/logo3.svg" alt="Logo" title="big basket" class="img-responsive" />
    </div>
    <div class="col-md-8 col-xs-12 col-sm-12 login_form">
      <div class="container-fluid">
        <div class="row">
          <h1 style="color: #337ab7">Đăng nhập</h1>
        </div>
        <div class="row">
          <form id="form-login" class="form-group" action=<c:url value="/login"> method="post">
            <div class="row">
              <input type="text" name="email" id="email" class="form__input" placeholder="Email" required />
            </div>
            <div class="row">
              <input type="password" name="password" id="password" class="form__input" placeholder="Mật khẩu" required />
            </div>
            <div id="message" class="alert alert-danger" role="alert" hidden></div>
            <div class="row">
              <input type="checkbox" name="remember_me" id="remember_me" />
              <label for="remember_me">Lưu đăng nhập</label>
            </div>
            <div class="row">
              <input type="submit" value="Đăng nhập" class="btn" />
            </div>
            <div class="row">
              <p style="margin: 0">Hoặc</p>
              <button type="button" onclick="facebookLogin()" class="social-login-btn" style="color: blue">
                <i class="fa fa-facebook"></i> Đăng nhập bằng Facebook
              </button>
              <button type="button" onclick="googleLogin()" class="social-login-btn" style="color: red; margin-top: 0%">
                <i class="fa fa-google"></i> Đăng nhập bằng Google
              </button>
            </div>
          </form>
        </div>

        <div class="row">
          <p>
            Bạn quên mật khẩu?
            <a style="color: #337ab7" href="<%= request.getContextPath() %>/forgot-password.jsp">Quên mật khẩu</a>
          </p>
          <p>
            Bạn không có tài khoản?
            <a style="color: #337ab7" href="<%= request.getContextPath() %>/register.jsp">Đăng kí</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="footer"></div>
<script>
  const footer = document.getElementById("footer");
  fetch("<%= request.getContextPath() %>/footer.jsp")
          .then((response) => response.text())
          .then((data) => {
            footer.innerHTML = data;
          });
</script>

<!-- Include JS files dynamically using JSP -->
<script src="<%= request.getContextPath() %>/static/js/jquery_min.js"></script>
<script src="<%= request.getContextPath() %>/static/js/wow.js"></script>
<script src="<%= request.getContextPath() %>/static/js/bootstrap.js"></script>
<script src="<%= request.getContextPath() %>/static/js/owl.carousel.js"></script>
<script src="<%= request.getContextPath() %>/static/js/modernizr.js"></script>
<script src="<%= request.getContextPath() %>/static/js/jquery.magnific-popup.js"></script>
<script src="<%= request.getContextPath() %>/static/js/jquery.dlmenu.js"></script>
<script src="<%= request.getContextPath() %>/static/js/jquery.sticky.js"></script>
<script src="<%= request.getContextPath() %>/static/js/jquery.menu-aim.js"></script>
<script src="<%= request.getContextPath() %>/static/js/camera.min.js"></script>
<script src="<%= request.getContextPath() %>/static/js/jquery.easing.1.3.js"></script>
<script src="<%= request.getContextPath() %>/static/js/jquery.inview.min.js"></script>
<script src="<%= request.getContextPath() %>/static/js/custom.js"></script>

<!-- demo login feature -->
<script src="<%= request.getContextPath() %>/static/js/demo/login.js"></script>
</body>
</html>
