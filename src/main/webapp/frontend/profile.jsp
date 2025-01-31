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
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8" />
        <title>Thông tin cá nhân</title>
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
        <link rel="stylesheet" type="text/css" href="../static/css/profile.css" />
        <!-- favicon links -->
        <link rel="shortcut icon" type="image/png" href="../static/images/header/favicon.png" />
        <link
      rel="stylesheet"
      type="text/css"
      href="../static/css/responsive.css"
    />
    <link rel="stylesheet" type="text/css" href="../static/css/style2.css" />
    <!-- favicon links -->
    <link
      rel="shortcut icon"
      type="image/png"
      href="../static/images/header/favicon.png"
    />
    </head>
    <body>
      
      <div id="preloader">
        <div id="status">
            <img src="../static/images/header/preloader.gif" id="preloader_image" alt="loader">
        </div>
      </div>
      <!-- Top Scroll Start -->
      <a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>
      <!-- Top Scroll End -->
      <%@include file="component/nav.jsp"%>
      <%@include file="component/header.jsp"%>
      <!-- Header Wrapper Start -->
      <div class="ss_inner_title_wrapper">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
              <div class="ss_inner_title_cont_wrapper">
                <ul>
                  <li>
                    <a href="#"><i class="fa fa-home"></i></a>&nbsp;&nbsp; >
                  </li>
                  <li>Thông tin cá nhân</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content -->
      <div class="container" >
        <div style="height: 50px; background-color: white;z-index: 10;; width: 100vw;"></div>
          <div class="container px-4 mt-4">
            <h1>Thông tin cá nhân </h1>
            <hr class="mt-0 mb-4">
              <hr class="container">
                <div class="row d-flex">
                  <!-- Profile picture section -->
                  <div class="col-md-4">
                    <div class="card mb-4">
                      <div class="card-header">Ảnh đại diện</div>
                      <div class="card-body text-center">
                        <!-- Profile picture image-->
                        <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        <!-- Profile picture help block-->
                        <div class="small font-italic text-muted mb-4"> 
                            <font color="red">Ngày thiết lập tài khoản: 18/08/2021</font>
                        </div>
                        <!-- Profile picture upload button-->
                        <input type="file" class="form-control" id="uploadProfilePicture" accept="image/png, image/jpeg">
                        <div class="small font-italic text-muted mb-4">
                            Loại ảnh JPG hoặc PNG không lớn hơn 5 MB
                        </div>
                        <button class="btn btn-primary" type="button" style="background-color: blue;">
                            <font color="white"> Đăng xuất </font>
                        </button>
                      </div>
                    </div>
                  </div>
                  <!-- Account details section -->
                  <div class="col-md-8">
                    <div class="card mb-4">
                      <div class="card-header">Chi tiết tài khoản</div>
                      <div class="card-body">
                        <form>
                          <!-- Username and Name -->
                          <div class="mb-3">
                            <label for="username">Biệt danh:</label>
                            <input type="text" name="username" id="username" value="HihiHoho" readonly class="form-control">
                            <label for="lastname">Họ và tên:</label>
                            <input type="text" placeholder="Nhập họ tên của bạn vào đây" name="lastname" id="lastname" value="Nguyen Van A" readonly class="form-control">
                          </div>
                          <!-- Gender -->
                          <div class="mb-4">
                            <div class="form-group">
                              <label>Giới tính : </label>
                              <span style="margin-left: 20px">
                                <input type="radio" id="Nam" name="gender" value="Nam" disabled />
                                <label for="Nam">Nam</label>
                              </span>
                          
                              <span style="margin-left: 15px">
                                <input type="radio" id="Nu" name="gender" value="Nữ" disabled checked />
                                <label for="Nu">Nữ</label>
                              </span>
                            </div>
                          </div>
                          <!-- Address -->
                          <div class="mb-3">
                            <label class="small mb-1" for="inputLocation">Địa chỉ giao hàng</label>
                            <input class="form-control" id="inputLocation" type="text" placeholder="Nhập địa chỉ giao hàng của bạn vào đây" value="Trường đại học Nông Lâm, tp.HCM" readonly>
                          </div>
                          <!-- Email -->
                          <div class="mb-3">
                            <label class="small mb-1" for="inputEmailAddress">Địa chỉ Email</label>
                            <input type="email" class="form-control" id="inputEmailAddress" placeholder="Nhập địa chỉ email của bạn vào đây" value="22130xxx@st.hcmuaf.edu.vn" readonly required>
                          </div>
                          <!-- Phone Number and Birthday -->
                          <div class="row gx-3 mb-3">
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                <input type="tel" class="form-control" id="inputPhone" placeholder="Nhập số điện thoại của bạn vào đây" value="0123456789" readonly required>                                        </div>
                            <div class="col-md-6">
                                <label for="ngaysinh">Ngày sinh</label>
                                <input type="date" name="ngaysinh" id="ngaysinh" class="form-control" value="2000-11-20" readonly>
                            </div>
                          </div>        
                          <!-- Existing "Edit Info" and new "Change Password" button -->
                          <div class="d-flex justify-content-end mb-3">
                            <button id="editButton" class="btn btn-primary me-2" type="button">Chỉnh sửa thông tin</button>
                            <!-- Button to open modal -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                            Đổi mật khẩu
                             </button>
                          </div>
                        </form>   
                      </div>
                    </div>
                </div>
              </div>
            </hr>
          </div>
        </div>
      </div>
      <!-- end content -->
      <!-- Footer Wrapper End -->
      <%@include file="component/footer.jsp"%>

      <%--     <script>--%>
