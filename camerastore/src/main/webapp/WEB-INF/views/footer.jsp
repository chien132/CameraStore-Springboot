<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>

</head>

<body>
<div class="ui tiny modal" id="messagemodal">
    <div class="header"><i class="info blue icon"></i> Thông báo</div>
    <div class="content">
        <h3>${message}</h3>
    </div>
    <div class="actions">
        <div class="ui cancel blue inverted button">OK</div>
    </div>
</div>
<script>
    $(document).ready(function () {
        // - MESSAGES
        if (${message!=null}&&
        ${dontshowmessage==null})
        {
            $('#messagemodal').modal('show');
        }
        if (${dontshowmessage=="cart"}) {
            $('#cartmodal').modal("show");
        }
        $('.ui.checkbox')
            .checkbox()
        ;
    });
</script>

</body>

</html>