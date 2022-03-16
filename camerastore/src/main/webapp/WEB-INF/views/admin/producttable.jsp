<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Quản lý sản phẩm</title>
    <%--    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>--%>
    <%--    <script src="resources/semantic/jquery-3.1.1.min.js"--%>
    <%--            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>--%>
    <%--    <script src="resources/semantic/semantic.min.js"></script>--%>
    <jsp:include page="header.jsp"/>
    <style>
        td.descriptiontd {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* number of lines to show */
            line-clamp: 1;
            -webkit-box-orient: vertical;
        }
    </style>
</head>
<body id="homelogin">
<div class="spacer"></div>

<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Quản lý sản phẩm</h2>
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
            <th>ID</th>
            <th>Ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Mô tả</th>
            <th>Giá</th>
            <th>Giảm giá</th>
            <th>Loại</th>
            <th>Hãng</th>
            <th>Số lượng</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody style="text-align: center;font-size: 1.1rem">
        <c:forEach var="i" items="${products}">
            <tr>
                <td>${i.id}</td>
                <td><img style="max-width: 3.75vh;" alt=""
                         src=${i.image}></td>
                <td style="text-align: left;">${i.name}</td>
                <td class="descriptiontd" style="text-align: left;">${i.description}</td>
                <td style="text-align: right;"><f:formatNumber type="currency"
                                    maxFractionDigits="0" currencySymbol="" value="${i.price}"/>₫
                </td>
                <td><f:formatNumber type="percent" maxIntegerDigits="3" value="${i.discount/100}"/></td>
                    <%--                <td>${i.role.name}<c:if test="${i.role.id==1}"> #${i.chuTro.id}</c:if>--%>
                    <%--                    <c:if test="${i.role.id==2}"> #${i.khachThue.id}</c:if></td>--%>
                <td>${i.category.name}</td>
                <td>${i.brand.name}</td>
                <td>${i.quantity}</td>
                <td>
                    <a href="admin/product/edit/${i.id}">
                        <button class="ui left attached primary button centered">Sửa</button>
                    </a>
                    <button class="ui right attached negative button centered"
                            onclick="showModal(${i.id},'${i.name}')">Xóa
                    </button>
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

<jsp:include page="footer.jsp"/>
<jsp:include page="../datatable.jsp"/>
<script type="text/javascript">
    function showModal(id, name) {
        $('#usernamep').html('Bạn có chắc chắn xóa sản phẩm "' + name + '"')
        // $('#delbtn').onclick = document.location.href('admin/account/delete/' + id);
        document.getElementById('delbtn').setAttribute("href", 'admin/product/delete/' + id);
        $('#deleteconfirm').modal('show')
        //    .modal('setting', 'transition', 20)
    }
</script>
</body>
</html>