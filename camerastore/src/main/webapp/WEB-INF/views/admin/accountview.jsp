<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Trang cá nhân</title>
    <jsp:include page="header.jsp"/>
    <style>
        .ui.info.message button {
            position: absolute;
            right: 10px;
            top: 35%;
        }

        .ui.modal button {
            margin: 10px;
            margin-right: 0px;
        }

        .ui.segment.clearing button {
            font-family: Tahoma;
        !important;
        }
    </style>
</head>
<body id="homelogin">

<div class="spacer"></div>

<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h1 style="color: white;">
                Trang cá nhân
            </h1>
        </div>
    </div>
</div>

<div class="spacer"></div>

<div class="ui container" style="background-color: rgba(255,255,255,0.2);">

    <div class="ui grid" style="width: 100%; margin-top: 5px">
        <div class="six wide column">s
            <img class="ui huge rounded image" onclick="$('#imagemodal').modal('show')" id="viewimage"
                 style="max-width: -webkit-fill-available; max-height: 70vh;object-fit: contain"
                 src=${curaccount.photo}/>
        </div>
        <div class="ten wide centered column">


            <div class="ui segment" style="font-size: inherit">
                <div class="ui large form">
                    <div class="ui segment clearing">
                        <%--                        style="font-size: inherit"--%>
                        <%--                        <div class="ui hidden divider"></div>--%>
                        <div class="ui info message">

                            <div class="header"><h3>Username:</h3>
                                <h3>${curaccount.username}</h3>
                                <button class="circular ui blue button"
                                        onclick="edit('username','text','${curaccount.username}')">
                                    <i class="icon edit"></i> <b> Chỉnh sửa </b>
                                </button>
                            </div>


                        </div>

                        <div class="ui info message">
                            <div class="header"><h3>Họ tên:</h3></div>
                            <h3>${curaccount.fullname}</h3>
                            <button class="circular ui blue button"
                                    onclick="edit('fullname','text','${curaccount.fullname}')">
                                <i class="icon edit"></i> <b> Chỉnh sửa </b>
                            </button>
                        </div>

                        <div class="ui info message">
                            <div class="header"><h3>Số điện thoại:</h3></div>
                            <h3>${curaccount.phone}</h3>
                            <button class="circular ui blue button"
                                    onclick="edit('phone','text','${curaccount.phone}')">
                                <i class="icon edit"></i> <b> Chỉnh sửa </b>
                            </button>
                        </div>
                        <div class="ui info message">
                            <div class="header"><h3>Email:</h3></div>
                            <h3>${curaccount.email}</h3>
                            <button class="circular ui blue button"
                                    onclick="edit('email','email','${curaccount.email}')">
                                <i class="icon edit"></i> <b> Chỉnh sửa </b>
                            </button>
                        </div>
                        <div class="ui info message">
                            <div class="header"><h3>Địa chỉ:</h3></div>
                            <h3>${curaccount.address}</h3>
                            <button class="circular ui blue button"
                                    onclick="edit('address','text','${curaccount.address}')">
                                <i class="icon edit"></i> <b> Chỉnh sửa </b>
                            </button>
                        </div>
                        <button class="right floated circular ui blue button" style="margin-right: 1.5%"
                                onclick="edit('password','text','')">
                            <i class="icon edit"></i> <b> Đổi mật khẩu </b>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="ui tiny modal" id="editmodal">
    <div id="addmodalhheader" class="header"></div>
    <div class="content">
        <form id="editform" action="" method="post">
            <div class="ui form field"><input id="nameInput" class="form-control" type="text" name="name"
                                              required="true">
            </div>
            <button id="submitbtn" class="right floated ui approve green inverted large button"><i
                    class="save icon"></i> Lưu
            </button>
        </form>
    </div>
</div>
<div class="ui mini modal" id="imagemodal">
    <div class="header">Hãy chọn ảnh đại diện</div>
    <div class="content">
        <form action="/admin/account/myaccount/editavatar" enctype="multipart/form-data" method="post">
            <div class="ui form field"><input class="form-control" type="file" name="image" accept="image/*"
                                              required="true">
            </div>
            <button class="right floated ui approve green inverted large button"><i
                    class="save icon"></i> Lưu
            </button>
        </form>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    function edit(field, type, value) {
        $('#editform').prop("action", "admin/account/myaccount/edit" + field);
        $('#nameInput').prop("type", type);
        $('#nameInput').prop("value", value);
        if (field == 'username') {
            $('#addmodalhheader').html("Nhập username mới:");
        } else if (field == 'fullname') {
            $('#addmodalhheader').html("Nhập họ tên mới:");
        } else if (field == 'phone') {
            $('#addmodalhheader').html("Nhập số điện thoại mới:");
        } else if (field == 'email') {
            $('#addmodalhheader').html("Nhập email mới:");
        } else if (field == 'address') {
            $('#addmodalhheader').html("Nhập địa chỉ mới:");
        } else if (field == 'password') {
            $('#addmodalhheader').html("Nhập mật khẩu mới:");
            $('#nameInput').prop("type", "password");
        }
        $('#editmodal').modal('show');
    }
</script>
</html>