<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <base href="${pageContext.servletContext.contextPath}/">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>Camera Store</title>
    <!-- <link
        href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100'
        rel='stylesheet' type='text/css'> -->

    <%--    <script src="resources/semantic/jquery-3.1.1.min.js"--%>
    <%--            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>--%>
    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>
    <%--    <link rel="stylesheet" type="text/css" href="resources/datatables/datatables.min.css"/>--%>


    <style>
        html {
            /*position: relative;*/
            min-height: 100%;
            /*height: unset;*/
        }

        #homelogin {
            background: url(resources/images/fujibg.jpg) center top no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            background-attachment: fixed;
            max-height: 98%;
        }

        .spacer {
            height: 50px;
        }

        .imgrad {
            max-width: 1.5vw;
        }

        .bg_rgba {
            background-color: rgb(255, 255, 255);
            background-blend-mode: lighten;
            /* width: 200px; */
            /* height: 200px; */
            /* border: 1px solid black; */
            border-radius: 10px;
            padding: 1vh;
        }

        @media only screen and (min-width: 1200px) {
            .ui.container {
                width: 95%;
                margin-left: auto !important;
                margin-right: auto !important;
            }
        }

        tr.even {
            background-color: #fffaf1;
        }

        tr:hover {
            transition-duration: 300ms;
            background-color: #b4eeff;
        }
    </style>
</head>

<body>
<div class="ui huge top fixed blue menu">

    <img src="resources/images/logodark.png" style="max-height: 5vh; margin-left: 8vw;"/>

    <a href="admin/index" class="item">Tổng quan</a>
    <div class="ui simple dropdown item">
        Tài khoản
        <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item" href="/admin/account/view">Danh sách</a>
            <a class="item" href="/admin/account/add">Thêm mới</a>
        </div>
    </div>
    <div class="ui simple dropdown item">
        Sản phẩm
        <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item" href="/admin/product/view">Danh sách</a>
            <a class="item" href="/admin/product/add">Thêm mới</a>
        </div>
    </div>
    <div class="ui simple dropdown item">
        Phân loại & Hãng sản xuất
        <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item" href="/admin/catebrand/view">Danh sách</a>
            <a id="addcatelink" class="item" href="/admin/catebrand/addcate">Thêm phân loại</a>
            <a id="addbrandlink" class="item" href="/admin/catebrand/addbrand">Thêm hãng sản xuất</a>
        </div>
    </div>
    <a href="admin/order/viewall" class="item">Đơn hàng</a>
    <%--    <div class="ui simple dropdown item">--%>
    <%--        Đơn hàng--%>
    <%--        <i class="dropdown icon"></i>--%>
    <%--        <div class="menu">--%>
    <%--            <a class="item" href="/admin/order/viewall">Danh sách</a>--%>
    <%--            <a class="item" href="/admin/order/add">Thêm mới</a>--%>
    <%--        </div>--%>
    <%--    </div>--%>


    <div class="right menu">
        <%--        <div class="item ui pointing dropdown link">--%>
        <%--            <i class="envelope outline icon"></i>--%>
        <%--            <i class="dropdown icon"></i>--%>
        <%--            <div class="menu">--%>
        <%--                <a class="item">Thong bao 1</a>--%>
        <%--                <a class="item">Thong bao 2</a>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <div class="item ui pointing dropdown link">
                <span class="text"><img style="max-width: 1.5vw" src=${curaccount.photo}/>
                    ${curaccount.username}</span>
            <i class="dropdown icon"></i>
            <div class="menu">
                <a href="logout" class="item">Đăng xuất</a>

                <%--                <div class="item">--%>
                <%--                    <i class="dropdown left icon"></i>--%>
                <%--                    <span class="text">Menu</span>--%>
                <%--                    <div class="menu">--%>
                <%--                        <div class="item">1</div>--%>
                <%--                        <div class="item">2</div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>
</div>
</body>

</html>