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
    <link rel="stylesheet" type="text/css" href="resources/datatables/datatables.min.css"/>
    <script type="text/javascript" src="resources/datatables/datatables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>
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
    </style>
</head>

<body>
<div class="ui huge top fixed blue menu">

    <img src="resources/images/logodark.png" style="max-height: 5vh; margin-left: 8vw;"/>

    <a href="index" class="item">Trang chủ</a>
    <div class="ui simple dropdown item">
        Phân loại
        <i class="dropdown icon"></i>
        <div class="menu">
            <c:forEach var="cate" items="${categories}">
                <a class="item" href="category/${cate.id}">${cate.name}</a>
            </c:forEach>
        </div>
    </div>
    <div class="ui simple dropdown item">
        Hãng sản xuất
        <i class="dropdown icon"></i>
        <div class="menu">
            <c:forEach var="brand" items="${brands}">
                <a class="item" href="brand/${brand.id}">${brand.name}</a>
            </c:forEach>
        </div>
    </div>


    <div class="ui search">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Tìm kiếm . . .">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>


    <div class="right menu">
        <c:choose>
            <c:when test="${curaccount==null}">
                <a href="login" class="item">Đăng nhập</a>
                <a href="register" class="item">Đăng ký</a>
            </c:when>
            <c:when test="${curaccount!=null}">
                <a class="item"><i class="opencart icon"> </i>Cart
                    <div class="ui green label"> 2</div>
                </a>

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

            </c:when>
        </c:choose>
    </div>
</div>

<p></p>
<p></p>


</body>

</html>