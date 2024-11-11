document.addEventListener('DOMContentLoaded', function () {
    const statBoxes = document.querySelectorAll('.stat-box');

    statBoxes.forEach(box => {
        box.addEventListener('click', () => {
            alert(`Bạn đã nhấp vào ${box.textContent}`);
        });
    });

    const ctx = document.getElementById('salesChart');
    if (ctx) {
        const salesChart = new Chart(ctx.getContext('2d'), {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Doanh thu (triệu đồng)',
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
});

function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
}
