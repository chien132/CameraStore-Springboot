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
    <script src="resources/semantic/jquery-3.6.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>
    <link rel="stylesheet" type="text/css" href="resources/datatables/datatables.min.css"/>
    <script type="text/javascript" src="resources/datatables/datatables.min.js"></script>
    <script src="resources/semantic/semantic.min.js" type="text/javascript"></script>
    <style>
        #homelogin {
            background: url(resources/images/fujibg.jpg) center top no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            background-attachment: fixed;
        }

        .spacer {
            height: 50px;
        }

        .imgrad {
            max-width: 1.5vw;
        }
    </style>
</head>

<body id="homelogin">
<div class="ui huge top fixed blue menu">

    <img src="resources/images/logodark.png" style="max-height: 5vh; margin-left: 8vw;"/>

    <a href="admin/index" class="item">Tổng quan</a>
    <div class="ui simple dropdown item">
        Tài khoản
        <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item" href="">Danh sách</a>
            <a class="item" href="">Thêm mới</a>
        </div>
    </div>
    <div class="ui simple dropdown item">
        Sản phẩm
        <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item" href="">Danh sách</a>
            <a class="item" href="">Thêm mới</a>
        </div>
    </div>


    <div class="right menu">
        <div class="item ui pointing dropdown link">
            <i class="envelope outline icon"></i>
            <i class="dropdown icon"></i>
            <div class="menu">
                <a class="item">Thong bao 1</a>
                <a class="item">Thong bao 2</a>
            </div>
        </div>
        <div class="item ui pointing dropdown link">
						<span class="text"><img style="max-width: 1.5vw" src=${curaccount.photo}/>
                            ${curaccount.username}</span>
            <i class="dropdown icon"></i>
            <div class="menu">
                <a class="item">Tài khoản</a>
                <a class="item">Đơn hàng</a>
                <a href="logout" class="item">Đăng xuất</a>

                <div class="item">
                    <i class="dropdown left icon"></i>
                    <span class="text">Menu</span>
                    <div class="menu">
                        <div class="item">1</div>
                        <div class="item">2</div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('.ui.dropdown')
                .dropdown();
        </script>
    </div>
</div>

<p></p>
<p></p>


</body>

</html>