<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<style>
    .ui.radio.checkbox label {
        font-size: 1.2rem;
        cursor: pointer;
        color: #0d71bb;
    }

    .ui.checkbox.radio label.defaultlabel {
        color: rgb(17, 178, 17);
        /*font-weight: bold;*/
        font-size: 1.25rem;
    }

    .grouped.fields h2 {
        font-weight: bolder;
        font-size: 1.8rem;
    }

    .ui.pagination.menu {
        /*margin: 1vw;*/
        /*margin-top: 2vw;*/
        /*margin-right: 0.5vw;*/
    }
</style>
<div class="four wide column">
    <div class="ui form segment" style="position: fixed;width: 18%;height: 79%;z-index: 1">
        <form action="index" method="post">
            <div class="ui form">
                <div class="grouped fields">
                    <h2>Phân loại</h2>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="category" id="tatcacate" value="none" checked="true">
                            <label class="defaultlabel" for="tatcacate">Tất cả</label>
                        </div>
                    </div>
                    <c:forEach var="i" items="${categories}">
                        <div class="field">
                            <div class="ui radio checkbox">
                                <input type="radio" name="category" id="cate${i.id}" value="${i.id}">
                                <label for="cate${i.id}">${i.name}</label>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="grouped fields">
                    <h2>Hãng sản xuất</h2>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="brand" id="tatcabrand" value="none" checked="true">
                            <label class="defaultlabel" for="tatcabrand">Tất cả</label>
                        </div>
                    </div>
                    <c:forEach var="i" items="${brands}">
                        <div class="field">
                            <div class="ui radio checkbox">
                                <input type="radio" name="brand" id="brand${i.id}" value="${i.id}">
                                <label for="brand${i.id}">${i.name}</label>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <div class="grouped fields">
                    <h2>Sắp xếp</h2>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="sort" id="sort1" value="ASC" checked="true">
                            <label for="sort1">Giá tăng dần</label>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="sort" id="sort2" value="DESC">
                            <label for="sort2">Giá giảm dần</label>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="sort" id="sort3" value="ASC">
                            <label for="sort3">Giảm giá nhiều</label>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <button class="fluid ui primary left labeled icon button">
                <i class="right arrow icon"></i>Lọc
            </button>
        </form>
        <h3>Trang</h3>
        <div class="ui pagination menu">
            <a class="active item">
                1
            </a>
            <div class="disabled item">
                ...
            </div>
            <a class="item">
                ${products.totalPages-2}
            </a>
            <a class="item">
                ${products.totalPages-1}
            </a>
            <a class="item">
                ${products.totalPages}
            </a>
        </div>
    </div>
</div>

</html>