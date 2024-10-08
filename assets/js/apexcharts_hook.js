export const BarChart = {
    mounted() {
        let data = JSON.parse(this.el.dataset.chartdata)

        options = {
            chart: {
                type: 'bar'
            },
            plotOptions: {
                bar: {
                    horizontal: true
                }
            },
            series: [{ data }]
        }

        var chart = new ApexCharts(this.el, options);
        chart.render();
    }
}


export const DonutChart = {
    mounted() {
        let data = JSON.parse(this.el.dataset.chartdata)
        let labels = JSON.parse(this.el.dataset.labels)

        options = {
            chart: {
                type: 'donut'
            },
            labels,
            series: data
        }

        var chart = new ApexCharts(this.el, options);
        chart.render();
    }
}
