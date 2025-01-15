<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/tablib.jsp"%>
<style>
  .link-admin-header:hover {
    text-decoration: underline #2c3e50;
    color: white;
  }
</style>

<div class="sidebar-brand">
  <div class="brand-flex">
    <img
            src="/src/main/webapp/static/images/logo/logo5.svg"
            class="img-logo"
            alt="logo"
    />

    <div class="brand-icons">
      <span class="las la-bell"></span>
      <span class="las la-user-circle"></span>
    </div>
  </div>
</div>

<div class="sidebar-menu">
  <div class="sidebar-user">
    <img src="https://randomuser.me/api/portraits/men/47.jpg" alt="" />

    <div>
      <h3 style="color: white">Xin chào, admin</h3>
      <span></span>
    </div>
  </div>

  <div class="sidebar-menu">
    <!-- <div class="menu-head">
            <span class="category">Dashboard</span>
            <ul>
                <li><a href="#"><span class="las la-balance-scale"></span>Finance</a></li>
                <li><a href="#"><span class="las la-chart-pie"></span>Analytics</a></li>

            </ul>
        </div> -->

    <div class="menu-head">
      <!-- <span class="category">Application</span> -->
      <ul>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin" />">
            <span class="las la-balance-scale"></span>Trang Chủ
          </a>
        </li>
        <li>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin-users" />">
            <span class="las la-balance-scale"></span>Quản lý người dùng
          </a>
        </li>
        <li>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin/orders" />">
            <span class="las la-balance-scale"></span>Quản lý đơn hàng
          </a>
        </li>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin/products" />">
            <span class="las la-balance-scale"></span>Quản lý sản phẩm
          </a>
        </li>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin/categories" />">
            <span class="las la-balance-scale"></span>Quản lý danh mục
          </a>
        </li>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin/brands" />">
            <span class="las la-balance-scale"></span>Quản lý nhãn hàng
          </a>
        </li>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin/coupons" />">
            <span class="las la-balance-scale"></span>Quản lý mã giảm giá
          </a>
        </li>
        <li>
          <a class="link-admin-header" href="<c:url value="/admin/slides" />">
            <span class="las la-balance-scale"></span>Quản lý slide hiển thị
          </a>
        </li>
        <li>
          <a
                  class="link-admin-header"
                  href="/src/main/webapp/admin/slide/slide-management.html"
          ><span class="fa fa-slide" style="font-size: medium"></span
          >Chỉnh sửa slide hiển thị</a
          >
        </li>
      </ul>
    </div>
    <div style="height: 100px; width: 250px; position: relative">
      <a
              class="link-admin-header"
              style="position: absolute; right: 20px; bottom: 30px; color: #efefef"
              href="#"
      ><i class="fa fa-sign-out" aria-hidden="true"></i> Đăng xuất
      </a>
    </div>
  </div>
</div>