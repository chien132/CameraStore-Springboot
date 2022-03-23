<%@ page pageEncoding="utf-8" %>
<%@ taglib
        uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>Đăng nhập</title>
    <style>
        body > .grid {
            height: 100%;
        }

        .column {
            max-width: 25% !important;
        }

        .error {
            font-size: 1rem;
            color: red;
            text-align: left;
            width: 100%;
        }
    </style>

</head>

<body id="homelogin">
<jsp:include page="header.jsp"/>
<div id="loaderdimmer" class="ui dimmer">
    <div class="ui massive text loader">Đang kiểm tra</div>
</div>
<p></p>
<p></p>
<p></p>
<div class="ui middle aligned center aligned grid">
    <div class="column ui form">
        <form:form action="login" modelAttribute="account" class="ui form">
            <div class="ui stacked secondary segment">
                <h2 class="ui image header">
                    <div class="content">Đăng nhập</div>
                </h2>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <form:input type="text" path="username" placeholder="Enter username"/>
                    </div>
                    <i class="error">
                        <form:errors path="username"></form:errors>
                    </i>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <form:input path="password" value="${account.password}" type="password"
                                    placeholder="Enter password"/>
                    </div>
                    <i class="error">
                        <form:errors path="password"></form:errors>
                    </i>
                </div>
                <button class="ui fluid large teal submit button">Đăng nhập</button>
            </div>

            <div class="ui error message"></div>
        </form:form>

        <div class="ui large message">
            Bạn chưa có tài khoản?
            <a href="register"><i class="edit outline icon"></i> Đăng ký</a>
        </div>
        <button onclick="$('#passwordmodal').modal('show')" style="background-color: #ffffcd"
                class="ui fluid large button">Quên mật khẩu?
        </button>
    </div>
</div>
<div class="ui tiny modal" id="passwordmodal">
    <div class="header">Nhập username của bạn:</div>
    <div class="content">
        <form action="/requestpassword" method="post">
            <div class="ui form field"><input class="form-control" type="text" name="username"
                                              required="true">
            </div>
            <button style="margin: 1vw;margin-right: 0px" class="right floated ui approve blue large button"> Gửi email
                xác nhận
            </button>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script>
    $('#passwordmodal form').submit(function (e) {
        $('#loaderdimmer').addClass("active");
        $('#passwordmodal').modal('hide');
    })
    $(document).ready(function () {
        $(".ui.form").form({
            fields: {
                username: {
                    identifier: "username",
                    rules: [{
                        type: "empty",
                        prompt: "Hãy nhập username",
                    },],
                },
                password: {
                    identifier: "password",
                    rules: [{
                        type: "empty",
                        prompt: "Hãy nhập mật khẩu",
                    },
                        {
                            type: "length[3]",
                            prompt: "Mật khẩu phải có ít nhất 3 ký tự",
                        },
                    ],
                },
            },
        });
    });
</script>
</body>

</html>