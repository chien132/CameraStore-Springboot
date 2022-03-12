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

<script type="text/javascript" src="resources/semantic/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/semantic/semantic.min.js"></script>

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
        //UI
        $('.ui.checkbox')
            .checkbox()
        ;
        $('.ui.dropdown')
            .dropdown();

        //Cart Modal
        let alist = document.getElementsByClassName("mycustoma")
        for (let i = 0; i < alist.length; i++) {
            let prehref = alist[i].href;
            // console.log(i)
            // console.log(prehref)
            // prehref = prehref.substring(0, prehref.indexOf("?ret="));
            // console.log(prehref)
            alist[i].href = prehref + window.location.href.replace("http://localhost:8080/", "?ret=");
            // console.log(alist[i].href)
        }
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