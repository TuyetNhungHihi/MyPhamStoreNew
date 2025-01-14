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
<head>
	<meta charset="UTF-8">
	<title>Thể loại</title>
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
	<link rel="stylesheet" type="text/css" href="../static/css/jquery-ui.min.css" />
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
	<!-- Header Wrapper Start -->
	<%@include file="component/nav.jsp"%>
	<%@include file="component/header.jsp"%>
	<!-- Header Wrapper End -->
	<!-- ss inner title Wrapper Start -->
	<div class="ss_inner_title_wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="ss_inner_title_cont_wrapper">
						<ul>
							<li><a href="#"><i class="fa fa-home"></i></a>&nbsp;&nbsp; ></li>
							<li>Sản Phẩm&nbsp;&nbsp; ></li>
							<li>Loại sản phẩm&nbsp;&nbsp; </li>
							<!-- <li>Lighting, Electronics</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ss inner title Wrapper End -->
	<!-- CC pc sidebar accordion Start -->
	<div class="cc_pc_accordion_main_wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
					<div class="cc_pc_first_accordion_wrapper cc_pc_second_accordion_wrapper2">
						<div class="cc_pc_accordion">
							<ul id="accordion1" class="accordion">
								<li class="default open">
									<div class="link cc_product_heading">Loại sản phẩm<i class="fa fa-chevron-down"></i></div>
									<ul class="submenu">
										<div class="wpb_wrapper">
											<div class="wpb_text_column wpb_content_element">
												<div class="wpb_wrapper">
													<ul>
														<c:forEach var="category" items="${categories}">
															<li>
																<input type="checkbox" id="c${category.id}" name="cb">
																<label for="c${category.id}">${category.name}</label>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="cc_pc_first_accordion_wrapper cc_pc_second_accordion_wrapper">
						<div class="cc_pc_accordion">
							<ul id="accordion3" class="accordion">
								<li class="default open">
									<div class="link cc_product_heading">Giá<i class="fa fa-chevron-down"></i>
									</div>
									<ul class="submenu price-range">
										<li class="range">
											<div id="range-price" class="range-box"></div> <span>tới:</span>
											<input type="text" id="price" class="price-box" readonly/>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="cc_pc_first_accordion_wrapper cc_pc_second_accordion_wrapper">
						<div class="cc_pc_accordion">
							<ul id="accordion4" class="accordion">
								<li class="default open">
									<div class="link cc_product_heading">Thương Hiệu<i class="fa fa-chevron-down"></i>
									</div>
									<ul class="submenu">
										<c:forEach var="brand" items="${brands}">
											<li>
												<input type="checkbox" id="c${brand.id}" name="cb">
												<label for="c${brand.id}">${brand.name}</label>
											</li>
										</c:forEach>

									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="ss_addver_sidebar ss_addver_sidebar_inner">
						<a href="#" class="btn btn-primary">
							Lọc sản phẩm
						</a>
					</div>
				</div>
				<div class="col-lg-9  col-md-9 col-sm-12 col-xs-12 sidebar2_main_wrapper">
					<div class="sidebar_widget2">
						<div class="filter-area">
							<div class="showpro">
								<p><span>Hiển thị 1-9</span> trên 256 sản phẩm</p>
							</div>
							<select>
								<option>Sắp xếp theo</option>
								<option>Thương Hiệu</option>
								<option>Loại Sản Phẩm</option>
								<option>Giá</option>
							</select>
							<div class="list-grid">
								<ul class="list-inline nav nav-pills">
									<li class="active"><a data-toggle="pill" href="#grid"><i class="fa fa-th-large"></i></a>
									</li>
									<li><a data-toggle="pill" href="#list"><i class="fa fa-list"></i></a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="tab-content">
								<div id="grid" class="tab-pane fade in active">
									<div class="row " style="column-gap: 20px;">
										<c:forEach var="product" items="${products}">
											<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 prs_upcom_slide_first">
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
														<a href="/chi-tiet-san-pham?id=${product.id}">Chi tiết sản phẩm</a>
														<fieldset class="rating">
															<input type="radio" name="rating${product.id}" value="5" />
															<label class="full" title="5 stars"></label>
															<input type="radio" name="rating${product.id}" value="4 and a half" />
															<label class="half" title="4.5 stars"></label>
															<input type="radio" name="rating${product.id}" value="4" />
															<label class="full" title="4 stars"></label>
															<input type="radio" name="rating${product.id}" value="3 and a half" />
															<label class="half" title="3.5 stars"></label>
															<input type="radio" name="rating${product.id}" value="3" />
															<label class="full" title="3 stars"></label>
															<input type="radio" name="rating${product.id}" value="2 and a half" />
															<label class="half" title="2.5 stars"></label>
															<input type="radio" name="rating${product.id}" value="2" />
															<label class="full" title="2 stars"></label>
															<input type="radio" name="rating${product.id}" value="1 and a half" />
															<label class="half" title="1.5 stars"></label>
															<input type="radio" name="rating${product.id}" value="1" />
															<label class="full" title="1 star"></label>
															<input type="radio" name="rating${product.id}" value="half" />
															<label class="half" title="0.5 stars"></label>
														</fieldset>
														<ul>
															<li><button class="ss_btn">Thêm vào giỏ</button></li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
														</ul>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div id="list" class="tab-pane fade">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="prs_mcc_list_movie_main_wrapper">
												<div class="ss_featured_products_box_img ss_featured_products_box_img_list">	<span class="ss_tag">new</span>
													<span class="ss_offer">20% off</span>
													<img src="images/content/lp1.jpg" alt="Product" class="img-responsive">
													<ul>
														<li>
															<ul>
																<li><i class="fa fa-circle corol_1" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_2" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_3" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_4" aria-hidden="true"></i>
																</li>
															</ul>
														</li>
														<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i> Quick View</a>
														</li>
													</ul>
												</div>
												<div class="ss_featured_products_box_img_list_cont">
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="#">Brand new phone 32GB, 2GB</a></h4>
														<p>Electronics</p>	<del>$250.00</del>  <ins>$199.00</ins>
													</div>
													<div class="ss_featured_products_box_footer ss_featured_products_box_footer_list">
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
															<li><a href="#"><i class="fa fa-random" aria-hidden="true"></i></a>
															</li>
															<li>
																<button class="ss_btn">Add To Bag</button>
															</li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="prs_mcc_list_movie_main_wrapper prs_mcc_list_movie_main_wrapper2">
												<div class="ss_featured_products_box_img ss_featured_products_box_img_list">	<span class="ss_tag">new</span>
													<span class="ss_offer">20% off</span>
													<img src="images/content/lp2.jpg" alt="Product" class="img-responsive">
													<ul>
														<li>
															<ul>
																<li><i class="fa fa-circle corol_1" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_2" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_3" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_4" aria-hidden="true"></i>
																</li>
															</ul>
														</li>
														<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i> Quick View</a>
														</li>
													</ul>
												</div>
												<div class="ss_featured_products_box_img_list_cont">
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="#">Brand new phone 32GB, 2GB</a></h4>
														<p>Electronics</p>	<del>$250.00</del>  <ins>$199.00</ins>
													</div>
													<div class="ss_featured_products_box_footer ss_featured_products_box_footer_list">
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
															<li><a href="#"><i class="fa fa-random" aria-hidden="true"></i></a>
															</li>
															<li>
																<button class="ss_btn">Add To Bag</button>
															</li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="prs_mcc_list_movie_main_wrapper prs_mcc_list_movie_main_wrapper2">
												<div class="ss_featured_products_box_img ss_featured_products_box_img_list">	<span class="ss_tag">new</span>
													<span class="ss_offer">20% off</span>
													<img src="images/content/lp3.jpg" alt="Product" class="img-responsive">
													<ul>
														<li>
															<ul>
																<li><i class="fa fa-circle corol_1" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_2" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_3" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_4" aria-hidden="true"></i>
																</li>
															</ul>
														</li>
														<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i> Quick View</a>
														</li>
													</ul>
												</div>
												<div class="ss_featured_products_box_img_list_cont">
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="#">Brand new phone 32GB, 2GB</a></h4>
														<p>Electronics</p>	<del>$250.00</del>  <ins>$199.00</ins>
													</div>
													<div class="ss_featured_products_box_footer ss_featured_products_box_footer_list">
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
															<li><a href="#"><i class="fa fa-random" aria-hidden="true"></i></a>
															</li>
															<li>
																<button class="ss_btn">Add To Bag</button>
															</li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="prs_mcc_list_movie_main_wrapper prs_mcc_list_movie_main_wrapper2">
												<div class="ss_featured_products_box_img ss_featured_products_box_img_list">	<span class="ss_tag">new</span>
													<span class="ss_offer">20% off</span>
													<img src="images/content/lp4.jpg" alt="Product" class="img-responsive">
													<ul>
														<li>
															<ul>
																<li><i class="fa fa-circle corol_1" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_2" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_3" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_4" aria-hidden="true"></i>
																</li>
															</ul>
														</li>
														<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i> Quick View</a>
														</li>
													</ul>
												</div>
												<div class="ss_featured_products_box_img_list_cont">
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="#">Brand new phone 32GB, 2GB</a></h4>
														<p>Electronics</p>	<del>$250.00</del>  <ins>$199.00</ins>
													</div>
													<div class="ss_featured_products_box_footer ss_featured_products_box_footer_list">
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
															<li><a href="#"><i class="fa fa-random" aria-hidden="true"></i></a>
															</li>
															<li>
																<button class="ss_btn">Add To Bag</button>
															</li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="prs_mcc_list_movie_main_wrapper prs_mcc_list_movie_main_wrapper2">
												<div class="ss_featured_products_box_img ss_featured_products_box_img_list">	<span class="ss_tag">new</span>
													<span class="ss_offer">20% off</span>
													<img src="images/content/lp5.jpg" alt="Product" class="img-responsive">
													<ul>
														<li>
															<ul>
																<li><i class="fa fa-circle corol_1" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_2" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_3" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_4" aria-hidden="true"></i>
																</li>
															</ul>
														</li>
														<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i> Quick View</a>
														</li>
													</ul>
												</div>
												<div class="ss_featured_products_box_img_list_cont">
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="#">Brand new phone 32GB, 2GB</a></h4>
														<p>Electronics</p>	<del>$250.00</del>  <ins>$199.00</ins>
													</div>
													<div class="ss_featured_products_box_footer ss_featured_products_box_footer_list">
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
															<li><a href="#"><i class="fa fa-random" aria-hidden="true"></i></a>
															</li>
															<li>
																<button class="ss_btn">Add To Bag</button>
															</li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="prs_mcc_list_movie_main_wrapper prs_mcc_list_movie_main_wrapper2">
												<div class="ss_featured_products_box_img ss_featured_products_box_img_list">	<span class="ss_tag">new</span>
													<span class="ss_offer">20% off</span>
													<img src="images/content/lp6.jpg" alt="Product" class="img-responsive">
													<ul>
														<li>
															<ul>
																<li><i class="fa fa-circle corol_1" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_2" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_3" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_4" aria-hidden="true"></i>
																</li>
															</ul>
														</li>
														<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i> Quick View</a>
														</li>
													</ul>
												</div>
												<div class="ss_featured_products_box_img_list_cont">
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="#">Brand new phone 32GB, 2GB</a></h4>
														<p>Electronics</p>	<del>$250.00</del>  <ins>$199.00</ins>
													</div>
													<div class="ss_featured_products_box_footer ss_featured_products_box_footer_list">
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
															<li><a href="#"><i class="fa fa-random" aria-hidden="true"></i></a>
															</li>
															<li>
																<button class="ss_btn">Add To Bag</button>
															</li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="prs_mcc_list_movie_main_wrapper prs_mcc_list_movie_main_wrapper2">
												<div class="ss_featured_products_box_img ss_featured_products_box_img_list">	<span class="ss_tag">new</span>
													<span class="ss_offer">20% off</span>
													<img src="images/content/lp8.jpg" alt="Product" class="img-responsive">
													<ul>
														<li>
															<ul>
																<li><i class="fa fa-circle corol_1" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_2" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_3" aria-hidden="true"></i>
																</li>
																<li><i class="fa fa-circle corol_4" aria-hidden="true"></i>
																</li>
															</ul>
														</li>
														<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i> Quick View</a>
														</li>
													</ul>
												</div>
												<div class="ss_featured_products_box_img_list_cont">
													<div class="ss_feat_prod_cont_heading_wrapper">
														<h4><a href="#">Brand new phone 32GB, 2GB</a></h4>
														<p>Electronics</p>	<del>$250.00</del>  <ins>$199.00</ins>
													</div>
													<div class="ss_featured_products_box_footer ss_featured_products_box_footer_list">
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
															<li><a href="#"><i class="fa fa-random" aria-hidden="true"></i></a>
															</li>
															<li>
																<button class="ss_btn">Add To Bag</button>
															</li>
															<li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 hidden-sm hidden-xs">
						<!-- blog_pagination_section start -->
						<div class="pager_wrapper gc_blog_pagination">
							<ul class="pagination">
								<li><a href="#">Previous</a>
								</li>
								<li><a href="#">1</a>
								</li>
								<li><a href="#">2</a>
								</li>
								<li><a href="#">3</a>
								</li>
								<li class="hidden-xs"><a href="#">4</a>
								</li>
								<li><a href="#">Next</a>
								</li>
							</ul>
						</div>
						<!-- blog_pagination_section end -->
					</div>
				</div>
				<div class="col-lg-3 col-md-3 visible-sm visible-xs">
					<div class="cc_pc_first_accordion_wrapper cc_pc_second_accordion_wrapper2">
						<div class="cc_pc_accordion">
							<ul id="accordion8" class="accordion">
								<li class="default open">
									<div class="link cc_product_heading">Loại sản phẩm<i class="fa fa-chevron-down"></i>
									</div>
									<ul class="submenu">
										<li>
											<div class="content">
												<div class="box">
													<p class="cc_pc_color1">
														<input type="checkbox" id="c201" name="cb">
														<label for="c201">Sữa rữa mặt (55)</label>
														<p class="cc_pc_color2">
															<input type="checkbox" id="c202" name="cb">
															<label for="c202">Kem dưỡng ẩm (245)</label>
														</p>
														<p class="cc_pc_color3">
															<input type="checkbox" id="c203" name="cb">
															<label for="c203">Tẩy trang</label>
														</p>
														<p class="cc_pc_color4">
															<input type="checkbox" id="c204" name="cb">
															<label for="c204">Son môi</label>
														</p>
														<p class="cc_pc_color5">
															<input type="checkbox" id="c205" name="cb">
															<label for="c205">Chống nắng (36)</label>
														</p>
														<p class="cc_pc_color6">
															<input type="checkbox" id="c206" name="cb">
															<label for="c206">Sữa tắm (23)</label>
														</p>
														<p class="cc_pc_color6">
															<input type="checkbox" id="c207" name="cb">
															<label for="c207">Xà phòng (124)</label>
														</p>
												</div>
											</div>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="cc_pc_first_accordion_wrapper cc_pc_second_accordion_wrapper">
						<div class="cc_pc_accordion">
							<ul id="accordion9" class="accordion">
								<li class="default open">
									<div class="link cc_product_heading">Giá<i class="fa fa-chevron-down"></i>
									</div>
									<ul class="submenu price-range">
										<li class="range">
											<div id="range-price2" class="range-box"></div> <span>tới</span>
											<input type="text" id="price2" class="price-box" readonly/>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="cc_pc_first_accordion_wrapper cc_pc_second_accordion_wrapper">
						<div class="cc_pc_accordion">
							<ul id="accordion10" class="accordion">
								<li class="default open">
									<div class="link cc_product_heading">Thương hiệu<i class="fa fa-chevron-down"></i>
									</div>
									<ul class="submenu">
										<li>
											<div class="content">
												<div class="box">
													<p>
														<input type="checkbox" id="c12" name="cb">
														<label for="c12">16PLAIN</label>
														<p>
															<input type="checkbox" id="c13" name="cb">
															<label for="c13">2080</label>
														</p>
														<p>
															<input type="checkbox" id="c14" name="cb">
															<label for="c14">3CE</label>
														</p>
														<p>
															<input type="checkbox" id="c15" name="cb">
															<label for="c15">9WHISHES</label>
														</p>
														<p>
															<input type="checkbox" id="c16" name="cb">
															<label for="c16">ACNES</label>
														</p>
														<p>
															<input type="checkbox" id="c17" name="cb">
															<label for="c17">ADOPT'</label>
														</p>
														<p>
															<input type="checkbox" id="c18" name="cb">
															<label for="c18">AHC</label>
														</p>
												</div>
											</div>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="ss_addver_sidebar ss_addver_sidebar_inner">
						<a href="#">
							<img src="images/content/add1.jpg" alt="Add">
						</a>
					</div>
					<div class="col-lg-12 col-md-12 visible-sm visible-xs">
						<!-- blog_pagination_section start -->
						<div class="pager_wrapper gc_blog_pagination">
							<ul class="pagination">
								<li><a href="#">Trước</a>
								</li>
								<li><a href="#">1</a>
								</li>
								<li><a href="#">2</a>
								</li>
								<li class="third_pagger"><a href="#">3</a>
								</li>
								<li class="hidden-xs"><a href="#">4</a>
								</li>
								<li><a href="#">Sau</a>
								</li>
							</ul>
						</div>
						<!-- blog_pagination_section end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CC pc sidebar accordion End -->
	<!-- Footer Wrapper Start -->

	<%@include file="component/footer.jsp"%>


	<!-- Footer Wrapper End -->
	<script>
		const header = document.getElementById("header");
		const footer = document.getElementById("footer");
		const nav = document.getElementById("nav");

		fetch('header.jsp')
			.then(response => {
				return response.text()
			})
			.then(data => {
				header.innerHTML = data;
			});
		fetch('footer.jsp')
			.then(response => {
				return response.text()
			})
			.then(data => {
				footer.innerHTML = data;
			});
		fetch('nav.jsp')
			.then(response => {
				return response.text()
			}).then(data => {
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
	<script src="../static/js/jquery-ui.min.js"></script>
	<script src="../static/js/custom.js"></script>
	<script>
		$(window).on("load", function() {
				var wow = new WOW({
					boxClass: 'wow',
					animateClass: 'animated',
					offset: 0,
					mobile: true,
					live: true
				});
				wow.init();
			});
			
					$(function() {
			var Accordion = function(el, multiple) {
				this.el = el || {};
				this.multiple = multiple || false;
		
				// Variables privadas
				var links = this.el.find('.link');
				// Evento
				links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
			}
		
			Accordion.prototype.dropdown = function(e) {
				var $el = e.data.el;
					$this = $(this),
					$next = $this.next();
		
				$next.slideToggle();
				$this.parent().toggleClass('open');
		
				if (!e.data.multiple) {
					$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
				};
			}	
		
			var accordion = new Accordion($('#accordion2, #accordion3, #accordion4, #accordion5, #accordion6, #accordion7, #accordion8, #accordion9, #accordion10, #accordion11, #accordion12, #accordion13'), false);
		});	
		
		$( "#range-price" ).slider({
				range: true,
				min: 50_000,
				max: 10_000_000,
				values: [ 50_000, 10_000_000 ],
				slide: function( event, ui ) {
			$( "#price" ).val( ui.values[ 0 ]+"đ" + " - "  + ui.values[ 1 ] + "đ");
			}
			});
		
			$( "#price" ).val(  $( "#range-price").slider( "values", 0 ) +"đ" +
			" - "  + $( "#range-price" ).slider( "values", 1 ) + "đ"); 
			
			$( "#range-price2" ).slider({
				range: true,
				min: 50_000,
				max: 10_000_000,
				values: [ 50_000, 10_000_000 ],
				slide: function( event, ui ) {
			$( "#price2" ).val( ui.values[ 0 ] +"đ"+ " - "  + ui.values[ 1 ] +" đ" );
			}
			});
		
			$( "#price2" ).val(  $( "#range-price2" ).slider( "values", 0 )+"đ" +
			" - "  + $( "#range-price2" ).slider( "values", 1 ) + "đ");
	</script>
	<!--main js file end-->
</body>

</html>