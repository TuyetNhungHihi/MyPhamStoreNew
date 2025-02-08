<%@ page import="vn.edu.hcmuaf.fit.myphamstore.model.UserModel" %>
<%@ page import="vn.edu.hcmuaf.fit.myphamstore.model.AddressModel" %>
<%@ page import="java.util.List" %>
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
              <% UserModel user = (UserModel) request.getAttribute("user");
                    List<AddressModel> addresss = (List<AddressModel>) request.getAttribute("addresss");
                  %>
            <hr class="mt-0 mb-4">
              <hr class="container">
                <div class="row d-flex">
                  <!-- Profile picture section -->
                  <div class="col-md-4">
                    <div class="card mb-4">
                      <div class="card-header">Ảnh đại diện</div>
                      <div class="card-body text-center">
                        <!-- Profile picture image-->
                        <img class="img-account-profile rounded-circle mb-2" src="<%=user.getAvatar()%>" alt="">
                        <!-- Profile picture help block-->
                        <div class="small font-italic text-muted mb-4"> 
                            Ngày thiết lập tài khoản: <%=user.getCreatedAt()%>
                        </div>
                        <!-- Profile picture upload button-->
                        <input type="file" class="form-control" id="uploadProfilePicture" accept="image/png, image/jpeg">
                        <div class="small font-italic text-muted mb-4">
                            Loại ảnh JPG hoặc PNG không lớn hơn 5 MB
                        </div>
