window.onload = ()=>{
    const loginLabel = document.getElementById('login-label');
    const user = JSON.parse(localStorage.getItem('user'));
    if(user){
        loginLabel.innerHTML = `
        <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  Nguyễn Ngọc Hân <strong>#12</strong>
                  <span class="caret"></span
                </button>
                <ul  class="dropdown-menu" aria-labelledby="dropdownMenuDivider" style="left: 0; z-index: 111121; text-decoration: none;">
                  <li><a href="change-password.html" style="text-decoration: none;">Đổi mật khẩu</a></li>
                  <li><a href="../frontend/profile.html" style="text-decoration: none;">Thông tin cá nhân</a></li>
                  <li><a href="#" style="text-decoration: none;">Lịch sử đơn hàng</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="#" style="text-decoration: none;">Đăng xuất</a></li>
                </ul>
              </div>
        `
    }else{
        loginLabel.innerHTML = `
        <div class="ss_login_box">	<a href="./login.html"><span>Đăng nhập/Đăng ký</span> <img src="../static/images/header/user_icon.png" alt="Đăng nhập" title="Đăng nhập" class="img-responsive"></a>
            </div>
        `
    }
}