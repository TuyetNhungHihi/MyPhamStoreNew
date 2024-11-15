document.addEventListener("DOMContentLoaded", function () {
  const sortButton = document.querySelector(".sort-button");

  // Sample functionality for sorting (toggle between ascending and descending)
  let isAscending = true;

  sortButton.addEventListener("click", () => {
    // Here you could add sorting logic
    isAscending = !isAscending;
    sortButton.textContent = `Sắp xếp ${isAscending ? "▲" : "▼"}`;
  });

  // Additional interactivity can be added here, such as search functionality or chart rendering
});
