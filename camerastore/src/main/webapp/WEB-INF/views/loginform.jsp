<%@ page pageEncoding="utf-8"%> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title>Đăng nhập</title>
  <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css" />
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
  <script src="resources/semantic/semantic.min.js"></script>
  <style>
    body>.grid {
      height: 100%;
    }

    .column {
      max-width: 450px;
    }

    .error {
      color: red;
      text-align: left;
      width: 100%;
    }
  </style>
  <script>
    $(document).ready(function () {
      $(".ui.form").form({
        fields: {
          email: {
            identifier: "username",
            rules: [{
              type: "empty",
              prompt: "Hãy nhập username",
            }, ],
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
</head>

<body id="homelogin">
  <jsp:include page="header.jsp" />
  <div class="ui middle aligned center aligned grid">
    <div class="column">
      <form:form action="login" modelAttribute="account" class="ui large form">
        <div class="ui stacked secondary segment">
          <h2 class="ui image header">
            <div class="content">Đăng nhập</div>
          </h2>
          <div class="field">
            <div class="ui left icon input">
              <i class="user icon"></i>
              <form:input type="text" path="username" placeholder="Enter username" />
            </div>
            <i class="error">
              <form:errors path="username"></form:errors>
            </i>
          </div>
          <div class="field">
            <div class="ui left icon input">
              <i class="lock icon"></i>
              <form:input path="password" value="${account.password}" type="password" placeholder="Enter password" />
            </div>
            <i class="error">
              <form:errors path="password"></form:errors>
            </i>
          </div>
          <div class="ui fluid large teal submit button">Đăng nhập</div>
        </div>

        <div class="ui error message"></div>
      </form:form>

      <div class="ui message">
        Bạn chưa có tài khoản?
        <a href="register"> Đăng ký</a>
      </div>
    </div>
  </div>
</body>

</html>