<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
</head>

<body id="homelogin">
<jsp:include page="header.jsp"/>
<style>
    @media only screen and (min-width: 1200px) {
        .ui.container {
            width: 95%;
            margin-left: auto !important;
            margin-right: auto !important;
        }
    }
</style>
<div class="spacer"></div>

<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Đơn hàng ${order.id}</h2>
        </div>
    </div>
</div>

<div class="ui container">
    <div class="ui two column grid segment">
        <div class="eight wide column">
            <%--            style="height: 80vh"--%>
            <div class="ui segment">
                <div class="Header">
                    <h1>Chi tiết đơn hàng</h1>
                    <div class="items">${order.totalAmount} mặt hàng</div>
                </div>
                <div style="overflow:scroll;height:62vh;padding-right:1vw;">
                    <c:forEach items="${order.orderDetails}" var="i">
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
                                <div class="count">x${i.amount}</div>
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
                <div class="ui statistic" style="width: 100%">
                    <div class="label">
                        Tổng
                    </div>
                    <div class="value">
                        <f:formatNumber type="currency" currencySymbol=""
                                        maxFractionDigits="0">${order.value}</f:formatNumber> vnđ
                    </div>
                </div>
                <%--                <div class="actions">--%>
                <%--                    <div class="description">--%>
                <%--                        <div class="total-value">--%>
                <%--                            <div class="Subtotal">Tổng</div>--%>
                <%--                            <div class="total-amount"><f:formatNumber type="currency" currencySymbol=""--%>
                <%--                                                                      maxFractionDigits="0">${order.value}</f:formatNumber>đ--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>

        </div>
        <div class="eight wide column" style="height: max-content">
            <div class="ui large form">
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
                            <c:choose>
                                <c:when test="${order.status=='denied'}">
                                    <h3 class="ui red header">${order.statusText}</h3>
                                </c:when>
                                <c:when test="${order.status=='done'}">
                                    <h3 class="ui green header">${order.statusText} </h3>
                                </c:when>
                                <c:otherwise>
                                    <h3 class="ui yellow header">${order.statusText}</h3>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${order.status=='delivering'}">
                            <button class="ui positive large button"
                                    onclick="$('#confirmmodal').modal('show')"><i class="check circle icon"></i>Đã nhận
                                được hàng
                            </button>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="ui tiny modal" id="confirmmodal">
    <div class="header"><i class="bell outline orange icon"></i>Xác nhận</div>
    <div class="content">
        <h3>Bạn đã nhận được đơn hàng này?</h3>
    </div>
    <div class="actions">
        <a href="order/confirm/${order.id}">
            <div class="ui approve large green button"><i class="check circle icon"></i>Xác nhận</div>
        </a>
        <%--        <div class="ui cancel blue button">Hủy</div>--%>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>