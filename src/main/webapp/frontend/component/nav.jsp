<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!-- Header Wrapper Start -->
<div class="ss_middle_header_wrapper">
    <div class="ss_logo">
        <a href="<c:url value="/trang-chu" />">
            <img src="../static/images/logo/logo.svg" alt="Logo" title="big basket" class="img-responsive">
        </a>
    </div>
    <div class="ss_info_area" style="height: fit-content;">
        <ul>
            <li>
                <div class="ss_search_box hidden-xl hidden-lg hidden-md visible-sm ">
                    <select>
                        <option value="c1">Thể loại</option>
                        <option value="c2">Category 1</option>
                        <option value="c3">Category 2</option>
                        <option value="c4">Category 3</option>
                    </select> <span>
                        <input type="text" placeholder="Search for products">
                        <button><i class="fa fa-search" aria-hidden="true"></i></button>
                    </span>
                </div>
                <nav class="navbar navbar-default visible-lg visible-xl visible-md hidden-sm hidden">
                    <div id="dl-menu" class="xv-menuwrapper responsive-menu menu-three">
                        <div class="clearfix"></div>
                        <ul class="dl-menu">
                            <li class="parent"><a href="/trang-chu">Trang Chủ </a>
                            </li>
                            <li class="parent">
                                <a href="<c:url value="/danh-muc" />">
                                    Tất cả sản phẩm
                                </a>
                            </li>
                            <li class="parent">
                            <a href="<c:url value="/thuong-hieu" />">
                                Thương hiệu
                            </a>
                            </li>
                            <li class="parent">
                                <a href="<c:url value="/lien-he" />">
                                    Liên hệ
                                </a>
                            </li>
                            <li class="parent visible-xs"><a href="/gio-hang">Cart &nbsp;<i
                                        class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="lg-submenu">
                                    <li>
                                        <div class="ss_cart_inner_main_section">
                                            <div class="ss_cart_img_wrapper">
                                                <img src="../static/images/header/cart_img.jpg" alt="cart_img">
                                            </div>
                                            <div class="ss_cart_img_cont_wrapper">
                                                <h3><a href="#">Product item</a></h3>
                                                <h4>Product category</h4>
                                                <span>x</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ss_cart_inner_main_section">
                                            <div class="ss_cart_img_wrapper">
                                                <img src="images/header/cart_img.jpg" alt="cart_img">
                                            </div>
                                            <div class="ss_cart_img_cont_wrapper">
                                                <h3><a href="#">Product item</a></h3>
                                                <h4>Product category</h4>
                                                <span>x</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /dl-menuwrapper -->
                </nav>
            </li>
            <li>
                <div class="ss_notification_box">
                    <ul>
                        <li><a href="/src/main/webapp/frontend/wishlist.html"><i class="fa fa-heart"
                                    aria-hidden="true"></i><span>0</span></a>
                        </li>
                        <li><a href="#"><i class="fa fa-bell" aria-hidden="true"></i><span>2</span></a>
                        </li>
                    </ul>
                </div>
            </li>
            <li id="login-label" style="height: 82px;
                display: flex;align-items: center;">
                <!-- <div class="ss_login_box">	<a href="./login.jsp"><span>Đăng nhập/Đăng ký</span> <img src="../static/images/header/user_icon.png" alt="Đăng nhập" title="Đăng nhập" class="img-responsive"></a>
                </div> -->
                <!-- <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                      Nguyễn Ngọc Hân <strong>#12</strong>
                      <span class="caret"></span
                    </button>
                    <ul  class="dropdown-menu" aria-labelledby="dropdownMenuDivider" style="left: 0; z-index: 111121; text-decoration: none;">
                      <li><a href="change-password.jsp" style="text-decoration: none;">Đổi mật khẩu</a></li>
                      <li><a href="../frontend/profile.html" style="text-decoration: none;">Thông tin cá nhân</a></li>
                      <li><a href="#" style="text-decoration: none;">Lịch sử đơn hàng</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="#" style="text-decoration: none;">Đăng xuất</a></li>
                    </ul>
                  </div> -->
            </li>
            <li>
                <div class="ss_cart_value dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <p>${cart.size()}</p>
                        <a href="<c:url value='/gio-hang' />"><img src="../static/images/header/cart_icon.png" alt="Cart" title="Yêu thích">
                            <span>Giỏ hàng: <ins style="text-transform: lowercase;">đ</ins></span>
                        </a>
<%--                        <ul class="dropdown-menu">--%>
<%--                            <c:forEach var="entry" items="${cart}">--%>
<%--                                <c:set var="product" value="${productService.findProductById(entry.key)}"/>--%>
<%--                                <li>--%>
<%--                                    <div class="ss_cart_inner_main_section ss_cart_inner_main_section2">--%>
<%--                                        <div class="ss_cart_img_wrapper">--%>
<%--                                            <img src="${product.thumbnail}" alt="${product.name}">--%>
<%--                                        </div>--%>
<%--                                        <div class="ss_cart_img_cont_wrapper">--%>
<%--                                            <h3>${product.name}</h3>--%>
<%--                                            <h4>${product.categoryName}</h4>--%>
<%--                                            <span>x${entry.value}</span>--%>
<%--                                            <ins>${product.price * entry.value} đ</ins>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                            </c:forEach>--%>
<%--                            <li>--%>
<%--                                <a href="<c:url value='' />" class="ss_check_btn">Thanh Toán</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </a>--%>
                </div>
            </li>
        </ul>
        </a>
    </div>
    </li>
    </ul>
</div>
</div>
<!-- Header Wrapper End -->