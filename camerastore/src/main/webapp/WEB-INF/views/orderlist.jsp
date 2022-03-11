<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>Đơn hàng</title>
    <style>
        .bg_rgba {
            background-color: rgba(150, 150, 150, 0.5);
            background-blend-mode: lighten;
        }

        tr.even {
            background-color: #c77474;
        }

        tr:hover {
            mouse: pointer;
        }
    </style>
</head>

<body id="homelogin">
<jsp:include page="header.jsp"/>
<div class="spacer"></div>

<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Đơn hàng</h2>
        </div>
    </div>
</div>

<div class="ui container" style="width: 100%">
    <div class="ui grid segment">
        <div class="sixteen wide column">
            <h3>Xin chào<i style="color: royalblue"> ${curaccount.fullname}</i>
            </h3>
            <h3>Đây là các đơn hàng của bạn </h3>
            <%--            style="height: 80vh"--%>
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
                    <%--                        <th>Thao tác</th>--%>
                </tr>
                </thead>
                <tbody style="text-align: center;">
                <c:forEach var="i" items="${orders}">
                    <%--                    <a href="order/view/${i.id}">--%>
                    <tr onclick="location.href='order/view/${i.id}'">
                        <td>${i.id}</td>
                        <td>${i.createdate}</td>
                        <td>${i.fullname}</td>
                        <td>${i.address}</td>
                        <td>${i.email}</td>
                        <td>${i.phone}</td>
                        <td><f:formatNumber currencySymbol="" maxFractionDigits="0"
                                            type="currency">${i.value}</f:formatNumber>đ
                        </td>
                        <td>${i.payonline?"Thanh toán MoMo":"Thanh toán khi nhận hàng"}</td>
                        <td>${i.done?"Đã hoàn thành":"Đang xử lí"}</td>
                    </tr>
                    <%--                    </a>--%>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<link rel="stylesheet" type="text/css" href="resources/datatables/DataTables-1.11.5/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/datatables/Buttons-2.2.2/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/datatables/Scroller-2.0.5/css/scroller.dataTables.min.css"/>

<script type="text/javascript" src="resources/datatables/JSZip-2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="resources/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="resources/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="resources/datatables/DataTables-1.11.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="resources/datatables/Buttons-2.2.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="resources/datatables/Buttons-2.2.2/js/buttons.colVis.min.js"></script>
<script type="text/javascript" src="resources/datatables/Buttons-2.2.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="resources/datatables/Buttons-2.2.2/js/buttons.print.min.js"></script>
<script type="text/javascript" src="resources/datatables/Scroller-2.0.5/js/dataTables.scroller.min.js"></script>
<script>
    // $('#mytable').DataTable();
    var table = $('#mytable').DataTable({
        lengthChange: false,
        buttons: ['colvis']
    });
    // table.buttons().container().appendTo(
    //     $('.sixteen.wide.column', table.table()
    //         .container()));
</script>
</body>

</html>