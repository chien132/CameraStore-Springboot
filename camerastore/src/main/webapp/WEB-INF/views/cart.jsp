<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>

<head>
    <%--    <title>Shopping Cart UI</title>--%>
    <link rel="stylesheet" type="text/css" href="resources/cartui/style.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
</head>

<body>
<div class="CartContainer ui modal" id="cartmodal">
    <div class="Header">
        <h3 class="Heading">Shopping Cart</h3>
        <h5 class="Action">Remove all</h5>
    </div>
    <div class="overflowcart">
        <c:forEach items="${cartitems}" var="i">
            <%--                            <a class="item"><img style="max-width: 2vh;object-fit: scale-down"--%>
            <%--                                                 src="${i.product.image}">${i.amount}x ${i.product.name}</a>--%>
            <div class="Cart-Items pad">
                <div class="image-box">
                    <img src="${i.product.image}" style={{ height="120px" }}/>
                </div>
                <div class="about">
                    <h3 class="title">${i.product.name}</h3>
                        <%--                <h3 class="subtitle">250ml</h3>--%>
                </div>
                <div class="counter">
                    <div class="btn">-</div>
                    <div class="count">${i.amount}</div>
                    <div class="btn">+</div>
                </div>
                <div class="prices">
                    <div class="amount"><f:formatNumber type="currency" currencySymbol=""
                                                        maxFractionDigits="0">${i.product.price*(100-i.product.discount)/100}</f:formatNumber>đ
                    </div>
                        <%--                <div class="save"><u>Save for later</u></div>--%>
                    <div class="remove"><u>Remove</u></div>
                </div>
            </div>
            <hr>
        </c:forEach>
    </div>

    <%--    <hr>--%>
    <div class="checkout">
        <div class="total">
            <div>
                <div class="Subtotal">Sub-Total</div>
                <div class="items">2 items</div>
            </div>
            <div class="total-amount">$6.18</div>
        </div>
        <button class="ui positive button">Checkout</button>
    </div>
</div>
</body>

</html>