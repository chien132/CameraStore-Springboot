<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>Sản phẩm</title>
    <style>
        .bg_rgba {
            background-color: rgba(150, 150, 150, 0.5);
            background-blend-mode: lighten;
            border-radius: 15px;
        }

        .ui.right.floated.teal.tag.label,
        .ui.orange.right.ribbon.label {
            font-size: 1.1rem;
        }

        /*.content>.description{*/
        /*    max-lines: 1;text-overflow: ellipsis;*/
        /*    display: -webkit-box;*/
        /*    -webkit-line-clamp: 2; !* number of lines to show *!*/
        /*    line-clamp: 2;*/
        /*    -webkit-box-orient: vertical;*/
        /*}*/
    </style>
</head>

<body id="homelogin">
<jsp:include page="header.jsp"/>
<style>
    .ui.cards > .card {
        margin-left: 1vw;
    !important;
    }
</style>
<div class="spacer"></div>

<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Sản phẩm</h2>
        </div>
    </div>
</div>

<%--<div class="spacer"></div>--%>

<div class="ui container ">

    <jsp:include page="filter.jsp"/>

    <div class="ui two column grid">
        <div class="four wide column"></div>
        <div class="twelve wide column bg_rgba">
            <div class="ui link cards">
                <!-- <div class="row"> -->
                <c:forEach var="p" items="${products.content}">
                    <div class="ui card">
                        <div class="image">
                            <c:if test="${p.discount!=0}">
                                <div class="ui orange right ribbon label">-${p.discount}%</div>
                            </c:if>
                            <img onclick="location.href='product/${p.id}'" style="max-height: 20vh;object-fit: cover"
                                 src=${p.image}/>
                                <%--                            scale-down--%>
                        </div>
                        <div class="content">
                            <a href="product/${p.id}" class="header">${p.name}</a>
                            <div class="description">
                                <a href="index?category=${p.category.id}" class="date">${p.category.name} </a> <a
                                    href="index?brand=${p.brand.id}">${p.brand.name}</a>
                            </div>
                                <%--                            <div class="description"> ${p.description} </div>--%>
                        </div>
                        <div class="extra content">
                            <c:if test="${p.quantity>0}"><a href="/cart/additem/${p.id}/1?ret=index"
                                                            class="ui right floated teal tag label"><i
                                    class="cart plus icon"></i>
                                <f:formatNumber maxFractionDigits="0" type="currency" currencySymbol=""
                                                value="${p.price*(100-p.discount)/100}"/> ₫ </a></c:if>
                            <c:if test="${p.quantity==0}">
                                <div class="ui right floated grey tag label">Hết hàng</div>
                            </c:if>
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