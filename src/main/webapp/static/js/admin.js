document.addEventListener('DOMContentLoaded', function () {
    const combinedCtx = document.getElementById('combinedRevenueChart');
    if (combinedCtx) {
        new Chart(combinedCtx.getContext('2d'), {
            type: 'line',
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
                        tension: 0.6
                    },
                    {
                        label: 'Doanh thu dự kiến',
                        data: [90, 100, 90, 110, 80, 100, 150, 200, 150, 120, 150, 130, 200],
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 2,
                        borderDash: [5, 5],
                        fill: false,
                        tension: 0.6
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
                            text: 'Doanh thu (triệu đồng)'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    },
                    tooltip: {
                        enabled: true
                    }
                }
            }
        });
    }
});

window.onload = function () {
    var pieChart = new CanvasJS.Chart("pieChart", {
        exportEnabled: true,
        animationEnabled: true,
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
    pieChart.render();
    
    var columnChart = new CanvasJS.Chart("columChart", {
        animationEnabled: true,
        title:{
            text: "Crude Oil Reserves vs Production, 2016"
        },
        axisY: {
            title: "Billions of Barrels",
            titleFontColor: "#4F81BC",
            lineColor: "#4F81BC",
            labelFontColor: "#4F81BC",
            tickColor: "#4F81BC"
        },
        axisY2: {
            title: "Millions of Barrels/day",
            titleFontColor: "#C0504E",
            lineColor: "#C0504E",
            labelFontColor: "#C0504E",
            tickColor: "#C0504E"
        },
        toolTip: {
            shared: true
        },
        legend: {
            cursor: "pointer",
            itemclick: toggleDataSeries
        },
        data: [{
            type: "column",
            name: "Proven Oil Reserves (bn)",
            legendText: "Proven Oil Reserves",
            showInLegend: true, 
            dataPoints:[
                { label: "Saudi", y: 266.21 },
                { label: "Venezuela", y: 302.25 },
                { label: "Iran", y: 157.20 },
                { label: "Iraq", y: 148.77 },
                { label: "Kuwait", y: 101.50 },
                { label: "UAE", y: 97.8 }
            ]
        },
        {
            type: "column",	
            name: "Oil Production (million/day)",
            legendText: "Oil Production",
            axisYType: "secondary",
            showInLegend: true,
            dataPoints:[
                { label: "Saudi", y: 10.46 },
                { label: "Venezuela", y: 2.27 },
                { label: "Iran", y: 3.99 },
                { label: "Iraq", y: 4.45 },
                { label: "Kuwait", y: 2.92 },
                { label: "UAE", y: 3.1 }
            ]
        }]
    });
    columnChart.render();
};

function explodePie(e) {
    if (typeof(e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
        e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
    } else {
        e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
    }
    e.chart.render();
}

function toggleDataSeries(e) {
    if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
        e.dataSeries.visible = false;
    }
    else {
        e.dataSeries.visible = true;
    }
    chart.render();
}
