<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/tablib.jsp"%>
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
            <li><c:out value="${brand.name}"/>&nbsp;&nbsp; ></li>
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
                <c:forEach var="productImage" items="${productImages}">
                  <img class="small img-responsive" src="<c:out value="${productImage.url}"/>" alt="Product Image">
                </c:forEach>
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
<%--              <p class="shop_pera"><c:out value="${product.brandName}"/></p>--%>
              <del><c:out value="${product.price}"/>đ</del> <ins><c:out value="${product.costPrice}"/>đ</ins>
              <h5>
                Giới Thiệu:
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
</div>
<!-- CC ps top product Wrapper End -->
<!-- accordion section start -->
<div class="accordion_section">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <div class="panel-group" id="accordionFourLeft">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion_oneLeft" href="#description"
                   aria-expanded="false">
                  Mô Tả
                </a>
              </h4>
            </div>
            <div id="description" class="panel-collapse collapse in" aria-expanded="false" role="tablist">
              <div class="panel-body">
                <div class="img-accordion">
                  <img src="https://www.guardian.com.vn/media/catalog/product/cache/30b2b44eba57cd45fd3ef9287600968e/3/0/3023960_gqyugemvie8iz6za.png" width="230px" alt="" />
                </div>
                <div class="text-accordion">
                  <p>
                    Giới Thiệu
                    Kem Dưỡng Ẩm Skin1004 Làm Dịu Da Chiết Xuất Rau Má 75ml là kem dưỡng đến từ thương hiệu mỹ phẩm Skin1004 của
                    Hàn Quốc, thành phần chứa 72% chiết xuất rau má cùng với 4 loại Ceramide có nguồn gốc từ thực vật
                    làm dịu làn da mụn, kích ứng, giúp tăng cường hàng rào bảo vệ da, nuôi dưỡng làn da khỏe mạnh.
                  </p>
                  <!-- <ul class="accordian_list_item">
                    <li>
                      <i class="fa fa-long-arrow-right"></i> Lorem quis
                      bibendum auctor, nisi elit consequat ipsum.
                    </li>
                    <li>
                      <i class="fa fa-long-arrow-right"></i> Proin gravida
                      nibh vel velit auctor aliquet. Aenean sollicitudin.
                    </li>
                    <li>
                      <i class="fa fa-long-arrow-right"></i> Lorem quis
                      bibendum auctor, nisi elit consequat ipsum.
                    </li>
                  </ul> -->
                </div>
              </div>
              <!-- end of panel-body -->
            </div>
          </div>
          <!-- /.panel-default -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion_oneLeft"
                   href="#usage" aria-expanded="false">
                  Công Dụng
                </a>
              </h4>
            </div>
            <div id="usage" class="panel-collapse collapse" aria-expanded="false" role="tablist">
              <div class="panel-body">
                <div class="text-accordion">
                  <p>
                    Giới Thiệu
                    Công Dụng
                    CÔNG DỤNG CHÍNH - MAIN FUNCTION:

                    Sự kết hợp hoàn hảo của bộ đôi thành phần dịu nhẹ nhất – Rau má Centella Asiatica và Ceramide – mang năng lượng chữa lành và kháng khuẩn cực kì hiệu quả, nhẹ nhàng cấp ẩm sâu và nuôi dưỡng hàng rào bảo vệ da khỏe mạnh.
                    Kết cấu dạng gel mỏng nhẹ như nước cùng khả năng hạ nhiệt độ tức thì và thấm cực nhanh vào sâu từng lớp biểu bì da, vỗ về làn da đang đỏ rát, kích ứng hay tổn thương do mụn trở lại trạng thái ổn định và mềm mịn hơn.
                    Giúp kháng viêm cho mụn, giúp mờ thâm do mụn gây ra
                    Khả năng hạ nhiệt và làm dịu tức thì giúp làn da đang đỏ rát hay kích ứng trở lại trạng thái mềm mịn
                    Đặc biệt, độ lành tính đã được kiểm chứng phù hợp với làn da dầu mụn nhạy cảm nhất.
                    Loại da phù hợp:

                    Da dầu, Da nhạy cảm

                    Giải pháp tình trạng da:

                    Da tổn thương sau mụn, Da nhạy cảm - kích ứng
                  </p>
                  <!-- <ul class="accordian_list_item">
                    <li>
                      <i class="fa fa-long-arrow-right"></i> Proin gravida
                      nibh vel velit auctor aliquet. Aenean sollicitudin.
                    </li>
                    <li>
                      <i class="fa fa-long-arrow-right"></i> Lorem quis
                      bibendum auctor, nisi elit consequat ipsum.
                    </li>
                  </ul> -->
                </div>
              </div>
              <!-- end of panel-body -->
            </div>
          </div>
          <!-- /.panel-default -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion_oneLeft"
                   href="#ingredent" aria-expanded="false">
                  Thành Phần
                </a>
              </h4>
            </div>
            <div id="ingredent" class="panel-collapse collapse" aria-expanded="false" role="tablist">
              <div class="panel-body">
                <div class="text-accordion">
                  <p>Giới Thiệu
                    Công Dụng
                    Thành Phần
                    Thành phần chính:

                    - Madecassoside: mang lại hiệu quả kháng khuẩn, kháng viêm cho mụn, giúp mờ thâm do mụn gây ra, làm dịu da và tái tạo da.

                    - Asiaticoside: cải thiện sự cân bằng lượng dầu – nước, tổng hợp collagen ở tầng biểu bì giúp da căng mịn, mềm da và cấp ẩm cho da luôn mềm mại.

                    - Asiatic Axit: giúp củng cố sức mạnh cho làn da, tăng cường khả năng tự bảo vệ của da, làm dịu làn da mẫn cảm, chống oxy hóa, cải thiện độ đàn hồi của da.

                    - Madecassic Axid: làm dịu làn da mệt mỏi, cải thiện những vết tích trên da, làm lành làn da bị tổn thương, phục hồi, cân bằng độ ẩm và tái sinh tế bào da non.

                    Thành phần đầy đủ:

                    Centella Asiatica Extract (72%), Mentha Piperita (Peppermint) Leaf Extract, Ginger Eextract, Ceramide (NP), Coptis Chinensis Root Extract, Cacao Eextract, Sodium Hyaluronic, Beta - glucan, Ceramide (EOP), Ceramide (NS), Ceramide (AP)
                  </p>
                </div>
              </div>
              <!-- end of panel-body -->
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion_oneLeft"
                   href="#introduction" aria-expanded="false">
                  Hướng Dẫn Sử Dụng
                </a>
              </h4>
            </div>
            <div id="introduction" class="panel-collapse collapse" aria-expanded="false" role="tablist">
              <div class="panel-body">
                <div class="text-accordion">
                  <p>Sử dụng ở bước cuối cùng trong chu trình chăm sóc da, lấy một lượng vừa đủ thoa đều lên da và vỗ nhẹ để dưỡng chất được hấp thụ tối đa.

                    Dùng đều đặn mỗi ngày để đạt hiệu quả tối ưu.</p>
                </div>
              </div>
              <!-- end of panel-body -->
            </div>
          </div>
          <!-- /.panel-default -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion_oneLeft" href="#review"
                   aria-expanded="false">
                  Đánh giá (03)
                </a>
              </h4>
            </div>
            <div id="review" class="panel-collapse collapse in" aria-expanded="false" role="tablist">
              <div class="panel-body">
                <div class="col-lg-6 col-md-6 col-sm-12">
                  <div class="btc_shop_single_prod_right_section shop_product_single_head">
                    <h1>Thêm đánh giá của bạn</h1>
                    <div class="btc_shop_sin_pro_icon_wrapper">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                  </div>
                  <div class="text-accordion shop_pdt_form">
                    <div class="row">
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="contect2_form1">
                          <input type="text" placeholder=" Your Name" /><i class="fa fa-user"></i>
                        </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="contect2_form1">
                          <input type="email" placeholder="Your Email" /><i class="fa fa-envelope"></i>
                        </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="contect2_form4">
                          <textarea rows="4" placeholder=" Your comment"></textarea><i
                                class="fa fa-question-circle"></i>
                        </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="pdt_single_page_btn">
                          <div class="shop_btn_wrapper">
                            <ul>
                              <li><a href="#">Đánh Giá</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                  <div
                          class="btc_shop_single_prod_right_section shop_product_single_head shop_product_single_head_respon">
                    <h1>Đánh giá sản phẩm</h1>
                    <h4><c:out value="${total}* "/><span>đánh giá tổng</span></h4>
                  </div>
                  <div class="text-accordion shop_pdt_form">
                    <div class="progress_section">
                      <div class="progress-wrapper">
                        <div class="progress-item">
                          <span class="progress-title">5 sao</span>
                          <span class="progress-percent pull-right">
                              50%</span>
                          <div class="progress">
                            <div class="progress-bar progress-bar-dealy" role="progressbar" aria-valuenow="50"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                          <!-- /.progress -->
                        </div>
                        <!-- /.progress-item -->
                        <div class="progress-item">
                          <span class="progress-title">4 sao</span>
                          <span class="progress-percent pull-right">
                              92%</span>
                          <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-dealy" role="progressbar"
                                 aria-valuenow="92" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                          <!-- /.progress -->
                        </div>
                        <!-- /.progress-item -->
                        <div class="progress-item">
                          <span class="progress-title">3 sao </span>
                          <span class="progress-percent pull-right">
                              55%</span>
                          <div class="progress">
                            <div class="progress-bar progress-bar-danger progress-bar-dealy" role="progressbar"
                                 aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                          <!-- /.progress -->
                        </div>
                        <!-- /.progress-item -->
                        <div class="progress-item">
                          <span class="progress-title">2 sao</span>
                          <span class="progress-percent pull-right">
                              45%</span>
                          <div class="progress">
                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="45"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                          <!-- /.progress -->
                        </div>
                        <!-- /.progress-item -->
                        <div class="progress-item">
                          <span class="progress-title">1 sao</span>
                          <span class="progress-percent pull-right">
                              25%</span>
                          <div class="progress">
                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="25"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                          <!-- /.progress -->
                        </div>
                      </div>
                      <!-- /.progress-wrapper -->
                    </div>
                  </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="comment_box_blog">
                    <div class="sp_comment1_wrapper cmnt_wraper_2">
                      <div class="sp_comment1_img text-center">
                        <i class="fa fa-user"  style="font-size: 70px;" aria-hidden="true"></i>
                      </div>
                      <div class="sp_comment1_cont">
                        <c:forEach var="review" items="${reviews}">
                          <h3><c:out value="${review.userId}"/></h3>
                          <p>
                            <span><c:out value="${review.createdAt}"/></span>
                          </p>
                          <p>
                            <c:out value="${review.comment}"/>
                          </p>
                        </c:forEach>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- end of panel-body -->
            </div>
          </div>
          <!--end of /.panel-group-->
        </div>
      </div>
    </div>
  </div>
</div>
<!-- accordion section end -->

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