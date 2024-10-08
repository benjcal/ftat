export default {
    mounted() {
        let tabledata = JSON.parse(this.el.dataset.tabledata)

        new Tabulator(this.el, {
            data: tabledata,
            autoColumns: true,
        })
    }
}