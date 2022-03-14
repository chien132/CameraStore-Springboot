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
            <h2 style="color: white;">Giỏ hàng</h2>
        </div>
    </div>
</div>


<!-- cards -->
<%--<jsp:include page="filter.jsp"/>--%>
<div class="ui container">
    <div class="ui two column grid segment" style="height: 85vh">
        <div class="eight wide column">
            <%--            style="height: 80vh"--%>
            <div class="ui segment">
                <div class="Header">
                    <h1>Giỏ hàng</h1>
                    <div class="items">${cartcount} mặt hàng</div>
                    <a style="font-size: 1.3rem;color: #e83f3f" class="mycustoma" href="/cart/deleteall"> Xóa tất cả</a>
                </div>
                <div style="overflow:scroll;height:62vh;padding-right:1vw;">
                    <c:forEach items="${cartitems}" var="i">
                        <%--                            <a class="item"><img style="max-width: 2vh;object-fit: scale-down"--%>
                        <%--                                                 src="${i.product.image}">${i.amount}x ${i.product.name}</a>--%>
                        <div class="Cart-Items2">
                            <div class="image-box">
                                <img src="${i.product.image}" style="height:50px"/>
                            </div>
                            <div class="about">
                                <h3 class="title">${i.product.name}</h3>
                                <h3 class="subtitle" style="color: #0e8c8c"><c:if
                                        test="${i.product.discount==0}"><f:formatNumber
                                        type="currency"
                                        currencySymbol=""
                                        maxFractionDigits="0">${i.product.price}</f:formatNumber>đ
                                </c:if>
                                    <c:if test="${i.product.discount!=0}">
                                        <div style="text-decoration: line-through;margin-top: -2vh;color: gray">
                                            <f:formatNumber
                                                    type="currency"
                                                    currencySymbol=""
                                                    maxFractionDigits="0">${i.product.price}</f:formatNumber>đ
                                        </div>
                                        <div style="padding-top: 1vh;color: #0e8c8c"><f:formatNumber type="currency"
                                                                                                     currencySymbol=""
                                                                                                     maxFractionDigits="0">${i.product.price*(100-i.product.discount)/100}</f:formatNumber>đ
                                        </div>
                                    </c:if></h3>
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
                                <div class="amount">
                                    <c:if test="${i.product.discount==0}"><f:formatNumber
                                            type="currency"
                                            currencySymbol=""
                                            maxFractionDigits="0">${i.product.price*i.amount}</f:formatNumber>đ
                                    </c:if>
                                    <c:if test="${i.product.discount!=0}">
                                        <div style="text-decoration: line-through;margin-top: -2vh;color: gray">
                                            <f:formatNumber
                                                    type="currency"
                                                    currencySymbol=""
                                                    maxFractionDigits="0">${i.product.price*i.amount}</f:formatNumber>đ
                                        </div>
                                        <div style="text-decoration: wavy;"><f:formatNumber type="currency"
                                                                                            currencySymbol=""
                                                                                            maxFractionDigits="0">${i.product.price*i.amount*(100-i.product.discount)/100}</f:formatNumber>đ
                                        </div>
                                    </c:if>
                                </div>
                                <div class="save"><c:if test="${i.product.discount!=0}"><u
                                        style="color: #e32e32">-<f:formatNumber type="currency"
                                                                                currencySymbol=""
                                                                                maxFractionDigits="0">${i.product.price*(i.product.discount)/100}</f:formatNumber>đ</u></c:if>
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
                        <div class="total-value">
                            <div class="Subtotal">Tổng</div>
                            <div class="total-amount"><f:formatNumber type="currency" currencySymbol=""
                                                                      maxFractionDigits="0">${cartcountmoney}</f:formatNumber>đ
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="eight wide column" style="height: max-content">
            <form:form class="ui large form"
                       action="order/${action}order" modelAttribute="order" method="post">
                <div class="ui segment" style="font-size: inherit">
                    <form:input path="id" hidden="true"/> <%--Khong duoc xoa, de luu id luc save--%>
                    <div class="field">
                        <label style="float: left;">Địa chỉ giao hàng<b
                                style="color: red;">*</b></label>
                        <div class="ui left input">
                            <form:input path="address"
                                        type="text" placeholder="Địa chỉ" required="true"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="address"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Họ tên người nhận</label>
                        <div class="ui left input">
                            <form:input path="fullname" type="text" placeholder="Họ tên" required="true"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="fullname"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Điện thoại liên lạc </label>
                        <div class="ui left input">
                            <form:input path="phone" type="text" placeholder="" required="true"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="phone"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Email </label>
                        <div class="ui left input">
                            <form:input path="email" type="email"
                                        placeholder="Email" required="true"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="email"/>
                        </div>
                    </div>
                    <c:if test="${action=='add'}">
                        <div class="grouped fields">
                            <label>Chọn phương thức thanh toán</label>
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input type="radio" name="payonlinecb" value="0" checked="checked">
                                    <label>Thanh toán khi nhận hàng</label>
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input type="radio" name="payonlinecb" value="1">
                                    <label>Chuyển khoản MoMo</label>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <button class="ui fluid large teal submit button">
                        <c:if test="${action=='add'}">Thanh toán</c:if>
                        <c:if test="${action=='edit'}">Cập nhật</c:if>
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>

</html>