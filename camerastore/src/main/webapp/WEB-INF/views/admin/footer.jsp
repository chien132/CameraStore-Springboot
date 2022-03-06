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
<script>
    function readURL(input,defaultimg) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#viewimage').attr('src', e.target.result)//.width(600)
            };
            reader.readAsDataURL(input.files[0]);
        }else{
            $('#viewimage').attr('src', defaultimg)//.width(600)

        }
    }

    $(document).ready(function () {

        if (${message!=null}) {
            $('#messagemodal').modal('show');
        }
        $('.ui.checkbox')
            .checkbox()
        ;
        // // - MESSAGES
        // $('#messagemodal').on('click', function () {
        //     $(this).closest('#messagemodal').transition('fade');
        // });
        // - DATATABLES
        // $(document).ready(function () {
        //     $('#mytable').DataTable();
        // });
        var table = $('#mytable').DataTable({
            lengthChange: false,
            buttons: ['colvis']
        });
        table.buttons().container().appendTo(
            $('div.eight.column:eq(0)', table.table()
                .container()));
    });
</script>

</body>

</html>