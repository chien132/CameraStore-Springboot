<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
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
    <style>
        td.descriptiontd {
            /*text-align: left;*/
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* number of lines to show */
            line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        tr {
            font-size: 1.15rem;
            cursor: pointer;
        }

        tr.done {
            background-color: rgba(152, 251, 152, 0.5);
        }

        tr.delivering {
            background-color: rgba(255, 255, 224, 0.5);
        }

        tr.waiting {
            background-color: rgba(255, 222, 173, 0.5);
        }

        tr.denied {
            background-color: rgba(255, 182, 193, 0.5);
        }

        tr:hover {
            /*transition-duration: 300ms;*/
            background-color: #b4eeff;
        }
    </style>
</head>
<body id="homelogin">
<div class="spacer"></div>

<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Quản lý sản phẩm</h2>
        </div>
    </div>
</div>

<%--<div class="spacer"></div>--%>

<!-- cards -->
<div class="ui container bg_rgba" style="width: 95%;height:90%;overflow: scroll">
    <table id="mytable"
           class="ui celled table responsive nowrap unstackable"
           style="width: 100%">
        <thead style="text-align: center;">
        <tr>
            <th>ID Đơn hàng</th>
            <th>Ngày</th>
            <th>Họ tên</th>
            <th>Địa chỉ</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Giá trị đơn</th>
            <th>Phương thức thanh toán</th>
            <th>Trạng thái</th>
            <%--            <th>Thao tác</th>--%>
        </tr>
        </thead>
        <tbody style="text-align: center;">
        <c:forEach var="i" items="${orders}">
            <%--                    <a href="order/view/${i.id}">--%>
            <tr class="${i.status}" onclick="location.href='admin/order/view/${i.id}'">
                <td>${i.id}</td>
                <td><f:formatDate value="${i.createdate}"
                                  pattern="dd/MM/yyyy" /></td>
                <td>${i.fullname}</td>
                <td>${i.address}</td>
                <td>${i.email}</td>
                <td>${i.phone}</td>
                <td><f:formatNumber currencySymbol="" maxFractionDigits="0"
                                    type="currency">${i.value}</f:formatNumber>đ
                </td>
                <td>${i.payonline?"Thanh toán MoMo":"Thanh toán khi nhận hàng"}</td>
                <td>
                        ${i.statusText}
                        <%--                        ${i.confirmed?"Đã xác nhận":"Chờ xác nhận"}--%>

                        <%--                    <c:if test="${i.confirmed}">--%>
                        <%--                        ${i.done?"| Đã hoàn tất":" | Đang giao hàng"}--%>
                        <%--                    </c:if>--%>
                </td>
                    <%--                <td>--%>
                    <%--                    <a href="admin/order/edit/${i.id}">--%>
                    <%--                        <button class="ui left attached primary button centered">Sửa</button>--%>
                    <%--                    </a>--%>
                    <%--                    <button class="ui right attached negative button centered"--%>
                    <%--                            onclick="showModal(${i.id}')">Xóa--%>
                    <%--                    </button>--%>
                    <%--                </td>--%>
            </tr>
            <%--                    </a>--%>
        </c:forEach>
        </tbody>
    </table>


</div>


<div class="ui tiny modal" id="deleteconfirm">
    <div class="header"><i class="exclamation red icon"></i> Cảnh báo</div>
    <div class="content">
        <h3 id="usernamep"></h3>
    </div>
    <div class="actions">
        <a id="delbtn">
            <div class="ui approve red inverted button"><i class="trash alternate outline icon"></i> Xóa</div>
        </a>
        <div class="ui cancel blue inverted button">Hủy</div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<jsp:include page="../datatable.jsp"/>
<script type="text/javascript">
    // function showModal(id, name) {
    //     $('#usernamep').html('Bạn có chắc chắn xóa sản phẩm "' + name + '"')
    //     // $('#delbtn').onclick = document.location.href('admin/account/delete/' + id);
    //     document.getElementById('delbtn').setAttribute("href", 'admin/product/delete/' + id);
    //     $('#deleteconfirm').modal('show')
    //     //    .modal('setting', 'transition', 20)
    // }
</script>
</body>
</html>