<%--                        <button class="btn btn-primary" type="button" style="background-color: blue;">--%>
<%--                            <font color="white"> Đăng xuất </font>--%>
<%--                        </button>--%>
                          <form id="logout-form" action="<c:url value='/login?action=logout' />" method="post">
                              <button class="btn btn-primary" type="submit" style="background-color: blue;">
                                  <font color="white"> Đăng xuất </font>
                              </button>
                          </form>
                      </div>
                    </div>
                  </div>
                  <!-- Account details section -->
                  <div class="col-md-8">
                    <div class="card mb-4">
                      <div class="card-header">Chi tiết tài khoản</div>
                      <div class="card-body">
                          <form id="editProfileForm" action="<c:url value='/profile?action=edit' />" method="post">
                              <!-- Username and Name -->
                              <div class="mb-3">
                                  <label for="fullname">Họ và tên:</label>
                                  <input type="text" name="fullname" id="fullname" class="form-control" value="<%=user.getFullName()%>" readonly>
                              </div>

                              <!-- Gender -->
                              <div class="mb-3">
                                  <label>Giới tính:</label>
                                  <select name="gender" class="form-control" disabled>
                                      <option value="MALE" <%= "MALE".equalsIgnoreCase(String.valueOf(user.getGender())) ? "selected" : "" %>>Nam</option>
                                      <option value="FEMALE" <%= "FEMALE".equalsIgnoreCase(String.valueOf(user.getGender())) ? "selected" : "" %>>Nữ</option>
                                      <option value="OTHER" <%= "OTHER".equalsIgnoreCase(String.valueOf(user.getGender())) ? "selected" : "" %>>Khác</option>
                                  </select>
                              </div>

                              <div class="mb-3">
                                  <label for="inputLocation">Địa chỉ giao hàng:</label>
                                  <select name="address" id="inputLocation" class="form-control" disabled>
                                      <% if (addresss != null) { %>
                                      <% for (AddressModel addr : addresss) { %>
                                      <option value="<%= addr.getId() %>" <%= addr.getIsDefault() ? "selected" : "" %>>
                                          <%= addr.getNote() + ", " + addr.getWard() + ", " + addr.getDistrict() + ", " + addr.getCity() %>
                                      </option>
                                      <% } %>
                                      <% } %>
                                  </select>
                              </div>



                              <!-- Email -->
                              <div class="mb-3">
                                  <label for="inputEmailAddress">Địa chỉ Email:</label>
                                  <input type="email" name="email" class="form-control" id="inputEmailAddress" value="<%=user.getEmail()%>" readonly>
                              </div>

                              <!-- Phone Number and Birthday -->
                              <div class="row gx-3 mb-3">
                                  <div class="col-md-6">
                                      <label for="inputPhone">Số điện thoại:</label>
                                      <input type="tel" name="phone" class="form-control" id="inputPhone" value="<%=user.getPhone()%>" readonly>
                                  </div>
                                  <div class="col-md-6">
                                      <label for="ngaysinh">Ngày sinh:</label>
                                      <input type="date" name="dob" id="ngaysinh" class="form-control" value="<%=user.getDateOfBirth()%>" readonly>
                                  </div>
                              </div>
                              <%
                                  String successMessage = (String) session.getAttribute("successMessage");
                                  String errorMessage = (String) session.getAttribute("errorMessage");
                                  session.removeAttribute("successMessage");
                                  session.removeAttribute("errorMessage");
                              %>

                              <% if (successMessage != null) { %>
                              <div class="alert alert-success"><%= successMessage %></div>
                              <% } %>

                              <% if (errorMessage != null) { %>
                              <div class="alert alert-danger"><%= errorMessage %></div>
                              <% } %>

                              <!-- Buttons -->
                              <div class="d-flex justify-content-end mb-3">
                                  <button id="editButton" class="btn btn-primary me-2" type="button">Chỉnh sửa thông tin</button>
                                  <button id="saveButton" class="btn btn-success me-2" type="submit" style="display: none;">Lưu</button>
                                  <button id="cancelButton" class="btn btn-danger" type="button" style="display: none;">Hủy</button>
                                  <a href="<c:url value='/change-password' />" class="btn btn-primary">Đổi mật khẩu</a>

                              </div>
                          </form>
                          <!-- Button để mở modal -->
                          <button class="btn btn-primary" id="addAddressButton">Thêm địa chỉ mới</button>

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

      <!-- Modal thêm địa chỉ -->
      <div id="addAddressModal" class="modal">
          <div class="modal-content">
              <span class="close">&times;</span>
              <h2>Thêm địa chỉ mới</h2>
              <form id="addAddressForm">
                  <label for="note">Ghi chú (Số nhà, đường):</label>
                  <input type="text" id="note" name="note" required>

                  <label for="ward">Phường/Xã:</label>
                  <input type="text" id="ward" name="ward" required>

                  <label for="district">Quận/Huyện:</label>
                  <input type="text" id="district" name="district" required>

                  <label for="city">Thành phố/Tỉnh:</label>
                  <input type="text" id="city" name="city" required>

                  <label>
                      <input type="hidden" name="setDefault" value="false"> <!-- Giá trị mặc định -->
                      <input type="checkbox" id="setDefault" name="setDefault" value="true"> Đặt làm địa chỉ mặc định
                  </label>


                  <button type="submit" class="btn btn-success">Lưu địa chỉ</button>
              </form>
          </div>
      </div>

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
          document.getElementById('editButton').addEventListener('click', function () {
              let inputs = document.querySelectorAll('#editProfileForm input, #editProfileForm select');
              inputs.forEach(input => input.removeAttribute('readonly'));
              document.querySelector("select[name='gender']").disabled = false;
              document.querySelector("select[name='address']").disabled = false;

              // Hiển thị nút "Lưu" và "Hủy"
              document.getElementById('saveButton').style.display = "inline-block";
              document.getElementById('cancelButton').style.display = "inline-block";
              this.style.display = "none"; // Ẩn nút "Chỉnh sửa"
          });

          document.getElementById('cancelButton').addEventListener('click', function () {
              location.reload(); // Reload trang để hủy chỉnh sửa
          });
          // Mở modal khi bấm "Thêm địa chỉ mới"
          document.getElementById('addAddressButton').addEventListener('click', function() {
              document.getElementById('addAddressModal').style.display = 'block';
          });

          // Đóng modal khi bấm "x"
          document.querySelector('.close').addEventListener('click', function() {
              document.getElementById('addAddressModal').style.display = 'none';
          });

          // Gửi dữ liệu khi submit form
          document.getElementById('addAddressForm').addEventListener('submit', function(event) {
              event.preventDefault(); // Ngăn chặn reload trang

              let formData = new FormData(this);

              // Kiểm tra trạng thái của checkbox và cập nhật giá trị
              formData.set("setDefault", document.getElementById("setDefault").checked ? "true" : "false");

              fetch('/profile?action=addAddress', {
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/x-www-form-urlencoded' // Đảm bảo server nhận đúng kiểu dữ liệu
                  },
                  body: new URLSearchParams(formData).toString()
              })
                  .then(response => response.json())
                  .then(data => {
                      if (data.success) {
                          alert('Đã thêm địa chỉ thành công!');
                          location.reload(); // Tải lại trang để cập nhật danh sách địa chỉ
                      } else {
                          alert(`Lỗi: ${data.message}`);
                      }
                  })
                  .catch(error => {
                      console.error('Lỗi:', error);
                      alert('Có lỗi xảy ra, vui lòng thử lại!');
                  });
          });



      </script>


    </body>
</html>
