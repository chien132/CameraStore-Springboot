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
        <h1>Giỏ hàng</h1>
        <div class="items">${cartcount} mặt hàng</div>
        <a style="font-size: 1.3rem;color: #e83f3f" class="mycustoma" href="/cart/deleteall"> Xóa tất cả</a>
    </div>
    <div style="overflow:scroll;max-height:62vh">
        <c:forEach items="${cartitems}" var="i">
            <%--                            <a class="item"><img style="max-width: 2vh;object-fit: scale-down"--%>
            <%--                                                 src="${i.product.image}">${i.amount}x ${i.product.name}</a>--%>
            <div class="Cart-Items pad">
                <div class="image-box">
                    <img src="${i.product.image}" style="height:120px"/>
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
                    <div class="amount">
                        <c:if test="${i.product.discount==0}"><f:formatNumber type="currency"
                                                                              currencySymbol=""
                                                                              maxFractionDigits="0">${i.product.price}</f:formatNumber>đ
                        </c:if>
                        <c:if test="${i.product.discount!=0}">
                            <div style="text-decoration: line-through;color: gray"><f:formatNumber type="currency"
                                                                                                   currencySymbol=""
                                                                                                   maxFractionDigits="0">${i.product.price}</f:formatNumber>đ
                            </div>
                            <div style="text-decoration: wavy;"><f:formatNumber type="currency"
                                                                                currencySymbol=""
                                                                                maxFractionDigits="0">${i.product.price*(100-i.product.discount)/100}</f:formatNumber>đ
                            </div>
                        </c:if>
                    </div>

                    <div class="save">
                        <c:if test="${i.product.discount!=0}"><u style="color: #e32e32">-<f:formatNumber type="currency"
                                                                                                         currencySymbol=""
                                                                                                         maxFractionDigits="0">${i.product.price*(i.product.discount)/100}</f:formatNumber>đ</u>
                        </c:if>
                    </div>
                    <div class="remove"><u><a class="mycustoma" href="/cart/deleteitem/${i.id.productid}"> Xóa</a></u>
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
            <div>
                <div class="Subtotal">Tổng</div>
            </div>
            <div class="total-amount"><f:formatNumber type="currency" currencySymbol=""
                                                      maxFractionDigits="0">${cartcountmoney}</f:formatNumber>đ
            </div>
        </div>
        <c:if test="${cartcount>0}"><a href="/cart/view">
            <div class="ui big green button">Thanh toán</div>
        </a></c:if>
    </div>
</div>
<script>
    $(document).ready(function () {
        let alist = document.getElementsByClassName("mycustoma")
        for (let i = 0; i < alist.length; i++) {
            let prehref = alist[i].href;
            // console.log(i)
            // console.log(prehref)
            // prehref = prehref.substring(0, prehref.indexOf("?ret="));
            // console.log(prehref)
            alist[i].href = prehref + window.location.href.replace("http://localhost:8080/", "?ret=");
            // console.log(alist[i].href)
        }
    })
</script>
</body>

</html>