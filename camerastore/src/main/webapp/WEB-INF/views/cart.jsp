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

        .ui.right.floated.teal.tag.label, .ui.orange.right.ribbon.label {
            font-size: 1.1rem;
        }

        .overflowcart {
            overflow: scroll;
            max-height: 100%;
        }

        .Cart-Items2 {
            margin: auto;
            /* width: 90%; */
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            <h2 style="color: white;">Giỏ hàng</h2>
        </div>
    </div>
</div>

<div class="spacer"></div>

<!-- cards -->
<%--<jsp:include page="filter.jsp"/>--%>
<div class="ui container">
    <div class="ui two column grid">
        <div class="eight wide column" style="height: 80vh">
            <div class="ui segment overflowcart">
                <div class="Header">
                    <h1>Giỏ hàng</h1>
                    <h5 class="Action"><a class="mycustoma" href="/cart/deleteall"> Xóa tất cả</a></h5>
                </div>
                <div>
                    <c:forEach items="${cartitems}" var="i">
                        <%--                            <a class="item"><img style="max-width: 2vh;object-fit: scale-down"--%>
                        <%--                                                 src="${i.product.image}">${i.amount}x ${i.product.name}</a>--%>
                        <div class="Cart-Items2">
                            <div class="image-box">
                                <img src="${i.product.image}" style="height:50px"/>
                            </div>
                            <div class="about">
                                <h3 class="title">${i.product.name}</h3>
                                    <%--                <h3 class="subtitle">250ml</h3>--%>
                            </div>
                            <div class="counter">
                                <a class="mycustoma" href="/cart/additem/${i.product.id}/-1">
                                    <div class="btn">-</div>
                                </a>
                                <div class="count">${i.amount}</div>
                                <a class="mycustoma" href="/cart/additem/${i.product.id}/1">
                                    <div class="btn">+</div>
                                </a>
                            </div>
                            <div class="prices">
                                <div class="amount"><f:formatNumber type="currency" currencySymbol=""
                                                                    maxFractionDigits="0">${i.product.price*(100-i.product.discount)/100}</f:formatNumber>đ
                                </div>
                                <div class="save"><u>Tiết kiệm <f:formatNumber type="currency" currencySymbol=""
                                                                               maxFractionDigits="0">${i.product.price*(i.product.discount)/100}</f:formatNumber>đ</u>
                                </div>
                                <div class="remove"><u><a class="mycustoma" href="/cart/deleteitem/${i.id.productid}">
                                    Xóa</a></u></div>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </div>

                <%--    <hr>--%>
                <div class="actions">
                    <%--        <div class="total">--%>
                    <div class="description">
                        <div>
                            <div class="Subtotal">Tổng</div>
                            <div class="items">${cartcount} mặt hàng</div>
                        </div>
                        <div class="total-amount"><f:formatNumber type="currency" currencySymbol=""
                                                                  maxFractionDigits="0">${cartcountmoney}</f:formatNumber>đ
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="eight wide column ui segment bg_rgba overflowcart">
            <div class="ui four column grid">
                <div class="ui big green button">Thanh toán</div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>

</html>