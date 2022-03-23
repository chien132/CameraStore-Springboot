<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Quản lý tài khoản</title>
    <%--    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>--%>
    <%--    <script src="resources/semantic/jquery-3.1.1.min.js"--%>
    <%--            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>--%>
    <%--    <script src="resources/semantic/semantic.min.js"></script>--%>
    <jsp:include page="header.jsp"/>
</head>
<body id="homelogin">

<div class="spacer"></div>


<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Quản lý tài khoản</h2>
        </div>
    </div>
</div>

<%--<div class="spacer"></div>--%>

<!-- cards -->
<div class="ui container bg_rgba" style="width: 95%;height:90%;overflow: scroll">
    <table id="mytable"
           class="ui celled table responsive nowrap unstackable"
           style="width: 100%">
        <thead style="text-align: center;">
        <tr>
            <th>Username</th>
            <th>Avatar</th>
            <th>Họ tên</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Loại tài khoản</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody style="text-align: center;">
        <c:forEach var="i" items="${accounts}">
            <tr>
                <td>${i.username}</td>
                <td><img style="max-width: 3.75vh;" alt=""
                         src=${i.photo}></td>
                <td>${i.fullname}</td>
                <td>${i.email}</td>
                <td>${i.phone}</td>
                <td><c:if test="${i.admin}"> Admin</c:if>
                    <c:if test="${!i.admin}"> User</c:if></td>
                <td>
                    <a href="admin/account/edit/${i.id}">
                        <button class="ui  primary button centered">Sửa</button>
                    </a>
<%--                    left attached--%>
<%--                    <button class="ui right attached negative button centered"--%>
<%--                            onclick="showModal(${i.id},'${i.username}')">Xóa--%>
<%--                    </button>--%>
                        <%--                    </a>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<div class="ui tiny modal" id="deleteconfirm">
    <div class="header"><i class="exclamation red icon"></i> Cảnh báo</div>
    <div class="content">
        <h3 id="usernamep"></h3>
    </div>
    <div class="actions">
        <a id="delbtn">
            <div class="ui approve red inverted button"><i class="trash alternate outline icon"></i> Xóa</div>
        </a>
        <div class="ui cancel blue inverted button">Hủy</div>
    </div>
</div>

<script type="text/javascript">


    function showModal(id, username) {

        $('#usernamep').html('Bạn có chắc chắn xóa tài khoản "' + username + '"')
        // $('#delbtn').onclick = document.location.href('admin/account/delete/' + id);
        document.getElementById('delbtn').setAttribute("href", 'admin/account/delete/' + id);
        $('#deleteconfirm').modal('show')
        //    .modal('setting', 'transition', 20)
    }
</script>
<jsp:include page="footer.jsp"/>
<jsp:include page="../datatable.jsp"/>
</body>
</html>