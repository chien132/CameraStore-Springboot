<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>${product.name} - CameraStore</title>
    <jsp:include page="header.jsp"/>
    <style>
        body {
            max-height: 98%;
        }

        .ui.vertical.stripe {
            /*padding: 8em 0em;*/
        }

        .ui.vertical.stripe h3 {
            font-size: 2em;
        }

        .ui.vertical.stripe .button + h3,
        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe .floated.image {
            clear: both;
        }

        .ui.vertical.stripe p {
            font-size: 1.2em;
        }

    </style>
</head>
<div class="spacer"></div>
<div class="pusher">
    <div class="ui vertical stripe segment">
        <div class="ui middle aligned stackable grid container">
            <div class="row">
                <div class="eight wide right floated column image">
                    <div class="ui massive breadcrumb">
                        <a href="index?category=${product.category.id}&brand=${product.brand.id}"
                           class="section">${product.category.name} ${product.brand.name}</a>
                        <i class="right chevron icon divider"></i>
                        <div class="active section">${product.name}</div>
                    </div>

                    <img onclick="$('#imagemodal').modal('show')" src="${product.image}"/>
                </div>
                <div class="eight wide column">
                    <h3 class="ui header">Thông số kỹ thuật</h3>
                    <%--                    <p>--%>
                    ${product.description}
                    <c:if test="${product.quantity>0}">
                        <div class="ui large success icon message">
                            <i class="check circle outline icon"></i>
                            <div class="content">
                                <div class="header">Còn lại ${product.quantity} sản phẩm</div>
                                    <%--                                <p>Example description</p>--%>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${product.quantity==0}">
                        <div class="ui icon large error message">
                            <i class="attention circle icon"></i>
                            <div class="content">
                                <div class="header">Sản phẩm đang tạm hết hàng</div>
                                    <%--                                <p>Example description</p>--%>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div class="center aligned eight wide column bordered rounded">
                    <div class="ui statistic"><c:if test="${product.discount!=0}">
                        <div class="ui teal right ribbon label"><h4>-${product.discount}%</h4></div>
                    </c:if>
                        <div class="value">
                            <f:formatNumber type="currency" currencySymbol=""
                                            maxFractionDigits="0">${product.price*(100-product.discount)/100}</f:formatNumber>
                            vnđ
                        </div>
                    </div>
                </div>
                <div class="center aligned eight wide column bordered rounded">
                    <div class="ui right action huge input">
                        <c:if test="${product.quantity>0}">
                            <button class="ui teal labeled icon huge button"
                                    onclick="additemHandler()">
                                <i class="cart icon"></i> Mua ngay
                            </button>
                            <input id="amountinput" type="number" value="1" min="1" max="${product.quantity}">
                        </c:if>
                    </div>
                </div>

            </div>
        </div>
        <div class="ui modal large" id="imagemodal">
            <img class="ui image" src="${product.image}"/>
        </div>
    </div>
    <%--    <div class="ui vertical stripe quote segment">--%>
    <%--        <div class="ui equal width stackable internally celled grid">--%>
    <%--            <div class="center aligned row">--%>
    <%--                <div class="column">--%>
    <%--                    <h3>"What a Company"</h3>--%>
    <%--                    <p>That is what they all say about us</p>--%>
    <%--                </div>--%>
    <%--                <div class="column">--%>
    <%--                    <h3>"I shouldn't have gone with their competitor."</h3>--%>
    <%--                    <p>--%>
    <%--                        <img class="ui avatar image" src="${curaccount.photo}"/>--%>
    <%--                        <b>Nan</b> Chief Fun Officer Acme Toys--%>
    <%--                    </p>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>


</div>
<jsp:include page="footer.jsp"/>
<script>
    function additemHandler() {
        var amount = $('#amountinput').val();
        window.location.href = "/cart/additem/${product.id}/" + amount + "?ret=product/${product.id}";
    }
</script>
</body>
</html>