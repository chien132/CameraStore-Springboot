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
    <%--    <link rel="stylesheet" type="text/css" href="resources/datatables/datatables.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>
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

        @media only screen and (min-width: 1200px) {
            .ui.container, .ui.grid.container {
                width: 90% !important;
                margin-left: auto !important;
                margin-right: auto !important;
            }
        }

        img.magnifier:hover {
            transform: scale(2.0);
            transition-duration: 300ms;
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
                <a class="item" href="index?category=${cate.id}">${cate.name}</a>
            </c:forEach>
        </div>
    </div>
    <div class="ui simple dropdown item">
        Hãng sản xuất
        <i class="dropdown icon"></i>
        <div class="menu">
            <c:forEach var="brand" items="${brands}">
                <a class="item" href="index?brand=${brand.id}">${brand.name}</a>
            </c:forEach>
        </div>
    </div>

    <form action="index">
        <div class="ui search">
            <div class="ui icon input">
                <input class="prompt" name="search" type="text" placeholder="Tìm kiếm . . .">
                <i class="search icon"></i>
            </div>
            <div class="results"></div>
        </div>
    </form>

    <div class="right menu">
        <c:choose>
            <c:when test="${curaccount==null}">
                <c:if test="${cartcount>0}">
                    <div class="item link" onclick="$('#cartmodal').modal('show')"><i class="shopping cart icon"> </i>Giỏ
                        hàng
                        <div class="ui green label"> ${cartcount}</div>
                    </div>
                </c:if>
                <a href="login" class="item"><i class="sign-in blue icon"></i>Đăng nhập</a>
                <a href="register" class="item"><i class="edit green outline icon"></i>Đăng ký</a>
            </c:when>
            <c:when test="${curaccount!=null}">
                <c:if test="${cartcount>0}">
                    <div class="item link" onclick="$('#cartmodal').modal('show')"><i class="shopping cart icon"> </i>Giỏ
                        hàng
                        <div class="ui green label"> ${cartcount}</div>
                    </div>
                </c:if>

                <div class="item ui pointing dropdown link">
						<span class="text"><img style="max-width: 1.5vw" src=${curaccount.photo}/>
                                ${curaccount.username}</span>
                    <i class="dropdown icon"></i>
                    <div class="menu">

                        <a href="account" class="item"><i class="user blue outline icon"></i>Tài khoản</a>
                        <a href="order/viewall" class="item"><i class="list alternate outline blue icon"></i>Đơn hàng</a>
                        <a href="logout" class="item"><i class="sign-out red icon"></i>Đăng xuất</a>

                            <%--                        <div class="item">--%>
                            <%--                            <i class="dropdown left icon"></i>--%>
                            <%--                            <span class="text">Menu</span>--%>
                            <%--                            <div class="menu">--%>
                            <%--                                <div class="item">1</div>--%>
                            <%--                                <div class="item">2</div>--%>
                            <%--                            </div>--%>
                            <%--                        </div>--%>
                    </div>
                </div>
            </c:when>
        </c:choose>
    </div>
</div>

<p></p>
<p></p>
<jsp:include page="cartmodal.jsp"/>

</body>

</html>