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
        .seven.wide.column.table {
            width: 50%;
            margin: 0;
            /*padding: 0*/
        }
    </style>
</head>
<body id="homelogin">

<div class="spacer"></div>


<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Quản lý phân loại & Hãng sản xuất</h2>
        </div>
    </div>
</div>

<%--<div class="spacer"></div>--%>

<!-- cards -->
<div class="ui container bg_rgba" style="width: 95%;height:90%;overflow: scroll">
    <div class="ui grid">
        <table id="mycatetable"
               class="ui seven wide column celled table responsive nowrap unstackable">
            <thead style="text-align: center;">
            <tr>
                <th>ID</th>
                <%--                <th>Ảnh</th>--%>
                <th>Tên sản phẩm</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody style="text-align: center;">
            <c:forEach var="i" items="${categories}">
                <tr>
                    <td>${i.id}</td>
                        <%--                    <td><img style="max-width: 3.75vh;" alt="" src=""></td>--%>
                    <td>${i.name}</td>

                    <td>
                            <%--                        <a href="admin/catebrand/editcate/${i.id}">--%>
                        <button class="ui left attached primary button centered"
                                onclick="editCate(${i.id},'${i.name}')">Sửa
                        </button>
                            <%--                        </a>--%>
                        <c:if test="${i.products.size()==0}">
                            <button class="ui right attached negative button centered"
                                    onclick="showModal(${i.id},'${i.name}','cate')">Xóa
                            </button>
                        </c:if>
                        <c:if test="${i.products.size()!=0}">
                            <button disabled="true" class="ui right attached negative button centered">Xóa
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="two wide column"></div>

        <table id="mybrandtable"
               class="ui seven wide column celled table responsive nowrap unstackable">
            <thead style="text-align: center;">
            <tr>
                <th>ID</th>
                <%--                <th>Ảnh</th>--%>
                <th>Tên sản phẩm</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody style="text-align: center;">
            <c:forEach var="i" items="${brands}">
                <tr>
                    <td>${i.id}</td>
                        <%--                    <td><img style="max-width: 3.75vh;" alt="" src=""></td>--%>
                    <td>${i.name}</td>

                    <td>
                            <%--                        <a href="admin/catebrand/editbrand/${i.id}">--%>
                        <button class="ui left attached primary button centered"
                                onclick="editBrand(${i.id},'${i.name}')">Sửa
                        </button>
                            <%--                        </a>--%>
                        <c:if test="${i.products.size()==0}">
                            <button class="ui right attached negative button centered"
                                    onclick="showModal(${i.id},'${i.name}','brand')">Xóa
                            </button>
                        </c:if>
                        <c:if test="${i.products.size()!=0}">
                            <button disabled="true" class="ui right attached negative button centered">Xóa
                            </button>
                        </c:if>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
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

<div class="ui normal modal" id="addmodal">
    <div id="addmodalhheader" class="header"></div>
    <div class="content">
        <form id="addform" action="" method="post">
            <div class="ui form field"><input id="nameInput" class="form-control" type="text" name="name"
                                              required="true">
            </div>
            <button id="submitbtn" class="right floated ui approve green inverted button"><i
                    class="save outline icon"></i> Lưu
            </button>
        </form>
    </div>
    <%--    <div class="actions">--%>
    <%--        <button id="submitbtn">--%>
    <%--        </button>--%>
    <%--    </div>--%>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
    function showModal(id, name, type) {
        $('#usernamep').html('Bạn có chắc chắn xóa "' + name + '"')
        // $('#delbtn').onclick = document.location.href('admin/account/delete/' + id);
        document.getElementById('delbtn').setAttribute("href", 'admin/catebrand/delete' + type + '/' + id);
        $('#deleteconfirm').modal('show')
        //    .modal('setting', 'transition', 20)
    }

    function editBrand(id, name) {
        event.preventDefault();
        $('#addmodalhheader').html("Nhập tên hãng sản xuất")
        $('#nameInput').val(name)
        document.getElementById('addform').setAttribute("action", 'admin/catebrand/editbrand/' + id);
        $('#addmodal').modal("show")
    }

    function editCate(id, name) {
        event.preventDefault();
        $('#addmodalhheader').html("Nhập tên phân loại")
        $('#nameInput').val(name)
        document.getElementById('addform').setAttribute("action", 'admin/catebrand/editcate/' + id);
        $('#addmodal').modal("show")
    }

    $(document).ready(function () {
        $('#addcatelink').on('click', function () {
            event.preventDefault();
            $('#addmodalhheader').html("Nhập tên phân loại")
            document.getElementById('addform').setAttribute("action", 'admin/catebrand/addcate');
            $('#addmodal').modal("show")
        })

        $('#addbrandlink').on('click', function () {
            event.preventDefault();
            $('#addmodalhheader').html("Nhập tên hãng sản xuất")
            document.getElementById('addform').setAttribute("action", 'admin/catebrand/addbrand');
            $('#addmodal').modal("show")
        })
    })

    // $('#mybrandtable').DataTable();
    // $('#mycatetable').DataTable();

</script>
<%--<jsp:include page="../datatable.jsp"/>--%>
</body>
</html>