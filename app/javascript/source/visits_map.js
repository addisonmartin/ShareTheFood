import { topojson } from "chartjs-chart-geo";

$(document).on('turbolinks:load', function() {
    if (document.getElementById("visits_map") != null) {
        fetch('https://unpkg.com/us-atlas/states-10m.json')
            .then((r) => r.json()).then((us) => {

                const nation = topojson.feature(us, us.objects.nation).features[0];
                const states = topojson.feature(us, us.objects.states).features;

                const scale = (v) => new Color('steelblue').lightness(value.value).rgbString();

                const chart = new Chart(document.getElementById('visits_map').getContext('2d'), {
                    type: 'choropleth',
                    data: {
                        labels: states.map((d) => d.properties.name),
                        datasets: [
                            {
                                label: 'States',
                                outline: nation,
                                data: states.map((d) => ({
                                    feature: d,
                                    value: gon.visits_per_state[d.properties.name],
                                })),
                            },
                        ],
                    },
                    options: {
                        legend: {
                            display: false,
                        },
                        scale: {
                            projection: 'albersUsa',
                        },
                        geo: {
                            colorScale: {
                                display: true,
                                position: 'bottom',
                                quantize: 5,
                                legend: {
                                    position: 'bottom-right',
                                },
                            },
                        },
                    },
                });

            });
    }
});
