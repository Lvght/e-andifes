window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        const table = new simpleDatatables.DataTable(datatablesSimple);

        table.on('datatable.search', function(query, matched) {
            //
            console.log(query)
        });

        table.on("datatable.selectrow", (rowIndex, event) => {
            event.preventDefault();
            //
            console.log(rowIndex)
        });
    }
});
