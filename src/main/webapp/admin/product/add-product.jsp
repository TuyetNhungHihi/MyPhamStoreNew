<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/common/tablib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Quản lý sản phẩm</title>
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
    <script type="text/javascript" src="../../static/ckeditor/ckeditor.js"></script>
</head>

<body>
    <div class="dashboard">
        <!-- Sidebar -->
        <div class="sidebar " id="sidebar">
            <%@include file="/admin/components/admin-sidebar.jsp"%>
        </div>
        <!-- end sidebar -->
        <!-- start header -->
        <div class="main-content" id="header" style="margin-left: 0; height: fit-content;">
            <%@include file="/admin/components/admin-header.jsp"%>

        </div>
        <!-- end header -->

        <!-- Main Content -->
        <main class="main-content row my-table-custom">

            <!--style="display: flex; position: relative; height: min-content;"> -->
            <div class=" " style="width: 100%;">
                <h1 class="text-center " style="margin-bottom: 20px;">
                    <c:choose>
                        <c:when test="${empty product}">Thêm mới sản phẩm</c:when>
                        <c:otherwise>Sửa sản phẩm #${product.id}</c:otherwise>
                    </c:choose>
                </h1>
               <c:if test="${not empty message or  not empty param.message}">
                    <div class="alert alert-success" role="alert">${message}</div>
                </c:if>
                <c:choose>
                    <c:when test="${empty product}">
                        <c:set var="formAction" value="/admin/products?action=insert" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="formAction" value="/admin/products?action=edit" />
                    </c:otherwise>
                </c:choose>
                <form class="" id="formContainer" action="<c:url value="${formAction}"/>" method="post" style="padding: 0 100px 0 100px;">

                    <c:choose>
                        <c:when test="${!empty product}">
                             <!-- add variant -->
                             <button id="add-variant" class="btn btn-primary">Thêm biến thể</button>
                             <div id="variantContainer">
                                 <c:if test="${!empty variants}">
                                 <c:forEach items="${variants}" var="v">
                                     <div class="row">
                                         <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                             <div class="input-group">
                                                 <label class="input-group-addon" for="variantName2">Tên Biến Thể</label>
                                                 <input type="text" class="form-control" name="variantName2" placeholder="Tên biến thể..." readonly value="${v.name}">
                                             </div>
                                         </div>
                                         <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                             <div class="input-group">
                                                 <label for="variantStock2" class="input-group-addon">Số lượng</label>
                                                 <input type="text" name="variantStock2" class="form-control" placeholder="Số lượng..." readonly value="${v.stock}">
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row" style="maggin-bottom:10px">
                                         <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                             <div class="input-group">
                                                 <label class="input-group-addon" for="variantCostPrice2">Giá nhập</label>
                                                 <input type="text" name="variantCostPrice2" class="form-control" placeholder="Giá nhập..." readonly value="${v.costPrice}">
                                             </div>
                                         </div>
                                         <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                             <div class="input-group">
                                                 <label for="variantPrice2" class="input-group-addon">Giá bán</label>
                                                 <input type="text" name="variantPrice2" class="form-control" placeholder="Giá bán..." readonly value="${v.price}">
                                             </div>
                                         </div>
                                     </div>
                                     <!-- Nút hủy bỏ -->
                        </c:forEach>
                        </c:if>
                             </div>

                            <div class="row">
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group">
                                        <label class="input-group-addon" for="productName" id="basic-addon1">Tên Sản Phẩm 1</label>
                                        <input type="text" class="form-control" id="productName" name="productName" placeholder="Tên sản phẩm..."
                                               aria-describedby="basic-addon1" value="${product.name}">
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group">
                                        <label for="stock" class="input-group-addon" id="basic-addon1">Số lượng</label>
                                        <input type="text" name="stock" id="stock" class="form-control" placeholder="Số lượng..."
                                               aria-describedby="basic-addon1" value="${product.stock}">
                                    </div>
                                </div>
                            </div>
                            <div class="row " >
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group">
                                        <label class="input-group-addon" id="basic-addon1" for="costPrice" >Giá nhập</label>
                                        <input type="text" id="costPrice" name="costPrice" class="form-control" placeholder="Giá nhập..."
                                               aria-describedby="basic-addon1" value="${product.costPrice}">
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group" >
                                        <label for="price" class="input-group-addon" id="basic-addon1">Giá bán</label>
                                        <input type="text" id="price" name="price" class="form-control" placeholder="Giá bán..."
                                               aria-describedby="basic-addon1" value="${product.price}">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div class="col-md-12 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">Mô Tả</span>
                                        <textarea name="description" id="description" class="form-control" placeholder="Mô tả sản phẩm..."
                                                  aria-describedby="basic-addon1">${product.description}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div class="col-md-6 col-xs-12 row">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1">Thumbnail</span>
                                            <input id="imageInput"  type="file" class="form-control"
                                                   placeholder="Hình ảnh sản phẩm..." aria-describedby="basic-addon1"
                                                   accept="image/*">
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12" style="margin-top: 20px;">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1">Loại Sản Phẩm</span>
                                            <select name="categoryId" class="form-control" aria-label="Default select example">
                                                <c:forEach var="c" items="${categories}">
                                                    <c:choose >
                                                        <c:when test="${c.id == product.categoryId}">
                                                            <option selected value="${c.id}">${c.name}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${c.id}">${c.name}</option>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12">
                                        <div class="input-group" style="margin-top: 20px;">
                                            <span class="input-group-addon" id="basic-addon1">Nhãn Hàng</span>
                                            <select name="brandId" class="form-control" aria-label="Default select example">
                                                <c:forEach var="b" items="${brands}">
                                                    <c:choose >
                                                        <c:when test="${b.id == product.brandId}">
                                                            <option selected value="${b.id}">${b.name}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${b.id}">${b.name}</option>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <c:choose>
                                        <c:when test="${!empty product.thumbnail}">
                                            <img src="${product.thumbnail}" alt="image" width="80%" id="thumbnail" >
                                        </c:when>
                                        <c:otherwise>
                                            <img  src="" alt="image" width="80%" id="thumbnail"  hidden>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div class="col-lg-12">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">Danh sách hình ảnh sản phẩm</span>
                                        <input id="mulpInputImage" name="mulpInputImage" type="file" accept="image/*" multiple class="form-control" placeholder="Mô tả sản phẩm..."
                                               aria-describedby="basic-addon1"></input>
                                    </div>
                                </div>
                                    <c:if test="${!empty images}">
                                <div  id="imageContainer" class="col-lg-12" style=" width: 100%; height: 200px; margin-top: 20px; overflow: hidden;">
                                        <c:forEach var="image" items="${images}">
                                            <img src="${image.url}" alt="image" width="100px" style="margin: 5px; border: 1px solid #ddd; border-radius: 4px; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
                                        </c:forEach>
                                </div>
                                    </c:if>
                                <c:if test="${empty images}">
                                    <div  hidden id="imageContainer" class="col-lg-12" style=" width: 100%; height: 200px; margin-top: 20px; overflow: hidden;">

                                    </div>
                                </c:if>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row">
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group">
                                        <label class="input-group-addon" for="productName" id="basic-addon1">Tên Sản Phẩm</label>
                                        <input type="text" class="form-control" id="productName" name="productName" placeholder="Tên sản phẩm..."
                                               aria-describedby="basic-addon1" required>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group">
                                        <label for="stock" class="input-group-addon" id="basic-addon1">Số lượng</label>
                                        <input type="text" name="stock" id="stock" class="form-control" placeholder="Số lượng..."
                                               aria-describedby="basic-addon1" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row " >
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group">
                                        <label class="input-group-addon" id="basic-addon1" for="costPrice" >Giá nhập</label>
                                        <input type="text" id="costPrice" name="costPrice" class="form-control" placeholder="Giá nhập..."
                                               aria-describedby="basic-addon1" required>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                                    <div class="input-group" >
                                        <label for="price" class="input-group-addon" id="basic-addon1">Giá bán</label>
                                        <input type="text" id="price" name="price" class="form-control" placeholder="Giá bán..."
                                               aria-describedby="basic-addon1" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div class="col-md-12 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">Mô Tả</span>
                                        <textarea required name="description" id="description" class="form-control" placeholder="Mô tả sản phẩm..."
                                             aria-describedby="basic-addon1"></textarea>

                                    </div>

                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div class="col-md-6 col-xs-12 row">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1">Thumbnail</span>
                                            <input id="imageInput" type="file" class="form-control"
                                                   placeholder="Hình ảnh sản phẩm..." aria-describedby="basic-addon1"
                                                   accept="image/*" required>
                                            <input name="thumbnail" type="hidden">
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12" style="margin-top: 20px;">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1">Loại Sản Phẩm</span>
                                            <select name="categoryId" class="form-control" aria-label="Default select example">
                                                <option  selected disabled>Chọn loại sản phẩm...</option>
                                                <c:forEach var="c" items="${categories}">
                                                    <option value="${c.id}">${c.name}</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12">
                                        <div class="input-group" style="margin-top: 20px;">
                                            <span class="input-group-addon" id="basic-addon1">Nhãn Hàng</span>
                                            <select name="brandId" class="form-control" aria-label="Default select example">
                                                <option selected disabled>Chọn nhãn hàng...</option>
                                                <c:forEach var="b" items="${brands}">
                                                    <option value="${b.id}">${b.name}</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <img src="" alt="image" width="80%" id="thumbnail"  hidden>

                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div class="col-lg-12">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">Danh sách hình ảnh sản phẩm</span>
                                        <input id="mulpInputImage" name="mulpInputImage" type="file" accept="image/*" multiple class="form-control"
                                               aria-describedby="basic-addon1" required></input>
                                    </div>
                                </div>
                                <div  hidden id="imageContainer" class="col-lg-12" style=" width: 100%; height: 200px; margin-top: 20px; overflow: hidden;">

                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div style="margin-top: 20px;" class="text-center">
                        <button class="btn-lg btn-danger" style="width: 200px;" type="button" onclick="history.back()">Huỷ bỏ</button>
                        <button class="btn-lg btn-primary" style="width: 200px;" type="submit">
                            <c:choose>
                                <c:when test="${empty product}">Thêm sản phẩm</c:when>
                                <c:otherwise>Lưu chỉnh sửa</c:otherwise>
                            </c:choose>
                        </button>
                    </div>
                    <c:if test="${!empty product}">
                        <input type="hidden" name="id" value="${product.id}">
                        <input type="hidden" name="thumbnail" value="${product.thumbnail}">
                        <c:forEach var="image" items="${images}">
                            <input type="hidden" name="images" value="${image.url}">
                        </c:forEach>
                    </c:if>
                </form>
            </div>
        </main>
        <label for="sidebar" class="body-label" id="body-label"></label>
    </div>
    <script>
        CKEDITOR.replace('description');
    </script>
    <script>
        document.querySelector('#add-variant').addEventListener('click', () => {
    const formContainer = document.querySelector('#variantContainer');

    // Tạo phần tử div chứa mẫu
    const newDiv = document.createElement('div');
    newDiv.innerHTML = `
        <div class="row">
            <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group">
                    <label class="input-group-addon" for="variantName">Tên Biến Thể</label>
                    <input type="text" class="form-control" name="variantName" placeholder="Tên biến thể..." required>
                </div>
            </div>
            <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group">
                    <label for="variantStock" class="input-group-addon">Số lượng</label>
                    <input type="text" name="variantStock" class="form-control" placeholder="Số lượng..." required>
                </div>
            </div>
        </div>
        <div class="row" style="maggin-bottom:10px">
            <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group">
                    <label class="input-group-addon" for="variantCostPrice">Giá nhập</label>
                    <input type="text" name="variantCostPrice" class="form-control" placeholder="Giá nhập..." required>
                </div>
            </div>
            <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                <div class="input-group">
                    <label for="variantPrice" class="input-group-addon">Giá bán</label>
                    <input type="text" name="variantPrice" class="form-control" placeholder="Giá bán..." required>
                </div>
            </div>
        </div>
        <!-- Nút hủy bỏ -->
        <button class="remove-variant btn btn-danger " >Hủy bỏ</button>
    `;
    newDiv.querySelector('.remove-variant').addEventListener('click', () => {
        newDiv.remove();
    });

    // Thêm phần tử mới vào đầu container
    formContainer.prepend(newDiv);
});
    </script>
    <script>
        document.getElementById('imageInput').addEventListener('change', function (event) {
            document.getElementById('thumbnail').setAttribute('src', '')
            const file = event.target.files[0]; // Lấy tệp được chọn
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('thumbnail').hidden = false;
                    document.getElementById('thumbnail').setAttribute('src', e.target.result)
                    document.getElementsByName('thumbnail')[0].value = e.target.result;
                };
                reader.readAsDataURL(file); // Chuyển đổi tệp thành Base64
            } else {
                alert("No file selected!");
            }
        });
        document.getElementById('mulpInputImage').addEventListener('change', function (event) {
            const files = event.target.files; // Lấy danh sách các tệp
            const imageContainer = document.getElementById('imageContainer');
            imageContainer.innerHTML = ''; // Xóa nội dung trước đó
            document.getElementsByName('images').forEach(e => e.remove());

            if (files.length > 0) {
                Array.from(files).forEach(file => {
                    if (file.type.startsWith('image/')) { // Kiểm tra định dạng tệp
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            imageContainer.hidden = false
                            // Tạo thẻ <img> cho mỗi hình ảnh
                            const img = document.createElement('img');
                            const input = document.createElement('input');

                            img.src = e.target.result;
                            img.style.width = '100px'; // Kích thước ảnh
                            img.style.margin = '5px';
                            img.style.border = '1px solid #ddd';
                            img.style.borderRadius = '4px';
                            img.style.boxShadow = '0px 2px 4px rgba(0, 0, 0, 0.2)';

                            input.type = 'hidden';
                            input.name = 'images';
                            input.value = e.target.result;

        
                            // Thêm ảnh vào container
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