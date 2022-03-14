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


    </style>
</head>

<body id="homelogin">
<jsp:include page="header.jsp"/>
<div class="spacer"></div>

<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Đơn hàng ${order.id}</h2>
        </div>
    </div>
</div>


<!-- cards -->
<%--<jsp:include page="filter.jsp"/>--%>
<div class="ui container">
    <div class="ui two column grid segment">
        <div class="eight wide column">
            <%--            style="height: 80vh"--%>
            <div class="ui segment">
                <div class="Header">
                    <h1>Giỏ hàng</h1>
                    <div class="items">${order.totalAmount} mặt hàng</div>
                </div>
                <div style="overflow:scroll;height:62vh;padding-right:1vw;">
                    <c:forEach items="${order.orderDetails}" var="i">
                        <%--                            <a class="item"><img style="max-width: 2vh;object-fit: scale-down"--%>
                        <%--                                                 src="${i.product.image}">${i.amount}x ${i.product.name}</a>--%>
                        <div class="Cart-Items2">
                            <div class="image-box">
                                <img src="${i.product.image}" style="height:50px"/>
                            </div>
                            <div class="about">
                                <h3 class="title">${i.product.name}</h3>
                                <h3 class="subtitle" style="color: #0e8c8c">
                                    <div style="color: #0e8c8c"><f:formatNumber type="currency" currencySymbol=""
                                                                                maxFractionDigits="0">
                                        ${i.price}</f:formatNumber>đ
                                    </div>
                                </h3>
                            </div>
                            <div class="counter">
                                <div class="count">${i.amount}</div>
                            </div>
                            <div class="prices">
                                <div class="amount">
                                    <div><f:formatNumber type="currency"
                                                         currencySymbol=""
                                                         maxFractionDigits="0">${i.price*i.amount}</f:formatNumber>đ
                                    </div>
                                </div>
                                <div class="save">
                                </div>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </div>

                <%--    <hr>--%>
                <div class="actions">
                    <%--        <div class="total">--%>
                    <div class="description">
                        <div class="total-value">
                            <div class="Subtotal">Tổng</div>
                            <div class="total-amount"><f:formatNumber type="currency" currencySymbol=""
                                                                      maxFractionDigits="0">${order.value}</f:formatNumber>đ
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="eight wide column" style="height: max-content">
            <form:form class="ui large form" modelAttribute="order">
                <div class="ui segment" style="font-size: inherit">
                    <form:input path="id" hidden="true"/> <%--Khong duoc xoa, de luu id luc save--%>
                    <div class="field">
                        <h3><i>Địa chỉ giao hàng:</i></h3>
                        <h3 class="ui blue header">${order.address}</h3>
                    </div>

                    <div class="field">
                        <h3><i>Họ tên người nhận:</i></h3>
                        <h3 class="ui blue header">${order.fullname}</h3>
                    </div>

                    <div class="field">
                        <h3><i>Điện thoại liên hệ:</i></h3>
                        <h3 class="ui blue header">${order.phone}</h3>
                    </div>

                    <div class="field">
                        <h3><i>Email:</i></h3>
                        <h3 class="ui blue header">${order.email}</h3>
                    </div>
                    <div class="field">
                        <div class="field">
                            <h3><i>Phương thức thanh toán:</i></h3>
                            <h3 class="ui blue header">${order.payonline?"Chuyển khoản MoMo":"Thanh toán khi nhận hàng"}</h3>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <h3><i>Trạng thái:</i></h3>
                            <h3 class="ui blue header">${order.confirmed?"Đã xác nhận":"Đang chờ xác nhận"}</h3>
                            <c:if test="${order.confirmed}">
                                <h3 class="ui blue header">${order.done?"Đã giao hàng":"Đang giao hàng"}</h3>

                            </c:if>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>