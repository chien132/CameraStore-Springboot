<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="ui mini modal" id="messagemodal">
    <div class="header"><i class="info blue icon"></i> Thông báo</div>
    <div class="content">
        <h3>${message}</h3>
    </div>
    <div class="actions">
        <div class="ui cancel blue inverted button">OK</div>
    </div>
</div>

<script type="text/javascript" src="resources/semantic/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/semantic/semantic.min.js"></script>

<script>
    $(document).ready(function () {
        // - MESSAGES
        if (${message!=null}) {
            $('#messagemodal').modal('show');
        }

        //UI
        $('.ui.checkbox')
            .checkbox()
        ;
        $('.ui.dropdown')
            .dropdown();

    });

    function readURL(input, defaultimg) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#viewimage').attr('src', e.target.result)//.width(600)
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            $('#viewimage').attr('src', defaultimg)//.width(600)
        }
    }
</script>
</body>
</html>