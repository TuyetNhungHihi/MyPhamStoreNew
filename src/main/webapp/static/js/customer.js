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
