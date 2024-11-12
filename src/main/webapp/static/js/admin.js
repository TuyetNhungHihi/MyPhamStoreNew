document.addEventListener('DOMContentLoaded', function () {
    // Chart.js Line Chart Initialization
    const combinedCtx = document.getElementById('combinedRevenueChart');
    if (combinedCtx) {
        new Chart(combinedCtx.getContext('2d'), {
            type: 'line',
            height: 300,
            width: 300,
            data: {
                labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'],
                datasets: [
                    {
                        label: 'Doanh thu thực',
                        data: [80, 140, 100, 170, 220, 150, 60, 120, 230, 180, 140, 190, 100],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 2,
                        fill: true,
                        tension: 0.4,
                    },
                    {
                        label: 'Doanh thu dự kiến',
                        data: [90, 100, 90, 110, 80, 100, 150, 200, 150, 120, 150, 130, 200],
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 2,
                        borderDash: [5, 5],
                        fill: false,
                        tension: 0.4
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Doanh thu (triệu đồng)',
                            color: 'white'
                        },
                        ticks: {
                            color: 'white' 
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày',
                            color: 'white'
                        },
                        ticks: {
                            color: 'white' 
                        }
                    }
                },
                plugins: {
                    legend: {
                        labels: {
                            color: 'white' // Đổi màu chữ của chú thích thành màu trắng
                        }
                    },
                    tooltip: {
                        titleColor: 'white', // Màu tiêu đề tooltip
                        bodyColor: 'white', // Màu nội dung tooltip
                        footerColor: 'white' // Màu footer tooltip (nếu có)
                    }
                }
            }
        });
    }

    // CanvasJS Pie Chart Initialization
    var pieChart = new CanvasJS.Chart("pieChart", {
        exportEnabled: true,
        animationEnabled: true,
        backgroundColor: "transparent",
        title: {
            text: "Sản phẩm bán chạy",
            fontFamily: "Arial, sans-serif",
            fontSize: 15,
            fontWeight: "bold",
        },
        legend: {
            cursor: "pointer",
            itemclick: explodePie
        },
        data: [{
            type: "pie",
            showInLegend: true,
            toolTipContent: "{name}: <strong>{y}%</strong>",
            indexLabel: "{name} - {y}%",
            dataPoints: [
                { y: 26, name: "Trang điểm", exploded: true },
                { y: 20, name: "Sữa rửa mặt" },
                { y: 5, name: "Mặt nạ" },
                { y: 3, name: "Dưỡng thể" },
                { y: 7, name: "Tóc" },
                { y: 17, name: "Trị mụn" },
                { y: 22, name: "Khác" }
            ]
        }]
    });
    // var pieChart = new CanvasJS.Chart("pieChart",{});
    pieChart.render();

    // CanvasJS Column Chart Initialization
    var columnChart = new CanvasJS.Chart("columChart", {
        animationEnabled: true,
        backgroundColor: "transparent",
        title: {
            text: "Khách hàng Cũ - Mới",
            fontFamily: "Arial, sans-serif",
            fontSize: 15,
            fontWeight: "bold",
        },
        toolTip: {
            shared: true
        },
        legend: {
            cursor: "pointer",
            itemclick: toggleDataSeries
        },
        data: [
            {
                type: "column",
                name: "Khách hàng cũ",
                showInLegend: true, 
                dataPoints: [
                    { y: 266.21 }, { y: 302.25 }, { y: 157.20 }, 
                    { y: 148.77 }, { y: 101.50 }, { y: 97.8 }
                ]
            },
            {
                type: "column",    
                name: "Khách hàng mới",
                axisYType: "secondary",
                showInLegend: true,
                dataPoints: [
                    { y: 10.46 }, { y: 2.27 }, { y: 3.99 },
                    { y: 4.45 }, { y: 2.92 }, { y: 3.1 }
                ]
            }
        ]
    });
    // var columnChart = new CanvasJS.Chart("columChart", {
    columnChart.render();
});

// Explode Pie Chart Segment on Click
function explodePie(e) {
    e.dataSeries.dataPoints[e.dataPointIndex].exploded = !e.dataSeries.dataPoints[e.dataPointIndex].exploded;
    e.chart.render();
}

// Toggle Data Series for Column Chart on Legend Click
function toggleDataSeries(e) {
    e.dataSeries.visible = !e.dataSeries.visible;
    e.chart.render();
}
