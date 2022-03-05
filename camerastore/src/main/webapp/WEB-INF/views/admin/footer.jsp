<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>

</head>

<body>
<script>
    $(document).ready(function () {
        // - MESSAGES
        $('.message .close').on('click', function () {
            $(this).closest('.message').transition('fade');
        });
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