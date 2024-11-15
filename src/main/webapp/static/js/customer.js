// Đảm bảo rằng đoạn mã này nằm sau phần tử HTML của bản đồ hoặc trong sự kiện window.onload.

document.addEventListener("DOMContentLoaded", function () {
    const logoutButton = document.querySelector('.logout');
    logoutButton.addEventListener('click', function () {
        if (confirm("Bạn có chắc chắn muốn đăng xuất?")) {
            window.location.href = "/logout"; // Thay bằng đường dẫn đăng xuất
        }
    });
});
document.addEventListener("DOMContentLoaded", function() {
    // Xử lý sự kiện Xóa
    document.querySelectorAll(".delete-btn").forEach((btn) => {
        btn.addEventListener("click", function() {
            const row = this.closest(".table-row");
            row.remove(); // Xóa dòng hiện tại
            alert("Dòng dữ liệu đã được xóa!");
        });
    });

    // Xử lý sự kiện Ghim
    document.querySelectorAll(".pin-btn").forEach((btn) => {
        btn.addEventListener("click", function() {
            const row = this.closest(".table-row");
            const tableBody = document.querySelector(".table-body");
            tableBody.prepend(row); // Đưa dòng lên đầu
            alert("Dòng dữ liệu đã được ghim!");
        });
    });
});
document.querySelectorAll('.sort-options li').forEach(option => {
    option.addEventListener('click', () => {
        const sortBy = option.getAttribute('data-sort');
        alert(`Sorting by: ${sortBy}`);
        // Implement your sorting logic here
    });
});

