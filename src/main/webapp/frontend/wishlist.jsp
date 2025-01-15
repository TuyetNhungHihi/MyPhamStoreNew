<%@include file="/common/tablib.jsp"%>
<%--
Created by IntelliJ IDEA.
User: cucsh
Date: 12/7/2024
Time: 10:10 AM
To change this template use File | Settings | File Templates.
--%>
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
	<title>Danh Sách Yêu Thích</title>
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
	



	<!-- Service Wrapper Start -->


	<div class="ss_services_wrapper" style="padding-bottom: 0;">
		<div class="container custom-container">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="ss_inner_title_cont_wrapper">
            <ul>
              <li>
                <a href="#"><i class="fa fa-home"></i></a>&nbsp;&nbsp; >
              </li>
              <li>Sản phẩm&nbsp;&nbsp; ></li>
              <li>Sản phẩm yêu thích</li>
            </ul>
          </div>
        </div>
      </div>
					<div class="row">
						<div class="ss_latest_products product-three-service">
							<div class="owl-carousel owl-theme">
								<c:forEach var="product" items="${sessionScope.wishlist}">
									<div class="item">
										<div class="ss_featured_products_box">
											<div class="ss_featured_products_box_img">
												<span class="ss_tag">Mới</span>
												<img src="${product.thumbnail}" alt="${product.name}" class="img-responsive">
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
													<li>
														<button class="ss_btn">Thêm vào giỏ</button>
													</li>
													<li><a style="background-color: red; color: white;" href="#"><i  class="fa fa-heart" aria-hidden="true"></i></a>
													</li>
												</ul>
											</div>
											<div class="ss_featured_products_box_footer">
												<ul>
													<li><button class="ss_btn">Thêm vào giỏ</button></li>
													<li><a href="#" class="fa fa-heart" data-product-id="${product.id}" aria-hidden="true"></a></li>
												</ul>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
              <div style="width: 100%;" class="text-center">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                      <li >
                        <a class="previous-btn" href="#" aria-label="Previous" >
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li class="active"><a  href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li>
                        <a class="next-btn" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
            </div>
						</div>
					</div>
		
        </div>
    
	</div>
	<!-- Service Wrapper End -->
	
	
	
	<!-- Footer Wrapper Start -->
	<%@include file="component/footer.jsp"%>

	</div>
	<script>
			const header = document.getElementById("header");
		const footer = document.getElementById("footer");
		const nav = document.getElementById("nav");

		fetch('./header.html')
			.then(response => {
				return response.text()
			})
			.then(data => {
				header.innerHTML = data;
			});
		fetch('./footer.html')
			.then(response => {
				return response.text()
			})
			.then(data => {
				footer.innerHTML = data;
			});
		fetch('./nav.html')
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
	<script src="../static/js/jquery.inview.min.js"></script>
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
			
			
			// CountDown Js
			var deadline = 'December 31 2018 23:59:59 GMT+0530';
				function time_remaining(endtime){
					var t = Date.parse(endtime) - Date.parse(new Date());
					var seconds = Math.floor( (t/1000) % 60 );
					var minutes = Math.floor( (t/1000/60) % 60 );
					var hours = Math.floor( (t/(1000*60*60)) % 24 );
					var days = Math.floor( t/(1000*60*60*24) );
					return {'total':t, 'days':days, 'hours':hours, 'minutes':minutes, 'seconds':seconds};
				}
				function run_clock(id,endtime){
					var clock = document.getElementById(id);
					
					// get spans where our clock numbers are held
					var days_span = clock.querySelector('.days');
					var hours_span = clock.querySelector('.hours');
					var minutes_span = clock.querySelector('.minutes');
					var seconds_span = clock.querySelector('.seconds');
		
					function update_clock(){
						var t = time_remaining(endtime);
						
						// update the numbers in each part of the clock
						days_span.innerHTML = t.days;
						hours_span.innerHTML = ('0' + t.hours).slice(-2);
						minutes_span.innerHTML = ('0' + t.minutes).slice(-2);
						seconds_span.innerHTML = ('0' + t.seconds).slice(-2);
						
						if(t.total<=0){ clearInterval(timeinterval); }
					}
					update_clock();
					var timeinterval = setInterval(update_clock,1000);
				}
				run_clock('clockdiv',deadline);
	</script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			document.querySelectorAll('.fa-heart').forEach(function(heartIcon) {
				heartIcon.addEventListener('click', function(event) {
					event.preventDefault();
					const productId = this.dataset.productId;
					addToWishlist(productId, this);
				});
			});
		});

		function addToWishlist(productId, heartIcon) {
			fetch(`/add-to-wishlist?productId=${productId}`, {
				method: 'POST'
			})
					.then(response => response.json())
					.then(data => {
						if (data.success) {
							heartIcon.style.color = 'red';
							showToast('Product added to wishlist!');
						} else {
							showToast('Failed to add product to wishlist.');
						}
					})
					.catch(error => {
						console.error('Error:', error);
						showToast('An error occurred. Please try again.');
					});
		}

		function showToast(message) {
			const toast = document.createElement('div');
			toast.className = 'toast';
			toast.innerText = message;
			document.body.appendChild(toast);
			setTimeout(() => {
				toast.remove();
			}, 3000);
		}
	</script>
	<!--main js file end-->
</body>

</html>