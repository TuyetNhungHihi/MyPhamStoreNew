<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" style="scroll-behavior: smooth;">
<head>
  <meta charset="utf-8" />
  <title>Chi tiết sản phẩm</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta name="description" content="big basket" />
  <meta name="keywords" content="big basket, Ecommerce, Store, Mall, online Shopping" />
  <meta name="author" content="" />
  <meta name="MobileOptimized" content="320" />
  <link rel="stylesheet" type="text/css" href="../static/css/animate.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/font-awesome.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/owl.carousel.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/owl.theme.default.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/magnific-popup.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/fonts.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/dl-menu.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/reset.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/camera.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/responsive.css" />
  <link rel="stylesheet" type="text/css" href="../static/css/sidebar.css" />
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <link rel="shortcut icon" type="image/png" href="../static/images/header/favicon.png" />
</head>

<body>
<div id="preloader">
  <div id="status">
    <img src="../static/images/header/preloader.gif" id="preloader_image" alt="loader" />
  </div>
</div>
<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>
<%@include file="component/nav.jsp"%>
<%@include file="component/header.jsp"%>

<div class="ss_inner_title_wrapper">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="ss_inner_title_cont_wrapper">
          <ul>
            <li>
              <a href="#"><i class="fa fa-home"></i></a>&nbsp;&nbsp; >
            </li>
            <li>Sản phẩm&nbsp;&nbsp; ></li>
            <li><c:out value="${product.categoryName}"/>&nbsp;&nbsp; ></li>
            <li><c:out value="${product.name}"/></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="cc_ps_top_product_main_wrapper">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="video_img_section_wrapper">
          <div class="cc_ps_top_slider_section">
            <div class="owl-carousel owl-theme">
              <div class="item" data-hash="zero">
                <img class="small img-responsive" src="<c:out value="${product.thumbnail}"/>" alt="Product Image">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="btc_shop_single_prod_right_section">
          <div class="btc_shop_sin_pro_icon_wrapper">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star-o"></i>
            <i class="fa fa-star-o"></i>
            <p>
              10 Đánh Giá <span><a href="#collapseFiveLeftfive">Đánh giá của bạn</a></span>
            </p>
            <div class="ss_featured_products_box_img_list_cont ss_featured_products_box_img_list_cont_single">
              <h4><a href="#"><c:out value="${product.name}"/></a></h4>
              <p class="shop_pera"><c:out value="${product.brandName}"/></p>
              <del><c:out value="${product.originalPrice}"/>đ</del> <ins><c:out value="${product.discountedPrice}"/>đ</ins>
              <h5>
                Giới Thiệu
                <c:out value="${product.description}"/>
              </h5>
            </div>
          </div>
          <div class="btc_shop_prod_quanty_bar">
            <div class="row">
              <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 full_width">
                <div class="cc_ps_quantily_info">
                    <div class="select_number">
                      <button onclick="changeQty(1); return false;" class="increase">
                        <i class="fa fa-plus"></i>
                      </button>
                      <input type="text" name="quantity" value="1" size="2" id="input-quantity" class="form-control" />
                      <button onclick="changeQty(0); return false;" class="decrease">
                        <i class="fa fa-minus"></i>
                      </button>
                    </div>
                    <input type="hidden" name="product_id" />
                </div>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="cc_ps_deliv_main_wrapper">
                    <div class="cc_ps_bottom_cont_heading_wrapper">
                      <p>Policys :</p>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@include file="component/footer.jsp"%>
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
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
  <script src="../static/js/demo/cart.js"></script>
</body>
</html>