<%--        const header = document.getElementById("header");--%>
<%--        const footer = document.getElementById("footer");--%>
<%--        const nav = document.getElementById("nav");--%>
<%--  --%>
<%--        fetch("./header.html")--%>
<%--          .then((response) => {--%>
<%--            return response.text();--%>
<%--          })--%>
<%--          .then((data) => {--%>
<%--            header.innerHTML = data;--%>
<%--          });--%>
<%--        fetch("./footer.html")--%>
<%--          .then((response) => {--%>
<%--            return response.text();--%>
<%--          })--%>
<%--          .then((data) => {--%>
<%--            footer.innerHTML = data;--%>
<%--          });--%>
<%--        fetch("./nav.html")--%>
<%--          .then((response) => {--%>
<%--            return response.text();--%>
<%--          })--%>
<%--          .then((data) => {--%>
<%--            nav.innerHTML = data;--%>
<%--          })--%>
<%--          .then(() =>{--%>
<%--            ul = document.querySelector('ul')--%>
<%--            ul.style.height = 'max-content'--%>
<%--            --%>
<%--          })--%>
<%--          </script>--%>
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

<%--    <script>--%>
<%--      $(window).on("load", function () {--%>
<%--        var wow = new WOW({--%>
<%--          boxClass: "wow",--%>
<%--          animateClass: "animated",--%>
<%--          offset: 0,--%>
<%--          mobile: true,--%>
<%--          live: true,--%>
<%--        });--%>
<%--        wow.init();--%>
<%--      });--%>
<%--      // CountDown Js--%>
<%--			var deadline = 'December 31 2018 23:59:59 GMT+0530';--%>
<%--				function time_remaining(endtime){--%>
<%--					var t = Date.parse(endtime) - Date.parse(new Date());--%>
<%--					var seconds = Math.floor( (t/1000) % 60 );--%>
<%--					var minutes = Math.floor( (t/1000/60) % 60 );--%>
<%--					var hours = Math.floor( (t/(1000*60*60)) % 24 );--%>
<%--					var days = Math.floor( t/(1000*60*60*24) );--%>
<%--					return {'total':t, 'days':days, 'hours':hours, 'minutes':minutes, 'seconds':seconds};--%>
<%--				}--%>
<%--				function run_clock(id,endtime){--%>
<%--					var clock = document.getElementById(id);--%>
<%--					--%>
<%--					// get spans where our clock numbers are held--%>
<%--					var days_span = clock.querySelector('.days');--%>
<%--					var hours_span = clock.querySelector('.hours');--%>
<%--					var minutes_span = clock.querySelector('.minutes');--%>
<%--					var seconds_span = clock.querySelector('.seconds');--%>
<%--		--%>
<%--					function update_clock(){--%>
<%--						var t = time_remaining(endtime);--%>
<%--						--%>
<%--						// update the numbers in each part of the clock--%>
<%--						days_span.innerHTML = t.days;--%>
<%--						hours_span.innerHTML = ('0' + t.hours).slice(-2);--%>
<%--						minutes_span.innerHTML = ('0' + t.minutes).slice(-2);--%>
<%--						seconds_span.innerHTML = ('0' + t.seconds).slice(-2);--%>
<%--						--%>
<%--						if(t.total<=0){ clearInterval(timeinterval); }--%>
<%--					}--%>
<%--					update_clock();--%>
<%--					var timeinterval = setInterval(update_clock,1000);--%>
<%--				}--%>
<%--				run_clock('clockdiv',deadline);--%>
<%--      </script>--%>
<%--      <script>--%>
<%--        document.getElementById('editButton').addEventListener('click', function() {--%>
<%--          const usernameInput = document.getElementById('username');--%>
<%--    const lastnameInput = document.getElementById('lastname');--%>
<%--    const locationInput = document.getElementById('inputLocation');--%>
<%--    const emailInput = document.getElementById('inputEmailAddress');--%>
<%--    const phoneInput = document.getElementById('inputPhone');--%>
<%--    const birthdayInput = document.getElementById('ngaysinh');--%>
<%--    const genderInputs = document.getElementsByName('gender'); // Radio buttons for gender--%>

<%--    const isReadonly = usernameInput.readOnly;--%>

<%--    if (isReadonly) {--%>
<%--        // Enable editing--%>
<%--        editButton.textContent = "Lưu thông tin"; // Change button text to 'Save'--%>
<%--        usernameInput.readOnly = false;--%>
<%--        lastnameInput.readOnly = false;--%>
<%--        locationInput.readOnly = false;--%>
<%--        emailInput.readOnly = false;--%>
<%--        phoneInput.readOnly = false;--%>
<%--        birthdayInput.readOnly = false;--%>

<%--        // Enable gender radio buttons--%>
<%--        genderInputs.forEach((radio) => {--%>
<%--            radio.disabled = false;--%>
<%--        });--%>

<%--    } else {--%>
<%--        // Save changes--%>
<%--        usernameInput.readOnly = true;--%>
<%--        lastnameInput.readOnly = true;--%>
<%--        locationInput.readOnly = true;--%>
<%--        emailInput.readOnly = true;--%>
<%--        phoneInput.readOnly = true;--%>
<%--        birthdayInput.readOnly = true;--%>
<%--        editButton.textContent = "Chỉnh sửa thông tin"; // Change button text back to 'Edit'--%>

<%--        // Disable gender radio buttons--%>
<%--        genderInputs.forEach((radio) => {--%>
<%--            radio.disabled = true;--%>
<%--        });--%>

<%--        // You can add logic to save the updated values here--%>
<%--        console.log("Selected gender:", document.querySelector('input[name="gender"]:checked').value);--%>
<%--    }--%>
<%--});--%>

<%--      </script>--%>
<%--      --%>
    </body>
</html>
