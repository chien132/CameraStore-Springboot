<%@ page pageEncoding="utf-8" %>
<%@ taglib
        uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>Đặt lại mật khẩu</title>
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
<div class="ui middle aligned center aligned grid">
    <div class="column ui form">
        <form:form action="resetpassword" modelAttribute="account">
            <div class="ui stacked secondary segment">
                <h2 class="ui image header">
                    <div class="content">Đặt lại mật khẩu</div>
                    <form:input type="number" path="id" hidden="true"/>
                </h2>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <form:input id="pass1" type="password" path="password" value="" placeholder="Nhập mật khẩu"/>
                    </div>
                    <i class="error">
                        <form:errors path="password"></form:errors>
                    </i>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input id="pass2" name="passwordconfirm" type="password"
                               placeholder="Xác nhận mật khẩu"/>
                    </div>

                </div>
                <button id="submitbtn" class="ui fluid large teal submit button">Đặt lạt mật khẩu</button>
            </div>

            <div class="ui error message"></div>
        </form:form>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script>
    $(document).ready(function () {
        $('#pass1').val("")
        $('#submitbtn').click(function (e) {
            if ($('#pass1').val() !== $('#pass2').val()) {
                event.preventDefault();
                // alert('Mật khẩu không trùng khớp')
                $('.ui.form .error').html('Mật khẩu không trùng khớp')
            }
        });


        $(".ui.form").form({
            fields: {
                passwordconfirm: {
                    identifier: "passwordconfirm",
                    rules: [{
                        type: "empty",
                        prompt: "Hãy nhập mật khẩu lần 2",
                    },
                        {
                            type: "length[3]",
                            prompt: "Mật khẩu phải có ít nhất 3 ký tự",
                        },
                    ],
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