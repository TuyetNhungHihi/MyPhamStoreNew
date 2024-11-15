// Đảm bảo rằng đoạn mã này nằm sau phần tử HTML của bản đồ hoặc trong sự kiện window.onload.
document.addEventListener("DOMContentLoaded", function() {
    var map = L.map('map').setView([16.0471, 108.2068], 5); // Thiết lập tọa độ trung tâm của Việt Nam

    // Tải lớp nền của bản đồ từ OpenStreetMap
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    // Đánh dấu các vị trí có khách hàng
    L.marker([21.0285, 105.8542]).addTo(map).bindPopup("Hà Nội - Nhiều khách hàng");
    L.marker([10.8231, 106.6297]).addTo(map).bindPopup("TP. Hồ Chí Minh - Trung bình");
    L.marker([16.0471, 108.2068]).addTo(map).bindPopup("Đà Nẵng - Ít khách hàng");
});
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
        console.log(`Sorting by: ${sortBy}`);
        // Thực hiện sắp xếp dữ liệu tại đây
    });
});
