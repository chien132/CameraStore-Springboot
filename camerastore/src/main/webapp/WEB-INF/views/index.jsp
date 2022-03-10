<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
            background-color: rgba(150, 150, 150, 0.5);
            background-blend-mode: lighten;
            /* width: 200px; */
            /* height: 200px; */
            /* border: 1px solid black; */
        }

        .ui.right.floated.teal.tag.label,
        .ui.orange.right.ribbon.label {
            font-size: 1.1rem;
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
            <h2 style="color: white;">Sản phẩm</h2>
        </div>
    </div>
</div>

<div class="spacer"></div>

<!-- cards -->
<%--<jsp:include page="filter.jsp"/>--%>
<div class="ui container ">

    <jsp:include page="filter.jsp"/>

    <div class="ui two column grid">
        <div class="four wide column"></div>
        <div class="twelve wide column bg_rgba">
            <div class="ui four column grid">
                <!-- <div class="row"> -->
                <c:forEach var="p" items="${products.content}">
                    <div class="column">
                        <div class="ui card">
                            <div class="image">
                                <c:if test="${p.discount!=0}">
                                    <div class="ui orange right ribbon label">-${p.discount}%</div>
                                </c:if>
                                <img style="max-height: 18vh;object-fit: scale-down" src=${p.image}/>
                            </div>
                            <div class="content">
                                <a class="header">${p.name}</a>
                                    <%--                        <div class="description"> ${p.description} </div>--%>
                            </div>
                            <div class="extra content">
                                <a href="/cart/additem/${p.id}/1?ret=index" class="ui right floated teal tag label">
                                    <f:formatNumber maxFractionDigits="0" type="currency" currencySymbol=""
                                                    value="${p.price}"/> ₫ </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>
    </div>
</div>

<div class="spacer"></div>

<jsp:include page="footer.jsp"/>
</body>

</html>