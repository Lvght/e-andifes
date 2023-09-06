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
            const row = table.dom.querySelector("tbody").children[rowIndex]
            const cell = row.querySelector("td") // usando a primeira coluna como ID
            window.location = table.dom.getAttribute("data-link").replace("$", cell.innerText)
        });
    }
});
