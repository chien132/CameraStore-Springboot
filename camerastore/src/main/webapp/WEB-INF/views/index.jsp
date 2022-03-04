<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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

<div class="spacer"></div>

<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Monthly Specials</h2>
        </div>
    </div>
</div>

<div class="spacer"></div>

<!-- cards -->
<jsp:include page="filter.jsp"/>
<div class="ui container bg_rgba">
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
                    <%--                <td><img style="max-width: 33px;" alt=""--%>
                    <%--                         src="resources/images/avatar/${i.username}.png"></td>--%>
                <td>${i.id}</td>
                <td>${i.name}</td>
                    <%--                <td>${i.cmnd}</td>--%>
                    <%--                <td>${i.dienThoai}</td>--%>
                    <%--                <td>${i.email}</td>--%>
                    <%--                <td>${i.role.name}<c:if test="${i.role.id==1}"> #${i.chuTro.id}</c:if>--%>
                    <%--                    <c:if test="${i.role.id==2}"> #${i.khachThue.id}</c:if></td>--%>
                    <%--                <td>${i.ngayDangKy}.</td>--%>
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
        <tfoot style="text-align: center;">
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
        </tfoot>
    </table>

    <div class="ui four column grid">
        <!-- <div class="row"> -->
        <div class="column">
            <div class="ui card">
                <div class="image">
                    <a class="ui red right ribbon label">-10%</a>
                    <img src="resources\images\product\p1\p1.jpg"/>
                </div>
                <div class="content">
                    <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
                    <div class="description">
                        Ước gì có một em
                    </div>
                </div>
                <div class="extra content">
                    <a class="ui teal tag label">26.000.000đ</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="ui card">
                <div class="image">
                    <a class="ui red right ribbon label">-10%</a>
                    <img src="resources\images\product\p1\p1.jpg"/>
                </div>
                <div class="content">
                    <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
                    <div class="description">
                        Ước gì có một em
                    </div>
                </div>
                <div class="extra content">
                    <a class="ui teal tag label">21.000.000đ</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="ui card">
                <div class="image">
                    <a class="ui red right ribbon label">-10%</a>
                    <img src="resources\images\product\p1\p1.jpg"/>
                </div>
                <div class="content">
                    <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
                    <div class="description">
                        Ước gì có một em
                    </div>
                </div>
                <div class="extra content">
                    <a class="ui teal tag label">21.000.000đ</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="ui card">
                <div class="image">
                    <a class="ui red right ribbon label">-10%</a>
                    <img src="resources\images\product\p1\p1.jpg"/>
                </div>
                <div class="content">
                    <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
                    <div class="description">
                        Ước gì có một em
                    </div>
                </div>
                <div class="extra content">
                    <a class="ui teal tag label">21.000.000đ</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="ui card">
                <div class="image">
                    <a class="ui red right ribbon label">-10%</a>
                    <img src="resources\images\product\p1\p1.jpg"/>
                </div>
                <div class="content">
                    <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
                    <div class="description">
                        Ước gì có một em
                    </div>
                </div>
                <div class="extra content">
                    <a class="ui teal tag label">21.000.000đ</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="ui card">
                <div class="image">
                    <a class="ui red right ribbon label">-10%</a>
                    <img src="resources\images\product\p1\p1.jpg"/>
                </div>
                <div class="content">
                    <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
                    <div class="description">
                        Ước gì có một em
                    </div>
                </div>
                <div class="extra content">
                    <a class="ui teal tag label">21.000.000đ</a>
                </div>
            </div>
        </div>
        <!-- </div> -->

    </div>
</div>

<div class="spacer"></div>

<p>images from Mrprice.com website</p>
<jsp:include page="footer.jsp"/>
</body>

</html>