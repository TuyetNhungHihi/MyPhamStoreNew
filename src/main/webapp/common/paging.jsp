<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 1/10/2025
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="width: 100%;" class="text-center">
  <nav aria-label="Page navigation">
    <ul class="pagination">
      <!-- Previous Button -->
      <li class="<c:if test='${currentPage <= 1}'>disabled</c:if>">
        <a class="previous-btn" href="<c:if test='${currentPage > 1}'>?currentPage=${currentPage - 1}&pageSize=${pageSize}&keyword=${keyword}&orderBy=${orderBy}</c:if>" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>

      <!-- Page Numbers -->
      <c:forEach var="i" begin="0" end="${totalPages-1}" varStatus="status">
        <li class="<c:if test='${status.index + 1 == currentPage}'>active</c:if>">
          <a href="?currentPage=${status.index + 1}&pageSize=${pageSize}&keyword=${keyword}&orderBy=${orderBy}">
              ${status.index + 1}
          </a>
        </li>
      </c:forEach>

      <!-- Next Button -->
      <li class="<c:if test='${currentPage >= totalPages}'>disabled</c:if>">
        <a class="next-btn"
           href="<c:if test='${currentPage < totalPages}'>?currentPage=${currentPage + 1}&pageSize=${pageSize}&keyword=${keyword}&orderBy=${orderBy}</c:if>"
           aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</div>