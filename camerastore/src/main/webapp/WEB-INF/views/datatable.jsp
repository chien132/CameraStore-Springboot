<!-- inject:css -->
<link rel="stylesheet" href="resources/vendors/fomantic-ui/semantic.min.css">
<!-- endinject -->
<!-- datatables:css -->
<link rel="stylesheet" href="resources/vendors/datatables.net/datatables.net-se/css/dataTables.semanticui.min.css">
<link rel="stylesheet"
      href="resources/vendors/datatables.net/datatables.net-responsive-se/css/responsive.semanticui.min.css">
<link rel="stylesheet" href="resources/vendors/datatables.net/datatables.net-buttons-se/css/buttons.semanticui.min.css">

<!-- inject:js -->
<script src="resources/vendors/jquery/jquery.min.js"></script>
<script src="resources/vendors/fomantic-ui/semantic.min.js"></script>
<!-- endinject -->
<!-- datatables:js -->
<script src="resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-se/js/dataTables.semanticui.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-responsive-se/js/responsive.semanticui.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="resources/vendors/datatables.net/datatables.net-buttons-se/js/buttons.semanticui.min.js"></script>
<script src="resources/vendors/jszip/jszip.min.js"></script>
<script src="resources/vendors/pdfmake/pdfmake.min.js"></script>
<script src="resources/vendors/pdfmake/vfs_fonts.js"></script>
<!-- endinject -->


<script>
    $(document).ready(function () {
        $('#example').DataTable();
        var table = $('#mytable').DataTable({
            lengthChange: false,
            buttons: ['colvis', 'excel', 'print'], //'pdf', 'copy'
        });
        table.buttons().container().appendTo(
            $('div.eight.column:eq(0)', table.table().container())
        );
    });
</script>