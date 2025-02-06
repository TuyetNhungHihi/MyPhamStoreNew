<%@include file="/common/tablib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Danh Sách Yêu Thích</title>
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
	<link rel="shortcut icon" type="image/png" href="../static/images/header/favicon.png" />
</head>

<body>
<div id="preloader">
	<div id="status">
		<img src="../static/images/header/preloader.gif" id="preloader_image" alt="loader">
	</div>
</div>
<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>
<%@include file="component/nav.jsp"%>
<%@include file="component/header.jsp"%>

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
					<c:forEach var="product" items="${productsWishlist}">
						<div class="item">
							<div class="ss_featured_products_box">
								<div class="ss_featured_products_box_img">
									<span class="ss_tag">Mới</span>
									<span class="ss_offer">Giảm 20%</span>
									<img src="${product.thumbnail != null ? product.thumbnail : '/path/to/default/image.jpg'}" alt="Product" class="img-responsive">
								</div>
								<div class="ss_feat_prod_cont_heading_wrapper">
									<h4>
										<a class="limited-text" href="<c:url value='/chi-tiet-san-pham?id=${product.id}' />">${product.name}</a>
									</h4>
									<del>${product.price}</del>
									<ins>${product.price - (product.price * 0.2)}</ins>
								</div>
								<div class="ss_featured_products_box_footer">
									<ul style="display: flex; padding-top: 15px; justify-content: center;">
										<form method="post" action="/gio-hang">
											<input type="hidden" name="action" value="add">
											<input type="hidden" name="productId" value="${product.id}">
											<button type="submit" class="ss_btn">Thêm vào giỏ</button>
										</form>
										<li>
											<!-- Nút xóa khỏi wishlist -->
											<button class="remove-wishlist-btn" data-product-id="${product.id}">Remove</button>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- Phân trang -->
				<div class="col-lg-12 col-md-12 hidden-sm hidden-xs">
					<div class="pager_wrapper gc_blog_pagination">
						<ul class="pagination">
							<c:if test="${currentPage > 1}">
								<li><a href="?currentPage=${currentPage - 1}&pageSize=6">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="1" end="${totalPages}">
								<li class="${i == currentPage ? 'active' : ''}">
									<a href="?currentPage=${i}&pageSize=6">${i}</a>
								</li>
							</c:forEach>
							<c:if test="${currentPage < totalPages}">
								<li><a href="?currentPage=${currentPage + 1}&pageSize=6">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<%@include file="component/footer.jsp"%>

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

		var days_span = clock.querySelector('.days');
		var hours_span = clock.querySelector('.hours');
		var minutes_span = clock.querySelector('.minutes');
		var seconds_span = clock.querySelector('.seconds');

		function update_clock(){
			var t = time_remaining(endtime);

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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// Xử lý sự kiện khi nhấn nút thêm vào wishlist
		$('.add-to-wishlist').on('click', function(e) {
			e.preventDefault();
			var productId = $(this).data('product-id');
			$.ajax({
				url: '<c:url value="/wishlist" />',
				type: 'POST',
				data: { productId: productId },
				success: function(response) {
					if(response.success) {
						alert('Sản phẩm đã được thêm vào danh sách yêu thích!');

					}
				},
				error: function() {
					alert('Đã xảy ra lỗi khi thêm sản phẩm vào wishlist.');
				}
			});
		});

		$('.remove-wishlist-btn').on('click', function(e) {
			e.preventDefault();
			var productId = $(this).data('product-id');
			$.ajax({
				url: '<c:url value="/wishlist" />',
				type: 'DELETE',
				data: { productId: productId },
				success: function(response) {
					if(response.success) {
						alert('Sản phẩm đã được xóa khỏi danh sách yêu thích!');
						location.reload();
					}
				},
				error: function() {
					alert('Đã xảy ra lỗi khi xóa sản phẩm khỏi wishlist.');
				}
			});
		});
	});
</script>


<script>
	document.querySelectorAll('.remove-wishlist-btn').forEach(button => {
		button.addEventListener('click', function() {
			const productId = this.getAttribute('data-product-id');
			fetch('/wishlist?action=remove&productId=' + productId, {
				method: 'POST'
			})
					.then(response => response.json())
					.then(data => {
						if (data.success) {
							alert('Product removed from wishlist');
							location.reload();
						} else {
							alert('Failed to remove product from wishlist');
						}
					});
		});
	});
</script>
</body>
</html>