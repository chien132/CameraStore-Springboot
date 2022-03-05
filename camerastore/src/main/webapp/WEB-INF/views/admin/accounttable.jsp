<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="${pageContext.servletContext.contextPath}/">
    <title></title>
<%--    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>--%>
<%--    <script src="resources/semantic/jquery-3.1.1.min.js"--%>
<%--            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>--%>
<%--    <script src="resources/semantic/semantic.min.js"></script>--%>
    <jsp:include page="header.jsp"/>
    <style>
        .bg_rgba {
            background-color: rgb(255, 255, 255);
            background-blend-mode: lighten;
            /* width: 200px; */
            /* height: 200px; */
            /* border: 1px solid black; */
        }

        @media only screen and (min-width: 1200px) {
            .ui.container {
                width: 90%;
                margin-left: auto !important;
                margin-right: auto !important;
            }
        }
    </style>
</head>
<body id="homelogin">

<div class="spacer"></div>


<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h1 style="color: white;">Tài khoản</h1>
        </div>
    </div>
</div>

<div class="spacer"></div>

<!-- cards -->
<div class="ui container bg_rgba">
    <table id="mytable"
           class="ui celled table responsive nowrap unstackable"
           style="width: 100%">
        <thead style="text-align: center;">
        <tr>
            <th>Username</th>
            <th>Avatar</th>
            <th>Họ tên</th>
            <th>Email</th>
            <th>SĐT</th>
            <th>Admin</th>
            <th>Sửa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${accounts}">
            <tr>
                <td>${i.username}</td>
                <td><img style="max-width: 33px;" alt=""
                         src=${i.photo}></td>
                <td>${i.fullname}</td>
                <td>${i.email}</td>
                <td>${i.phone}</td>
                <td><c:if test="${i.admin}"> Admin</c:if>
                    <c:if test="${!i.admin}"> User</c:if></td>
                <td>
                    <button class="ui left attached primary button">Sửa</button>
                    <button class="ui right attached negative button">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="spacer"></div>
<jsp:include page="footer.jsp"/>
</body>
</html>