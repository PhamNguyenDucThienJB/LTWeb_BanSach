<%--
  Created by IntelliJ IDEA.
  User: John Pham
  Date: 12/4/2024
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty error}">
    <div class="alert alert-danger text-center" role="alert">
            ${error}
    </div>
</c:if>
<c:if test="${not empty success}">
    <div class="alert alert-success text-center" role="alert">
            ${success}
    </div>
</c:if>

