<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>

</head>

<body>
    <div class="five wide column" style="padding-left: 2%;">
        <div class="ui form segment column" style="position: fixed; max-width: 10%">
            <form action="loc.htm" method="post">
                <div class="grouped fields">
                    <h4>Điểm đánh giá</h4>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="diem" value="2"> <label>⭐⭐ </label> <br>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="diem" value="3"> <label>⭐⭐⭐ </label> <br>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="diem" value="4"> <label>⭐⭐⭐⭐ </label> <br>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="diem" value="5"> <label>⭐⭐⭐⭐⭐</label> <br>
                        </div>
                    </div>
                </div>

                <h4>Giá</h4>
                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="giathue" value="1000000"> <label>-1 000 000</label> <br>
                    </div>
                </div>
                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="giathue" value="2000000"> <label>-2 000 000</label> <br>
                    </div>
                </div>

                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="giathue" value="3000000"> <label>-3 000 000</label> <br>
                    </div>
                </div>
                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="giathue" value="5000000"> <label>-5 000 000</label> <br>
                    </div>
                </div>
                <div class="field">
                    <div class="ui radio checkbox" hidden="true">
                        <input type="radio" name="giathue" value="" checked="checked"> <br>
                    </div>
                </div>
                <br>
                <button class="fluid ui primary left labeled icon button">
                    <i class="right arrow icon"></i>Lọc</button>
            </form>
        </div>
    </div>

</body>

</html>