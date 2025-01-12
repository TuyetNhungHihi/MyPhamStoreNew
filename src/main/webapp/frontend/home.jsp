<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: cucsh
Date: 12/7/2024
Time: 10:10 AM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<head>
	<meta charset="utf-8" />
	<title>Trang chủ</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta name="description" content="big basket" />
	<meta name="keywords" content="big basket, Ecommerce, Store, Mall, online Shopping" />
	<meta name="author" content="" />
	<meta name="MobileOptimized" content="320" />
	<!--srart theme style -->
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
	<!-- favicon links -->
	<link rel="shortcut icon" type="image/png" href="../static/images/header/favicon.png" />

</head>

<body>
	<!-- preloader Start -->
	<div id="preloader">
		<div id="status">
			<img src="../static/images/header/preloader.gif" id="preloader_image" alt="loader">
		</div>
	</div>
	<!-- Top Scroll Start -->
	<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>
	<!-- Top Scroll End -->
	<!-- Header Wrapper Start -->
	 <%@include file="component/nav.jsp"%>
	 <%@include file="component/header.jsp"%>
	<!-- Header Wrapper End -->
	


	<!-- Slider Wrapper End -->
	<div class="ss_top_slider_wrapper">
		<div id="theme-main-banner">
			<div data-src="../static/images/slider/slider1.jpg">
				<div class="camera_caption">
					<div class="container ss_slider_wrapper">
						<h3 class="wow fadeInUp animated" data-wow-delay="0.1s">Ưu đãi hấp dẫn</h3>
						<div class="clearfix"></div>
						<h2 class="wow fadeInUp animated" data-wow-delay="0.1s">Sản phẩm mới</h2>
						<div class="clearfix"></div>
						<h1 class="wow fadeInUp animated" data-wow-delay="0.1s">Sản phẩm 1</h1>
						<div class="clearfix"></div>
						<p class="wow fadeInUp animated" data-wow-delay="0.4s">mô tả</p>
						<div class="clearfix"></div>	<a href="#" class="wow fadeInUp animated" data-wow-delay="0.4s">Mua Ngay!</a>
					</div>
					<!-- /.container -->
				</div>
				<!-- /.camera_caption -->
			</div>
			<div data-src="../static/images/slider/slider2.jpg">
				<div class="camera_caption">
					<div class="container ss_slider_wrapper">
						<h3 class="wow fadeInUp animated" data-wow-delay="0.1s">Ưu đãi hấp dẫn</h3>
						<div class="clearfix"></div>
						<h2 class="wow fadeInUp animated" data-wow-delay="0.1s">Sản phẩm mới</h2>
						<div class="clearfix"></div>
						<h1 class="wow fadeInUp animated" data-wow-delay="0.1s">Sản phẩm 2</h1>
						<div class="clearfix"></div>
						<p class="wow fadeInUp animated" data-wow-delay="0.4s">mô tả</p>
						<div class="clearfix"></div>	<a href="#" class="wow fadeInUp animated" data-wow-delay="0.4s">Mua Ngay!</a>
					</div>
					<!-- /.container -->
				</div>
				<!-- /.camera_caption -->
			</div>
				<!-- /.camera_caption -->
			</div>
			</div>
		</div>
		<!-- /#theme-main-banner -->
	</div>
	<!-- Slider Wrapper End -->


	<!-- Service Wrapper Start -->


	<div class="ss_services_wrapper" style="padding-bottom: 0;">
		<div class="container custom-container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12">
					<div class="service-img">
						<img src="https://file.hstatic.net/1000006063/file/banner_thuong_hieu_noi_bat_pc_489_x_955_76d4bb5104914396b78f2db70ae4c231.png" alt="">
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-12">
					<div class="row">
						<div class="ss_latest_products product-three-service">
							<div class="owl-carousel owl-theme">
								<div class="item">
									<div class="ss_featured_products_box">
										<div class="ss_featured_products_box_img">	<span class="ss_tag">Mới</span>
											<span class="ss_offer">Giảm 20%</span>
											<img src="https://www.guardian.com.vn/media/catalog/product/cache/8abedaa231e51c424533dabd39634738/8/8/889d1d9cc2b2074823850bc9e51e91dda8bbafe1838bd8e7c12dd85bc261b503.jpeg" alt="Product" class="img-responsive">
