<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/8/2025
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/tablib.jsp"%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>Quản lý slide</title>
  <link rel="stylesheet" href="../../static/css/admin.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <!--srart theme style -->
  <link rel="stylesheet" type="text/css" href="../../static/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="../../static/css/fonts.css" />
  <link rel="stylesheet" type="text/css" href="../../static/css/responsive.css" />
  <!-- favicon links -->
  <link rel="shortcut icon" type="image/png" href="../../static/images/header/favicon.png" />
  <link rel="stylesheet"
        href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="../../static/css/category-management.css">
  <link rel="stylesheet" href="../../static/css/admin-management.css">
  <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
  <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
</head>

<body>

<div class="dashboard">
  <div class="sidebar " id="sidebar">
    <%@include file="/admin/components/admin-sidebar.jsp"%>
  </div>
  <!-- end sidebar -->
  <!-- start header -->
  <div class="main-content" id="header" style="margin-left: 0; height: fit-content;">
    <%@include file="/admin/components/admin-header.jsp"%>
  </div>

  <!-- Main Content -->
  <main class="main-content row my-table-custom">
    <!--style="display: flex; position: relative; height: min-content;"> -->
    <div class=" " style="width: 100%;">
      <h1 class="text-center " style="margin-bottom: 20px;">Chỉnh sửa slide</h1>
        <c:if test="${not empty alert}">
            <%@include file="/admin/components/alert.jsp"%>
        </c:if>
      <form id="formContainer" class="" action="/admin/slides" method="post" style="padding: 0 100px 0 100px;">
        <div>Slide hiện tại</div>
        <div class="col-lg-12" style=" width: 100%;  margin-top: 20px; margin-bottom: 20px; overflow: auto;">
          <c:forEach var="slide" items="${slides}">
            <img src="${slide.image}" width="45%">
            <input type="hidden" name="slideId" value="${slide.id}">
            </c:forEach>
        </div>
        <div class="row" style="margin-top: 20px;">
          <div class="col-lg-12">
            <div class="input-group">
              <span class="input-group-addon" id="basic-addon1">Chọn các hình ảnh slide mới</span>
              <input id="mulpInputImage" type="file" accept="image/*" multiple class="form-control" placeholder="Mô tả sản phẩm..."
                     aria-describedby="basic-addon1"/>
            </div>
          </div>
          <div  hidden id="imageContainer" class="col-lg-12" style=" width: 100%; height: 200px; margin-top: 20px; overflow: hidden;">

          </div>
        </div>
        <div style="margin-top: 20px;" class="text-center">
          <button class="btn-lg btn-danger" style="width: 200px;" type="button" onclick="history.back()">Huỷ bỏ</button>
          <button class="btn-lg btn-primary" style="width: 200px;" type="submit">Lưu thay đổi</button>
        </div>
      </form>
    </div>

  </main>
  <label for="sidebar" class="body-label" id="body-label"></label>
</div>
<script>

  function selectLocalImage() {
    const input = document.createElement('input');
    input.setAttribute('type', 'file');
    input.setAttribute('accept', 'image/*');
    input.click();

    input.onchange = () => {
      const file = input.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = () => {
          const range = quill.getSelection();
          quill.insertEmbed(range.index, 'image', reader.result);
        };
        reader.readAsDataURL(file);
      }
    };
  }
  var quill = new Quill('#description', {
    theme: 'snow',
    modules: {
      toolbar: {
        container: [
          ['bold', 'italic', 'underline'],
          ['image']  // Chỉ định image tool
        ],
        handlers: {
          'image': function () {
            selectLocalImage();
          }
        },
      }
    }
  });
</script>
<script>

  document.getElementById('mulpInputImage').addEventListener('change', function (event) {
    const files = event.target.files; // Lấy danh sách các tệp
    const imageContainer = document.getElementById('imageContainer');
    imageContainer.innerHTML = ''; // Xóa nội dung trước đó

    if (files.length > 0) {
      Array.from(files).forEach(file => {
        if (file.type.startsWith('image/')) { // Kiểm tra định dạng tệp
          const reader = new FileReader();
          reader.onload = function (e) {
            imageContainer.hidden = false
            // Tạo thẻ <img> cho mỗi hình ảnh
            const img = document.createElement('img');
            img.src = e.target.result;
            img.style.width = '100px'; // Kích thước ảnh
            img.style.margin = '5px';
            img.style.border = '1px solid #ddd';
            img.style.borderRadius = '4px';
            img.style.boxShadow = '0px 2px 4px rgba(0, 0, 0, 0.2)';
            const input = document.createElement('input');
            // Thêm ảnh vào container
            input.type = 'hidden';
            input.name = 'images';
            input.value = e.target.result;
            imageContainer.appendChild(img);
            document.getElementById("formContainer").appendChild(input);
          };
          reader.readAsDataURL(file); // Chuyển đổi file thành Base64
        } else {
          alert('File không phải hình ảnh!');
        }
      });
    } else {
      alert('Không có tệp nào được chọn!');
    }
  });

</script>
<script src="../../static/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
<script src="../../static/js/admin.js"> </script>
<script src="../../static/js/category-management.js"></script>
</body>

</html>