
document.addEventListener("DOMContentLoaded", () => {
    let bar = document.getElementById("menu-toggle");
  let sidebar = document.getElementById("sidebar");
  let bodylabel = document.getElementById("body-label");
  
  let toggleBar = () => {
    sidebar.classList.toggle("active");
  };
  
  bodylabel.addEventListener("click", (event) => {
    sidebar.classList.add("active");
  });
  
  bar.addEventListener("click", (event) => {
    toggleBar();
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
document.querySelector('.sort-btn').addEventListener('click', () => {
    const dropdown = document.querySelector('.sort-options');
    const isVisible = dropdown.style.visibility === 'visible';
    
    dropdown.style.visibility = isVisible ? 'hidden' : 'visible';
    dropdown.style.opacity = isVisible ? '0' : '1';
  });
  
// Lấy modal và các phần tử cần thiết
document.addEventListener("DOMContentLoaded", function () {
    const modal = document.getElementById("customer-modal");
    const closeModal = document.querySelector(".close-btn");
    const detailButtons = document.querySelectorAll(".detail-btn");

    // Modal fields
    const modalName = document.getElementById("modal-name");
    const modalDob = document.getElementById("modal-dob");
    const modalPhone = document.getElementById("modal-phone");
    const modalEmail = document.getElementById("modal-email");
    const modalAddress = document.getElementById("modal-address");
    const modalOrders = document.getElementById("modal-orders");
    const modalCreatedAt = document.getElementById("modal-created-at");
    const modalStatus = document.getElementById("modal-status");

    // Attach event listeners to detail buttons
    detailButtons.forEach((button) => {
        button.addEventListener("click", function () {
            const row = this.closest(".table-row");
            const customerData = row.getAttribute("data-customer");

            if (!customerData) {
                alert("No customer data available!");
                return;
            }

            const customer = JSON.parse(customerData.replace(/'/g, '"'));

            // Populate modal with data
            modalName.textContent = customer.name;
            modalDob.textContent = customer.dob;
            modalPhone.textContent = customer.phone;
            modalEmail.textContent = customer.email;
            modalAddress.textContent = customer.address;
            modalOrders.textContent = customer.orders;
            modalCreatedAt.textContent = customer.created_at;
            modalStatus.textContent = customer.status;

            // Show modal
            modal.style.display = "flex";
        });
    });

    // Close modal button
    closeModal.addEventListener("click", () => {
        modal.style.display = "none";
    });

    // Close modal when clicking outside
    window.addEventListener("click", (event) => {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
});

document.addEventListener("DOMContentLoaded", () => {
    let bar = document.getElementById("menu-toggle");
  let sidebar = document.getElementById("sidebar");
  let bodylabel = document.getElementById("body-label");
  
  let toggleBar = () => {
    sidebar.classList.toggle("active");
  };
  
  bodylabel.addEventListener("click", (event) => {
    sidebar.classList.add("active");
  });
  
  bar.addEventListener("click", (event) => {
    toggleBar();
  });
  });
  
document.addEventListener("DOMContentLoaded", () => {
    let bar = document.getElementById("menu-toggle");
  let sidebar = document.getElementById("sidebar");
  let bodylabel = document.getElementById("body-label");
  
  let toggleBar = () => {
    sidebar.classList.toggle("active");
  };
  
  bodylabel.addEventListener("click", (event) => {
    sidebar.classList.add("active");
  });
  
  bar.addEventListener("click", (event) => {
    toggleBar();
  });
  });