<%--										</div>--%>
<%--										<div class="ss_feat_prod_cont_heading_wrapper">--%>
<%--											<h4><a href="product_detail.jsp">Bông Tẩy Trang Jomi 120</a></h4>--%>
<%--											<p>JOMI</p>	<del>28,000đ</del>  <ins>22,000đ</ins>--%>
<%--
</div>--%>
											<tbody>
											<c:forEach var="product" items="${products}">
												<tr>
													<td>${product.id}</td>
													<td>${product.name}</td>
													<td>${product.description}</td>
													<td>${product.price}</td>
												</tr>
											</c:forEach>
											</tbody>

										<div class="ss_featured_products_box_footer">
											<fieldset class="rating">
												<input type="radio" name="rating" value="5" />
												<label class="full" title="5 stars"></label>
												<input type="radio" name="rating" value="4 and a half" />
												<label class="half" title="4.5 stars"></label>
												<input type="radio" name="rating" value="4" />
												<label class="full" title="4 stars"></label>
												<input type="radio" name="rating" value="3 and a half" />
												<label class="half" title="3.5 stars"></label>
												<input type="radio" name="rating" value="3" />
												<label class="full" title="3 stars"></label>
												<input type="radio" name="rating" value="2 and a half" />
												<label class="half" title="2.5 stars"></label>
												<input type="radio" name="rating" value="2" />
												<label class="full" title="2 stars"></label>
												<input type="radio" name="rating" value="1 and a half" />
												<label class="half" title="1.5 stars"></label>
												<input type="radio" name="rating" value="1" />
												<label class="full" title="1 star"></label>
												<input type="radio" name="rating" value="half" />
												<label class="half" title="0.5 stars"></label>
											</fieldset>
											<ul>
												<li>
													<button class="ss_btn">Thêm vào giỏ</button>
												</li>
												<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
												</li>
											</ul>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="ss_services_box">	<span><i class="fa fa-truck" aria-hidden="true"></i></span>
								<h4>Free Shipping & Return</h4>
								<p>Proin gravida nibh vel velit auctor aliquet aenean sollicitu version of Lorem.</p>	<a href="#">read more <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="ss_services_box ss_services_box2">	<span><i class="fa fa-shield" aria-hidden="true"></i></span>
								<h4>100% Secure Payments</h4>
								<p>Proin gravida nibh vel velit auctor aliquet aenean sollicitu version of Lorem.</p>	<a href="#">read more <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="ss_services_box ss_services_box3">	<span><i class="fa fa-headphones" aria-hidden="true"></i></span>
								<h4>27/7 Support</h4>
								<p>Proin gravida nibh vel velit auctor aliquet aenean sollicitu version of Lorem.</p>	<a href="#">read more <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service Wrapper End -->
	<!-- Featured Products Wrapper Start -->
		<div class="ss_featured_products_wrapper" style="padding-top: 0;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="ss_featured_products_tab">
							<div class="ss_heading">
								<h3>Danh Mục Hot</h3>
							</div>
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#best" aria-controls="best" role="tab" data-toggle="tab">Tẩy Trang</a></li>
								<li role="presentation"><a href="#hot" aria-controls="hot" role="tab" data-toggle="tab">Chống Nắng</a></li>
								<li role="presentation"><a href="#trand" aria-controls="trand" role="tab" data-toggle="tab">Sữa Rửa Mặt</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="best">
								<div class="ss_featured_products">
									<div class="owl-carousel owl-theme">
										<c:forEach var="product" items="${tayTrangProducts}">
											<div class="item">
												<div class="ss_featured_products_box">
													<div class="ss_featured_products_box_img">
														<span class="ss_tag">mới</span>
														<span class="ss_offer">giảm 20%</span>
														<img src="${product.thumbnail}" alt="Product" class="img-responsive">
													</div>
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="product_detail.jsp">${product.name}</a></h4>
														<p>${product.description}</p>
														<del>${product.price}</del> <ins>${product.price}</ins>
													</div>
													<div class="ss_featured_products_box_footer">
														<fieldset class="rating">
															<input type="radio" name="rating" value="5" />
															<label class="full" title="5 stars"></label>
															<input type="radio" name="rating" value="4 and a half" />
															<label class="half" title="4.5 stars"></label>
															<input type="radio" name="rating" value="4" />
															<label class="full" title="4 stars"></label>
															<input type="radio" name="rating" value="3 and a half" />
															<label class="half" title="3.5 stars"></label>
															<input type="radio" name="rating" value="3" />
															<label class="full" title="3 stars"></label>
															<input type="radio" name="rating" value="2 and a half" />
															<label class="half" title="2.5 stars"></label>
															<input type="radio" name="rating" value="2" />
															<label class="full" title="2 stars"></label>
															<input type="radio" name="rating" value="1 and a half" />
															<label class="half" title="1.5 stars"></label>
															<input type="radio" name="rating" value="1" />
															<label class="full" title="1 star"></label>
															<input type="radio" name="rating" value="half" />
															<label class="half" title="0.5 stars"></label>
														</fieldset>
														<ul>
															<li><button class="ss_btn">Thêm vào giỏ hàng</button></li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
														</ul>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="hot">
								<div class="ss_featured_products">
									<div class="owl-carousel owl-theme">
										<c:forEach var="product" items="${chongNangProducts}">
										<div class="item">
											<div class="ss_featured_products_box">
												<div class="ss_featured_products_box_img">
													<span class="ss_tag">mới</span>
													<span class="ss_offer">giảm 20%</span>
													<img src="${product.thumbnail}" alt="Product" class="img-responsive">
												</div>
												<div class="ss_feat_prod_cont_heading_wrapper">
													<h4><a href="product_detail.jsp">${product.name}</a></h4>
													<p>${product.description}</p>
													<del>${product.price}</del> <ins>${product.price}</ins>
												</div>
												<div class="ss_featured_products_box_footer">
													<fieldset class="rating">
														<input type="radio" name="rating" value="5" />
														<label class="full" title="5 stars"></label>
														<input type="radio" name="rating" value="4 and a half" />
														<label class="half" title="4.5 stars"></label>
														<input type="radio" name="rating" value="4" />
														<label class="full" title="4 stars"></label>
														<input type="radio" name="rating" value="3 and a half" />
														<label class="half" title="3.5 stars"></label>
														<input type="radio" name="rating" value="3" />
														<label class="full" title="3 stars"></label>
														<input type="radio" name="rating" value="2 and a half" />
														<label class="half" title="2.5 stars"></label>
														<input type="radio" name="rating" value="2" />
														<label class="full" title="2 stars"></label>
														<input type="radio" name="rating" value="1 and a half" />
														<label class="half" title="1.5 stars"></label>
														<input type="radio" name="rating" value="1" />
														<label class="full" title="1 star"></label>
														<input type="radio" name="rating" value="half" />
														<label class="half" title="0.5 stars"></label>
													</fieldset>
													<ul>
														<li><button class="ss_btn">Thêm vào giỏ hàng</button></li>
														<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="trand">
								<div class="ss_featured_products">
									<div class="owl-carousel owl-theme">
										<c:forEach var="product" items="${suaRuaMatProducts}">
										<div class="item">
											<div class="ss_featured_products_box">
												<div class="ss_featured_products_box_img">
													<span class="ss_tag">mới</span>
													<span class="ss_offer">giảm 20%</span>
													<img src="${product.thumbnail}" alt="Product" class="img-responsive">
												</div>
												<div class="ss_feat_prod_cont_heading_wrapper">
													<h4><a href="product_detail.jsp">${product.name}</a></h4>
													<p>${product.description}</p>
													<del>${product.price}</del> <ins>${product.price}</ins>
												</div>
												<div class="ss_featured_products_box_footer">
													<fieldset class="rating">
														<input type="radio" name="rating" value="5" />
														<label class="full" title="5 stars"></label>
														<input type="radio" name="rating" value="4 and a half" />
														<label class="half" title="4.5 stars"></label>
														<input type="radio" name="rating" value="4" />
														<label class="full" title="4 stars"></label>
														<input type="radio" name="rating" value="3 and a half" />
														<label class="half" title="3.5 stars"></label>
														<input type="radio" name="rating" value="3" />
														<label class="full" title="3 stars"></label>
														<input type="radio" name="rating" value="2 and a half" />
														<label class="half" title="2.5 stars"></label>
														<input type="radio" name="rating" value="2" />
														<label class="full" title="2 stars"></label>
														<input type="radio" name="rating" value="1 and a half" />
														<label class="half" title="1.5 stars"></label>
														<input type="radio" name="rating" value="1" />
														<label class="full" title="1 star"></label>
														<input type="radio" name="rating" value="half" />
														<label class="half" title="0.5 stars"></label>
													</fieldset>
													<ul>
														<li><button class="ss_btn">Thêm vào giỏ hàng</button></li>
														<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="ss_latest_products_wrapper" style="padding-bottom: 0;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="ss_featured_products_tab">
							<div class="ss_heading">
								<h3>Sản Phẩm Mới Ra Mắt</h3>
							</div>
						</div>
						<div class="ss_latest_products">
							<div class="owl-carousel owl-theme">
								<c:forEach var="product" items="${latestTayTrangProducts}">
								<div class="item">
									<div class="ss_featured_products_box">
										<div class="ss_featured_products_box_img">
											<span class="ss_tag">mới</span>
											<span class="ss_offer">giảm 20%</span>
											<img src="${product.thumbnail}" alt="Product" class="img-responsive">
										</div>
										<div class="ss_feat_prod_cont_heading_wrapper">
											<h4><a href="product_detail.jsp">${product.name}</a></h4>
											<p>${product.description}</p>
											<del>${product.price}</del> <ins>${product.price}</ins>
										</div>
										<div class="ss_featured_products_box_footer">
											<fieldset class="rating">
												<input type="radio" name="rating" value="5" />
												<label class="full" title="5 stars"></label>
												<input type="radio" name="rating" value="4 and a half" />
												<label class="half" title="4.5 stars"></label>
												<input type="radio" name="rating" value="4" />
												<label class="full" title="4 stars"></label>
												<input type="radio" name="rating" value="3 and a half" />
												<label class="half" title="3.5 stars"></label>
												<input type="radio" name="rating" value="3" />
												<label class="full" title="3 stars"></label>
												<input type="radio" name="rating" value="2 and a half" />
												<label class="half" title="2.5 stars"></label>
												<input type="radio" name="rating" value="2" />
												<label class="full" title="2 stars"></label>
												<input type="radio" name="rating" value="1 and a half" />
												<label class="half" title="1.5 stars"></label>
												<input type="radio" name="rating" value="1" />
												<label class="full" title="1 star"></label>
												<input type="radio" name="rating" value="half" />
												<label class="half" title="0.5 stars"></label>
											</fieldset>
											<ul>
												<li><button class="ss_btn">Thêm vào giỏ hàng</button></li>
												<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								</c:forEach>
								<c:forEach var="product" items="${latestChongNangProducts}">
								<div class="item">
									<div class="ss_featured_products_box">
										<div class="ss_featured_products_box_img">
											<span class="ss_tag">mới</span>
											<span class="ss_offer">giảm 20%</span>
											<img src="${product.thumbnail}" alt="Product" class="img-responsive">
										</div>
										<div class="ss_feat_prod_cont_heading_wrapper">
											<h4><a href="product_detail.jsp">${product.name}</a></h4>
											<p>${product.description}</p>
											<del>${product.price}</del> <ins>${product.price}</ins>
										</div>
										<div class="ss_featured_products_box_footer">
											<fieldset class="rating">
												<input type="radio" name="rating" value="5" />
												<label class="full" title="5 stars"></label>
												<input type="radio" name="rating" value="4 and a half" />
												<label class="half" title="4.5 stars"></label>
												<input type="radio" name="rating" value="4" />
												<label class="full" title="4 stars"></label>
												<input type="radio" name="rating" value="3 and a half" />
												<label class="half" title="3.5 stars"></label>
												<input type="radio" name="rating" value="3" />
												<label class="full" title="3 stars"></label>
												<input type="radio" name="rating" value="2 and a half" />
												<label class="half" title="2.5 stars"></label>
												<input type="radio" name="rating" value="2" />
												<label class="full" title="2 stars"></label>
												<input type="radio" name="rating" value="1 and a half" />
												<label class="half" title="1.5 stars"></label>
												<input type="radio" name="rating" value="1" />
												<label class="full" title="1 star"></label>
												<input type="radio" name="rating" value="half" />
												<label class="half" title="0.5 stars"></label>
											</fieldset>
											<ul>
												<li><button class="ss_btn">Thêm vào giỏ hàng</button></li>
												<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								</c:forEach>
								<c:forEach var="product" items="${latestSuaRuaMatProducts}">
								<div class="item">
									<div class="ss_featured_products_box">
										<div class="ss_featured_products_box_img">
											<span class="ss_tag">mới</span>
											<span class="ss_offer">giảm 20%</span>
											<img src="${product.thumbnail}" alt="Product" class="img-responsive">
										</div>
										<div class="ss_feat_prod_cont_heading_wrapper">
											<h4><a href="product_detail.jsp">${product.name}</a></h4>
											<p>${product.description}</p>
											<del>${product.price}</del> <ins>${product.price}</ins>
										</div>
										<div class="ss_featured_products_box_footer">
											<fieldset class="rating">
												<input type="radio" name="rating" value="5" />
												<label class="full" title="5 stars"></label>
												<input type="radio" name="rating" value="4 and a half" />
												<label class="half" title="4.5 stars"></label>
												<input type="radio" name="rating" value="4" />
												<label class="full" title="4 stars"></label>
												<input type="radio" name="rating" value="3 and a half" />
												<label class="half" title="3.5 stars"></label>
												<input type="radio" name="rating" value="3" />
												<label class="full" title="3 stars"></label>
												<input type="radio" name="rating" value="2 and a half" />
												<label class="half" title="2.5 stars"></label>
												<input type="radio" name="rating" value="2" />
												<label class="full" title="2 stars"></label>
												<input type="radio" name="rating" value="1 and a half" />
												<label class="half" title="1.5 stars"></label>
												<input type="radio" name="rating" value="1" />
												<label class="full" title="1 star"></label>
												<input type="radio" name="rating" value="half" />
												<label class="half" title="0.5 stars"></label>
											</fieldset>
											<ul>
												<li><button class="ss_btn">Thêm vào giỏ hàng</button></li>
												<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- Latest Products Wrapper End -->
	
	
	
	<!-- Brandlogo Wrapper Start -->
	<div class="ss_brandlogo_wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="ss_heading_box">
						<div class="ss_heading">
							<h3>Các Thương Hiệu</h3>
						</div>
					</div>
					<div class="ss_brandlogo_slider">
						<div class="owl-carousel owl-theme">
							<div class="item">
								<div class="ss_brandlogo_slider_box">
									<div class="ss_brandlogo_slider_box_img">
										<img src="https://file.hstatic.net/1000006063/file/benton_eea819cc476c4eb7b136a316d44dabeb.jpg" alt="Brand" class="img-responsive">
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ss_brandlogo_slider_box">
									<div class="ss_brandlogo_slider_box_img">
										<img src="https://file.hstatic.net/1000006063/file/bbia_346ed87ff9444d6da17a705e753ba510.jpg" alt="Brand" class="img-responsive">
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ss_brandlogo_slider_box">
									<div class="ss_brandlogo_slider_box_img">
										<img src="https://file.hstatic.net/1000006063/file/beldora_44bdce66f4ad46caa8ab7c6abdcc5895.jpg" alt="Brand" class="img-responsive">
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ss_brandlogo_slider_box">
									<div class="ss_brandlogo_slider_box_img">
										<img src="https://file.hstatic.net/1000006063/file/anessa_6d29bec40be64192ae2b9bb7f009439a.jpg" alt="Brand" class="img-responsive">
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ss_brandlogo_slider_box">
									<div class="ss_brandlogo_slider_box_img">
										<img src="https://file.hstatic.net/1000006063/file/acnes_35f9c39029b74737aacba4151ef9d6e7.jpg" alt="Brand" class="img-responsive">
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ss_brandlogo_slider_box">
									<div class="ss_brandlogo_slider_box_img">
										<img src="https://file.hstatic.net/1000006063/file/9_whishes_2049ef43618f45ed9aac04423cc8a2a0.jpg" alt="Brand" class="img-responsive">
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ss_brandlogo_slider_box">
									<div class="ss_brandlogo_slider_box_img">
										<img src="https://file.hstatic.net/1000006063/file/a_bonne_9719107daa6748f89a88a7779a217aba.jpg" alt="Brand" class="img-responsive">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Brandlogo Wrapper End -->
	<%@include file="component/footer.jsp"%>
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
	<!--main js file end-->

	<!-- demo feature -->
	 <script src="../static/js/demo/login-label.js"></script>
</body>

</html>