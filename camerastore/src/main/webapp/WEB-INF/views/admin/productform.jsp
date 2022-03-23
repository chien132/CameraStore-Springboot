<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
        .ck.ck-editor {
            width: 56vw;
        }

        .ck-editor__editable {
            min-height: 30vh;
            max-height: 48vh;
        }
    </style>
</head>
<body id="homelogin">

<div class="spacer"></div>


<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h1 style="color: white;">
                <c:if test="${action=='add'}">Thêm sản phẩm</c:if>
                <c:if test="${action=='edit'}">Cập nhật sản phẩm</c:if>
            </h1>
        </div>
    </div>
</div>

<div class="ui container" style="background-color: rgba(255,255,255,0.2);">

    <div class="ui grid" style="width: 100%; margin-top: 5px">
        <div class="six wide column">s
            <img class="ui huge rounded image" onclick="$('#imageinput').click()" id="viewimage"
                 style="max-width: -webkit-fill-available; max-height: 70vh;object-fit: contain"
                 src="${product.image}"/>
        </div>
        <div class="ten wide centered column">

            <form:form class="ui large form"
                       action="admin/product/${action}" modelAttribute="product"
                       enctype="multipart/form-data" method="post" onsubmit="return checkimg('${action}');">
                <div class="ui segment" style="font-size: inherit">

                        <%--                    <div class="field">--%>
                        <%--                        <label style="float: left;">Hình ảnh</label>--%>
                        <%--                        <div class="ui left input">--%>
                    <input id="imageinput" onchange="readURL(this,'${product.image}');" name="photoinput"
                           type="file" accept="image/*"
                           class="form-control" title="Chọn một ảnh" hidden="true"/>
                        <%--                            <form:input path="image" hidden="true"/>--%>
                        <%--                        </div>--%>
                        <%--                    </div>--%>

                    <div class="fields">
                        <div class="ten wide field">
                            <label>Tên sản phẩm<b
                                    style="color: red;">*</b></label>
                            <div class="ui left input">
                                <form:input path="name" value="${product.name}"
                                            type="text" placeholder="Tên sản phẩm" required="true"/>
                                <i><form:errors style="color: red;font-size: 15px;"
                                                path="name"/></i>
                            </div>
                        </div>
                        <div class="three wide field"><label>Hãng sản xuất<b
                                style="color: red;">*</b></label>
                            <form:select path="brand.id" items="${brands}" itemLabel="name" itemValue="id"/>
                        </div>
                        <div class="three wide field"><label>Phân loại<b
                                style="color: red;">*</b></label>
                            <form:select path="category.id" items="${categories}" itemLabel="name" itemValue="id"/>
                        </div>
                    </div>
                    <form:input path="id" hidden="true"/>
                    <div class="fields">
                        <div class="eight wide field">
                            <label style="float: left;">Đơn giá<b
                                    style="color: red;">*</b></label>
                            <div class="ui left input">
                                <!-- 	<i class="lock icon"></i> -->
                                <form:input path="price" value="${product.price}"
                                            type="number" min="10000" step="5000" placeholder="Giá tiền"
                                            required="true"/>
                                <form:errors style="color: red;font-size: 15px;"
                                             path="price"/>
                            </div>
                        </div>


                        <div class="four wide field">
                            <label style="float: left;">% Giảm giá </label>
                            <div class="ui left input">
                                <form:input path="discount" type="number" min="0" max="100" placeholder="Giảm giá"
                                            required="true"/>
                                <form:errors style="color: red;font-size: 15px;"
                                             path="discount"/>
                            </div>
                        </div>
                        <div class="four wide field">
                            <label style="float: left;">Số lượng tồn</label>
                            <div class="ui left input">
                                <form:input path="quantity" value="${product.quantity}" type="number" min="0" step="1"
                                            placeholder="Số lượng tồn" required="true"/>
                                <form:errors style="color: red;font-size: 15px;"
                                             path="quantity"/>
                            </div>
                        </div>
                    </div>


                    <div class="field">
                        <label style="float: left;">Mô tả </label>
                        <div class="ui left input">
                            <form:textarea id="destextarea" rows="18" path="description" type="text"
                                           placeholder="Mô tả"/>
                                <%--                            <div id="testck">  sdfgdf</div>--%>

                            <form:errors style="color: red;font-size: 15px;"
                                         path="description"/>
                        </div>
                    </div>
                    <button class="ui fluid large teal submit button" id="submit">
                        <c:if test="${action=='add'}">Thêm</c:if>
                        <c:if test="${action=='edit'}">Cập nhật</c:if>
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="resources/ckeditor/ckfinder.js"></script>

<script>
    let editor=
    ClassicEditor
        .create(document.querySelector('#destextarea'), {
            plugins: [CKFinder],

            ckfinder: {
                uploadUrl: '/ckfinder/connector?command=QuickUpload&type=Images&responseType=json',
                options: {
                    resourceType: 'Images'
                }
            },
            toolbar: [ 'ckfinder', 'imageUpload', '|', 'heading', '|', 'bold', 'italic', '|', 'undo', 'redo' ]
        })
        .catch(error => {
            console.error(error);
        });

    // ClassicEditor
    //     .create(document.querySelector('#destextarea'))
    //     .then(newEditor => {
    //         editor = newEditor;
    //     })
    //     .catch(error => {
    //         console.error(error);
    //     });
    //

    function checkimg(action) {
        var file = document.getElementById("imageinput");
        if (file.files.length > 0 || action == 'edit') {
            return true;
        } else {
            alert("Hãy chọn ảnh cho sản phẩm");
            return false;
        }
    }

    // document.querySelector('#submit').addEventListener('click', () => {
    //     let imageinput=$('#imageinput');
    //     if (!(imageinput.files && imageinput.files[0])){
    //         alert("Hãy chọn ảnh cho sản phẩm");
    //     }
    // });
</script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>