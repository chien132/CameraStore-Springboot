<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Quản lý tài khoản</title>
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
                <c:if test="${action=='add'}">Thêm tài khoản</c:if>
                <c:if test="${action=='edit'}">Cập nhật tài khoản</c:if>
            </h1>
        </div>
    </div>
</div>

<div class="spacer"></div>

<div class="ui container" style="background-color: rgba(255,255,255,0.2);">

    <div class="ui grid" style="width: 100%; margin-top: 5px">
        <div class="six wide column">s
            <img class="ui huge rounded image" onclick="$('#imageinput').click()" id="viewimage"
                 style="max-width: -webkit-fill-available; max-height: 70vh;object-fit: contain" src=${account.photo}/>
        </div>
        <div class="ten wide centered column">

            <form:form class="ui large form"
                       action="admin/account/${action}" modelAttribute="account"
                       enctype="multipart/form-data" method="post">
                <div class="ui segment" style="font-size: inherit">

                    <div class="field">
                        <label style="float: left;">Avatar</label>
                        <div class="ui left input">
                            <input id="imageinput" onchange="readURL(this,'${account.photo}');" name="photoinput"
                                   type="file" accept="image/*"
                                   class="form-control" title="Chọn một ảnh"/>
                            <form:input path="photo" hidden="true"/>
                        </div>
                    </div>
                    <form:input path="id" hidden="true"/>
                    <div class="field"><i class="user icon"></i>
                        <label>Username<b
                                style="color: red;">*</b></label>
                        <div class="ui left input">

                            <c:if test="${action=='edit'}">
                                <form:input path="username" value="${account.username}"
                                            type="text" placeholder="Tài khoản" readonly="true"/>
                            </c:if>
                            <c:if test="${action=='add'}">
                                <form:input path="username" value="${account.username}"
                                            type="text" placeholder="Tài khoản" required="true"/>
                            </c:if>
                            <i><form:errors style="color: red;font-size: 15px;"
                                            path="username"/></i>
                        </div>
                    </div>

<%--                    <div class="field">--%>
<%--                        <label style="float: left;">Mật khẩu<b--%>
<%--                                style="color: red;">*</b></label>--%>
<%--                        <div class="ui left input">--%>
<%--                            <form:input path="password" value="${account.password}"--%>
<%--                                        type="password" placeholder="Mật khẩu" required="true" disabled="true"--%>
<%--                                        hidden="true"/>--%>
<%--                            <form:errors style="color: red;font-size: 15px;"--%>
<%--                                         path="password"/>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="field">
                        <label style="float: left;">Họ tên </label>
                        <div class="ui left input">
                            <form:input path="fullname" type="text" placeholder="Họ tên"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="fullname"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">SĐT </label>
                        <div class="ui left input">
                            <form:input path="phone" type="text" placeholder="SĐT"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="phone"/>
                        </div>
                    </div>

                    <div class="field">
                        <label style="float: left;">Email </label>
                        <div class="ui left input">
                            <form:input path="email" value="${account.email}" type="email"
                                        placeholder="Email address"/>
                            <form:errors style="color: red;font-size: 15px;"
                                         path="email"/>
                        </div>
                    </div>

                    <c:if test="${action=='add'}">
                        <div class="inline field">
                            <div class="ui toggle checkbox">
                                <input name="admincb" type="checkbox" tabindex="0" class="hidden">
                                <label>Admin</label>
                            </div>
                        </div>
                    </c:if>
                    <button class="ui fluid large teal submit button">
                        <c:if test="${action=='add'}">Thêm</c:if>
                        <c:if test="${action=='edit'}">Cập nhật</c:if>
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>