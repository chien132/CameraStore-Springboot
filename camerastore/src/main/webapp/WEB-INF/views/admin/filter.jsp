<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<style>
    .ui.radio.checkbox label {
        font-size: 1.25rem;
        cursor: pointer;
        color: #0d71bb;
    }

    /*.ui.checkbox.radio label.defaultlabel {*/
    /*    color: rgb(17, 178, 17);*/
    /*    !*font-weight: bold;*!*/
    /*    font-size: 1.25rem;*/
    /*}*/

    .grouped.fields h2 {
        font-weight: bolder;
        font-size: 1.8rem;
    }

</style>
<div class="four wide column">
    <div class="ui form segment" style="position: fixed;width: 18%;height: 79%;z-index: 1">
        <form action="admin/overview" method="post" id="filterform">
            <div class="ui form">
<%--                <div class="grouped fields">--%>
<%--                    <h2>Loại thống kê</h2>--%>
<%--                    <div class="field">--%>
<%--                        <div class="ui radio checkbox">--%>
<%--                            <input type="radio" name="type" id="numberrb" value="number" checked="true">--%>
<%--                            <label class="defaultlabel" for="numberrb"><i class="calculator icon"></i>Số liệu</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="field">--%>
<%--                        <div class="ui radio checkbox">--%>
<%--                            <input type="radio" name="type" id="chartrb" value="chart">--%>

<%--                            <label class="defaultlabel" for="chartrb"> <i class="chart bar icon"></i>Biểu đồ</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </div>--%>

                <div class="grouped fields">
                    <h3>Từ ngày</h3>
                    <div class="field">
                        <input type="date" name="from" value="${from}" id="frominput">
                    </div>

                </div>

                <div class="grouped fields">
                    <h3>Đến ngày</h3>
                    <div class="field">
                        <input type="date" name="to" value="${to}" id="toinput">
                    </div>
                </div>
            </div>
            <br>
            <button class="fluid ui primary left labeled icon button" onclick="changeFilter()">
                </i><h3>Thống kê</h3>
            </button>
        </form>
    </div>
</div>
<script type="text/javascript" src="resources/semantic/jquery-3.6.0.min.js"></script>
<script>


    function changeFilter() {
        $('#searchinput').prop("value", "")
    }

    <%--$(document).ready(function () {--%>
    <%--    $("#cate${category}").prop("checked", true);--%>
    <%--    $("#brand${brand}").prop("checked", true);--%>
    <%--    $("#${sort}").prop("checked", true);--%>
    <%--})--%>
</script>
</html>