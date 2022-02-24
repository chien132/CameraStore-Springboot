<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>Đăng ký</title>

	<base href="${pageContext.servletContext.contextPath}/">
	<!-- <script src="resources/js/jquery-3.6.0.js" type="text/javascript"></script> -->
	<link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css">
	<script src="resources/semantic/semantic.min.js" type="text/javascript"></script>
	<style type="text/css">
		body>.grid {
			height: 100%;
		}

		.column {
			max-width: 550px;
		}
	</style>

</head>

<body id="homelogin">
	<jsp:include page="header.jsp" />
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<form:form class="ui large form" action="register" modelAttribute="account">
				<div class="ui stacked segment">
					<h2 class="ui big"> <i class="signup icon"></i> Tạo tài khoản </h2>
					<div class="field">
						<label style="float: left;">Tài khoản <b style="color: red;">*</b></label>
						<div class="ui left icon input">
							<i class="user icon"></i>
							<form:input path="username" value="${user.username}" type="text" placeholder="Tài khoản" />
						</div>
						<i>
							<form:errors style="color: red;font-size: 15px;" path="username" /></i>
					</div>

					<div class="field">
						<label style="float: left;">Mật khẩu <b style="color: red;">*</b></label>
						<div class="ui left icon input">
							<i class="lock icon"></i>
							<form:input id="password" path="password" value="${user.password}" type="password"
								placeholder="Mật khẩu" />
							<i class="lock icon"></i>
							<!-- <input name="repassword" value="${user.password}" type="password"
								placeholder="Nhập lại mật khẩu"> -->
						</div>
						<i>
							<form:errors style="color: red;font-size: 15px;" path="password" /></i>
					</div>

					<div class="field">
						<label style="float: left;">Họ tên </label>
						<div class="ui left input">
							<form:input path="fullname" type="text" placeholder="Họ tên" />
						</div>
						<i>
							<form:errors style="color: red;font-size: 15px;" path="fullname" /></i>
					</div>


					<div class="field">
						<label style="float: left;">Số điện thoại</label>
						<div class="ui left input">
							<form:input path="phone" type="text" placeholder="SĐT" />
						</div>
						<i>
							<form:errors style="color: red;font-size: 15px;" path="phone" /></i>
					</div>

					<div class="field">
						<label style="float: left;">Email</label>
						<div class="ui left input">
							<form:input path="email" value="${user.email}" type="email" placeholder="Email" />
						</div>
						<i>
							<form:errors style="color: red;font-size: 15px;" path="email" /></i>
					</div>


					<c:if test="${message!=null}">
						<div style="color: red; font: italic;">${message}</div>
					</c:if>
					<button class="ui fluid large teal submit button">Tạo tài khoản</button>
				</div>
			</form:form>
			<div class="card-footer text-center" style="margin-top: 5px">
				<div class="ui message">
					Đã có tài khoản? <a href="login"> Đăng nhập</a>
				</div>
			</div>
		</div>
	</div>
</body>

</html>