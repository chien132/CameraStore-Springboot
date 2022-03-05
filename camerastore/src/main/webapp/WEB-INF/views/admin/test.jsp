<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.servletContext.contextPath}/">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css"/>
    <script src="resources/semantic/jquery-3.6.0.min.js" type="text/javascript"></script>
    <%--    <script src="resources/semantic/jquery-3.1.1.min.js"--%>
    <%--            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>--%>
    <script src="resources/semantic/semantic.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="resources/datatables/datatables.min.css"/>

    <script type="text/javascript" src="resources/datatables/datatables.min.js"></script>
    <style>
        #homelogin {
            background: url(resources/images/fujibg.jpg) center top no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            background-attachment: fixed;
        }

        .spacer {
            height: 50px;
        }
    </style>
</head>
<body id="homelogin">
<div class="row">
    <div class="ui grid">
        <!-- BEGIN NAVBAR -->
        <div class="computer only row">
            <div class="column">
                <div class="ui top fixed menu navcolor">
                    <div class="left menu">
                        <div class="nav item">
                            <a class="red navtext" href="admin/index.htm">G trọ Việt Nam</a>
                        </div>
                    </div>
                    <div class="ui top pointing dropdown admindropdown link right item">
							<span class="clear navtext"><strong><i
                                    class="envelope outline icon"></i></strong></span> <i
                            class="dropdown icon navtext"></i>
                        <div class="menu">
                            <c:forEach var="thongbao" items="${thongbaoadmin}">
                                <div class="item">
                                    <a href="${pageContext.servletContext.contextPath}/${thongbao.link}">
                                        <i class="info icon"></i>${thongbao.thongbao}</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="ui top pointing dropdown admindropdown link item ">
                        <img class="imgrad" src="resources/images/avatar/admin-avt.png"
                             alt=""> <span class="clear navtext"><strong>${username}</strong></span>
                        <i class="dropdown icon navtext"></i>
                        <div class="menu">
                            <div class="item" onclick="location.href='logout.htm'">
                                <p>
                                    <a href="logout.htm"><i class="sign out alternate icon"></i>Logout</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BEGIN SIDEBAR -->
        <div class="computer only row">
            <div class="left floated three wide computer column"
                 id="computersidebar" style="width: 15% !important;">
                <div class="ui vertical fluid menu scrollable" id="simplefluid" style="font-size: 20px">
                    <div class="clearsidebar"></div>
                    <div class="item">
                        <img src="resources/images/avatar/admin-avt.png"
                             id="sidebar-image">
                    </div>
                    <a class="item" href="admin/account.htm"><i class="users icon"></i>Tài khoản</a>
                    <a class="item" href="admin/chutro.htm"><i class="user icon"></i>Chủtrọ</a>
                    <a class="item" href="admin/khachthue.htm"><i class="user outline icon"></i>Khách thuê</a>
                    <a class="item" href="admin/nhatro.htm?chu=-1"><i class="home icon"></i>Bài đăng</a>
                    <a class="item" href="admin/thongbao.htm?user="><i class="envelope icon"></i>Thông báo</a>
                    <a class="item" href="admin/truong.htm"><i class="map icon"></i>Trường</a>
                    <a class="item" href="admin/thongke.htm" onmouseenter="" onmouseleave=""> <i
                            class="chart line icon"></i> Thống kê 1 </a>
                    <a class="item" href="admin/thongkechutro.htm" onmouseleave="" style=""> <i
                            class="chart line icon"></i> Thống kê 2 </a>
                </div>
            </div>
        </div>
        <!-- END SIDEBAR -->
    </div>
</div>

<div class="ui grid"
     style="background: url(resources/images/background/background.png) repeat; background-size: cover;">
    <!-- BEGIN CONTEN -->
    <div class="right floated thirteen wide computer sixteen wide phone column"
         id="content">
        <div class="ui container grid" style="width: 100%; margin-top: 5px">
            <div class="row">
                <div
                        class="fifteen wide computer sixteen wide phone centered column">
                    <h2>
                        <i class="table icon"></i> Quản lý tài khoản
                    </h2>
                    <div class="ui divider"></div>
                    <div class="ui grid">
                        <div
                                class="sixteen wide computer sixteen wide phone centered column">
                            <c:if test="${message!=null}">
                                <div class="ui positive message">
                                    <i class="close icon"></i>
                                    <div class="header">Message</div>
                                    <p>${message}</p>
                                </div>
                            </c:if>

                            <!-- BEGIN DATATABLE -->
                            <a href="admin/addaccount.htm"
                               style="font-size: 16px; color: white;">
                                <button class="ui green icon label button"
                                        style="margin-right: 0; font-size: 16px;">
                                    <i class="plus square outline icon"
                                       style="padding-right: 0.5vw;"></i> Thêm
                                </button>
                            </a>
                            <div class="ui stacked segment rig">


                                <button class="positive ui button right floated">Positive Button</button>
                                <table id="mytable"
                                       class="ui celled table responsive nowrap unstackable"
                                       style="width: 100%">
                                    <thead style="text-align: center;">
                                    <tr>
                                        <th>Username</th>
                                        <th>Avatar</th>
                                        <th>Họ tên</th>
                                        <th>Email</th>
                                        <th>SĐT</th>
                                        <th>Admin</th>
                                        <th>Sửa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="i" items="${accounts}">
                                        <tr>
                                            <td>${i.username}</td>
                                            <td><img style="max-width: 33px;" alt=""
                                                     src=${i.photo}></td>
                                            <td>${i.fullname}</td>
                                            <td>${i.email}</td>

                                            <td>${i.phone}</td>
                                            <td><c:if test="${i.admin}"> Admin</c:if>
                                                <c:if test="${!i.admin}"> User</c:if></td>

                                            <td>
                                                <button class="ui left attached primary button">Sửa</button>
                                                <button class="ui right attached negative button">Xóa</button>
                                            </td>
                                                <%--                <td style="text-align: center;"><a--%>
                                                <%--                        href="admin/editaccount/${i.username}.htm"><button--%>
                                                <%--                        class="positive ui button"--%>
                                                <%--                        style="color: white; font-size: 13px">Sửa</button></a> <c:if--%>
                                                <%--                        test="${i.thongBao.size()==0}">--%>
                                                <%--                    <a href="admin/deleteaccount/${i.username}.htm"><button--%>
                                                <%--                            class="negative ui button"--%>
                                                <%--                            style="color: white; font-size: 13px">Xóa</button></a>--%>
                                                <%--                </c:if>--%>
                                                <%--                    <c:if--%>
                                                <%--                            test="${i.thongBao.size()>0}">--%>
                                                <%--                        <a href="admin/deleteaccount/${i.username}.htm"><button--%>
                                                <%--                                class="negative ui button"--%>
                                                <%--                                style="color: white; font-size: 13px" disabled="disabled">Xóa</button></a>--%>
                                                <%--                    </c:if>--%>
                                                <%--                </td>--%>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                    <%--        <tfoot style="text-align: center;">--%>
                                    <%--        <tr>--%>
                                    <%--            <th>Username</th>--%>
                                    <%--            <th>Avatar</th>--%>
                                    <%--            <th>Họ tên</th>--%>
                                    <%--            <th>Email</th>--%>
                                    <%--            <th>SĐT</th>--%>
                                    <%--            <th>Admin</th>--%>
                                    <%--            <th>Sửa</th>--%>
                                    <%--        </tr>--%>
                                    <%--        </tfoot>--%>
                                </table>
                            </div>
                            <!-- END DATATABLE -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->
</div>
</body>
<!-- inject:js -->
</html>
</body>
</html>