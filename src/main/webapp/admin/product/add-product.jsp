<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
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
                <h1 class="text-center " style="margin-bottom: 20px;">Thêm Sản Phẩm Mới</h1>
                <form class="" action="#" method="post" style="padding: 0 100px 0 100px;">
                    <div class="row">
                        <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                            <div class="input-group">
                                <label class="input-group-addon" for="productName" id="basic-addon1">Tên Sản Phẩm</label>
                                <input type="text" class="form-control" id="productName" name="productName" placeholder="Tên sản phẩm..."
                                    aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                            <div class="input-group">
                                <label for="soldQuantity" class="input-group-addon" id="basic-addon1">Số lượng</label>
                                <input type="text" name="soldQuantity" id="soldQuantity" class="form-control" placeholder="Số lượng..."
                                    aria-describedby="basic-addon1">
                            </div>
                        </div>
                    </div>
                    <div class="row " >
                        <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                            <div class="input-group">
                                <label class="input-group-addon" id="basic-addon1" for="costPrice">Giá nhập</label>
                                <input type="text" id="costPrice" name="costPrice" class="form-control" placeholder="Giá nhập..."
                                    aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12" style="margin-top: 20px;">
                            <div class="input-group" >
                                <label for="price" class="input-group-addon" id="basic-addon1">Giá bán</label>
                                <input type="text" id="price" name="price" class="form-control" placeholder="Giá bán..."
                                    aria-describedby="basic-addon1">
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-md-12 col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Mô Tả</span>
                                <div id="description" class="form-control" placeholder="Mô tả sản phẩm..."
                                    aria-describedby="basic-addon1"></div>
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
                                        accept="image/*">
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12" style="margin-top: 20px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1">Loại Sản Phẩm</span>
                                    <select class="form-control" aria-label="Default select example">
                                        <option selected disabled>Chọn loại sản phẩm...</option>
                                        <option value="1">Kem chống nắng</option>
                                        <option value="2">Bông tẩy trang</option>
                                        <option value="3">Kem dưỡng</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12">
                                <div class="input-group" style="margin-top: 20px;">
                                    <span class="input-group-addon" id="basic-addon1">Nhãn Hàng</span>
                                    <select class="form-control" aria-label="Default select example">
                                        <option selected disabled>Chọn nhãn hàng...</option>
                                        <option value="1">Care</option>
                                        <option value="2">Saigon</option>
                                        <option value="3">Tiger</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img src="" alt="image" width="100%" id="output"  hidden>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-lg-12">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Danh sách hình ảnh sản phẩm</span>
                                <input id="mulpInputImage" type="file" accept="image/*" multiple class="form-control" placeholder="Mô tả sản phẩm..."
                                    aria-describedby="basic-addon1"></input>
                            </div>
                        </div>
                        <div  hidden id="imageContainer" class="col-lg-12" style=" width: 100%; height: 200px; margin-top: 20px; overflow: hidden;">

                        </div>
                    </div>
                    <div style="margin-top: 20px;" class="text-center">
                        <button class="btn-lg btn-danger" style="width: 200px;" type="button" onclick="history.back()">Huỷ bỏ</button>
                        <button class="btn-lg btn-primary" style="width: 200px;" type="submit">Thêm Mới</button>
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
        document.getElementById('imageInput').addEventListener('change', function (event) {
            const file = event.target.files[0]; // Lấy tệp được chọn
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('output').hidden = false;
                    document.getElementById('output').setAttribute('src', e.target.result)
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
        
                            // Thêm ảnh vào container
                            imageContainer.appendChild(img);
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