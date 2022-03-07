<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Quản lý sản phẩm</title>
    <%--    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>--%>
    <%--    <script src="resources/semantic/jquery-3.1.1.min.js"--%>
    <%--            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>--%>
    <%--    <script src="resources/semantic/semantic.min.js"></script>--%>
    <jsp:include page="header.jsp"/>
</head>
<body id="homelogin">

<div class="spacer"></div>


<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h1 style="color: white;">
                <c:if test="${action=='add'}">Thêm sản phẩm</c:if>
                <c:if test="${action=='edit'}">Cập nhật sản phẩm</c:if>
            </h1>
        </div>
    </div>
</div>

<div class="spacer"></div>

<div class="ui container" style="background-color: rgba(255,255,255,0.2);">

    <div class="ui grid" style="width: 100%; margin-top: 5px">
        <div class="six wide column">s
            <img onclick="$('#imageinput').click()" id="viewimage"
                 style="max-width: -webkit-fill-available; max-height: 70vh;object-fit: contain"
                 src="${product.image}"/>
        </div>
        <div class="ten wide centered column">

            <form:form class="ui large form"
                       action="admin/product/${action}" modelAttribute="product"
                       enctype="multipart/form-data" method="post">
                <div class="ui segment" style="font-size: inherit">

                    <div class="field">
                        <label style="float: left;">Hình ảnh</label>
                        <div class="ui left input">
                            <input id="imageinput" onchange="readURL(this,'${product.image}');" name="photoinput"
                                   type="file" accept="image/*"
                                   class="form-control" title="Chọn một ảnh"/>
                            <form:input path="image" hidden="true"/>
                        </div>
                    </div>

                    <div class="field"><i class="user icon"></i>
                        <label>Tên sản phẩm<b
                                style="color: red;">*</b></label>
                        <div class="ui left input">
                            <form:input path="name" value="${product.name}"
                                        type="text" placeholder="Tên sản phẩm"/>
                            <i><form:errors style="color: red;font-size: 15px;"
                                            path="name"/></i>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Giá tiền<b
                                style="color: red;">*</b></label>
                        <div class="ui left input">
                            <!-- 	<i class="lock icon"></i> -->
                            <form:input path="price" value="${product.price}"
                                        type="number" min="0" step="10000" placeholder="Giá tiền"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="price"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Mô tả </label>
                        <div class="ui left input">
                            <form:textarea path="description" type="text" placeholder="Mô tả"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="description"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Giảm giá </label>
                        <div class="ui left input">
                            <form:input path="discount" type="number" min="0" max="100" placeholder="Giảm giá"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="discount"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Số lượng tồn</label>
                        <div class="ui left input">
                            <form:input path="quantity" value="${product.quantity}" type="number" min="0" step="1"
                                        placeholder="Số lượng tồn"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="quantity"/>
                        </div>
                    </div>
                    <button class="ui fluid large teal submit button">
                        <c:if test="${action=='add'}">Thêm</c:if>
                        <c:if test="${action=='edit'}">Cập nhật</c:if>
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    "use strict";--%>

<%--    function NumericInput(inp, locale) {--%>
<%--        var numericKeys = '0123456789';--%>

<%--        // restricts input to numeric keys 0-9--%>
<%--        inp.addEventListener('keypress', function (e) {--%>
<%--            var event = e || window.event;--%>
<%--            var target = event.target;--%>

<%--            if (event.charCode == 0) {--%>
<%--                return;--%>
<%--            }--%>

<%--            if (-1 == numericKeys.indexOf(event.key)) {--%>
<%--                // Could notify the user that 0-9 is only acceptable input.--%>
<%--                event.preventDefault();--%>
<%--                return;--%>
<%--            }--%>
<%--        });--%>

<%--        // add the thousands separator when the user blurs--%>
<%--        inp.addEventListener('blur', function (e) {--%>
<%--            var event = e || window.event;--%>
<%--            var target = event.target;--%>

<%--            var tmp = target.value.replace(/,/g, '');--%>
<%--            var val = Number(tmp).toLocaleString(locale);--%>

<%--            if (tmp == '') {--%>
<%--                target.value = '';--%>
<%--            } else {--%>
<%--                target.value = val;--%>
<%--            }--%>
<%--        });--%>

<%--        // strip the thousands separator when the user puts the input in focus.--%>
<%--        inp.addEventListener('focus', function (e) {--%>
<%--            var event = e || window.event;--%>
<%--            var target = event.target;--%>
<%--            var val = target.value.replace(/[,.]/g, '');--%>

<%--            target.value = val;--%>
<%--        });--%>
<%--    }--%>

<%--    // var number = new NumericInput(document.getElementById('price'));--%>
<%--    var text = new NumericInput(document.getElementById('price'));--%>
<%--    var textDe = new NumericInput(document.getElementById('price'));--%>
<%--</script>--%>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>