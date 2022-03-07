<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <!-- <title>Đăng nhập</title> -->
    <%--  <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css" />--%>
    <%--  <script src="resources/semantic/jquery-3.6.0.min.js"--%>
    <%--    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>--%>
    <%--  <script src="resources/semantic/semantic.min.js"></script>--%>
    <style>
        .bg_rgba {
            background-color: rgba(150, 150, 150, 0.2);
            background-blend-mode: lighten;
            /* width: 200px; */
            /* height: 200px; */
            /* border: 1px solid black; */
        }
    </style>
</head>

<body id="homelogin">
<jsp:include page="header.jsp"/>
<div class="spacer"></div>


<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Monthly Specials</h2>
        </div>
    </div>
</div>


<!-- cards -->
<div class="ui container bg_rgba">
    <button class="positive ui button right floated">Positive Button</button>
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
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${products}">
            <tr>
                <td>${i.id}</td>
                <td><img style="max-width: 30px;" alt=""
                         src=${i.image}></td>
                <td>${i.name}</td>
                <td>${i.description}</td>
                <td><f:formatNumber type="currency"
                                    maxFractionDigits="0" currencySymbol="" value="${i.price}"/>₫
                </td>
                <td>${i.discount}</td>
                    <%--                <td>${i.role.name}<c:if test="${i.role.id==1}"> #${i.chuTro.id}</c:if>--%>
                    <%--                    <c:if test="${i.role.id==2}"> #${i.khachThue.id}</c:if></td>--%>
                <td>${i.category.name}</td>
                <td>${i.brand.name}</td>
                <td>${i.quantity}</td>
                <td>
                    <button class="ui left attached primary button">Sửa</button>
                    <button class="ui right attached negative button">Xóa</button>
                </td>
                    <%--                <td style="text-align: center;"><a--%>
                    <%--                        href="admin/editaccount/${i.username}.htm"><button--%>
                    <%--                        class="positive ui button"--%>
                    <%--                        style="color: white; font-size: 13px">Sửa</button></a> <c:if--%>
                    <%--                        test="${i.thongBao.size()==0}">--%>
                    <%--                    <a href="admin/deleteaccount/${i.username}.htm"><button--%>
                    <%--                            class="negative ui button"--%>
                    <%--                            style="color: white; font-size: 13px">Xóa</button></a>--%>
                    <%--                </c:if>--%>
                    <%--                    <c:if--%>
                    <%--                            test="${i.thongBao.size()>0}">--%>
                    <%--                        <a href="admin/deleteaccount/${i.username}.htm"><button--%>
                    <%--                                class="negative ui button"--%>
                    <%--                                style="color: white; font-size: 13px" disabled="disabled">Xóa</button></a>--%>
                    <%--                    </c:if>--%>
                    <%--                </td>--%>
            </tr>
        </c:forEach>

        </tbody>

    </table>

    <%--    <div class="ui four column grid">--%>
    <%--        <!-- <div class="row"> -->--%>
    <%--        <c:forEach var="p" items="${products}">--%>
    <%--            <div class="column">--%>
    <%--                <div class="ui card">--%>
    <%--                    <div class="image">--%>
    <%--                        <a class="ui red right ribbon label">${p.discount*100}%</a>--%>
    <%--                        <img src=${p.image}/>--%>
    <%--                    </div>--%>
    <%--                    <div class="content">--%>
    <%--                        <a class="header">${p.name}</a>--%>
    <%--                        <div class="description"> ${p.description} </div>--%>
    <%--                    </div>--%>
    <%--                    <div class="extra content">--%>
    <%--                        <a class="ui teal tag label"><f:formatNumber maxFractionDigits="0" type="currency"--%>
    <%--                                                                     currencySymbol="" value="${p.price}"/> ₫ </a>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </c:forEach>--%>
    <%--        <!-- </div> -->--%>

    <%--    </div>--%>
</div>

<div class="spacer"></div>

<jsp:include page="footer.jsp"/>
</body>

</html>