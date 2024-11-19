
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
            row.remove(); 
            alert("Dòng dữ liệu đã được xóa!");
        });
    });

    // Xử lý sự kiện Ghim
    document.querySelectorAll(".pin-btn").forEach((btn) => {
        btn.addEventListener("click", function() {
            const row = this.closest(".table-row");
            const tableBody = document.querySelector(".table-body");
            tableBody.prepend(row); 
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
document.addEventListener("DOMContentLoaded", function() {
    // Initialize the map centered on Vietnam with specific bounds
    var map = L.map('map', {
        center: [14.0583, 108.2772], // Center on Vietnam
        zoom: 6, // Initial zoom level
        minZoom: 6, // Prevents zooming out too far
        maxZoom: 10, // Optional max zoom for more detail
        maxBounds: [
            [8.179, 102.144], // Southwest corner of Vietnam
            [23.393, 109.464]  // Northeast corner of Vietnam
        ],
        maxBoundsViscosity: 1.0 // Keeps the map within bounds
    });
    
    // Add a more detailed tile layer that highlights Vietnam more clearly
    L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap contributors, Tiles style by OpenStreetMap France',
        maxZoom: 20 // Allows closer zoom levels
    }).addTo(map);

    // Add markers for customer locations within Vietnam
    L.marker([21.0285, 105.8542]).addTo(map).bindPopup("Hà Nội - Nhiều khách hàng");
    L.marker([10.8231, 106.6297]).addTo(map).bindPopup("TP. Hồ Chí Minh - Trung bình");
    L.marker([16.0471, 108.2068]).addTo(map).bindPopup("Đà Nẵng - Ít khách hàng");
});

