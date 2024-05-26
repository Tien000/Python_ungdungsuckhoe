document.addEventListener('DOMContentLoaded', function () {
    fetch('api/covid')
        .then(response => {
            if (!response.ok) {
                throw new Error('Cannot fetch data');
            }
            return response.json();
        })
        .then(data => {
            const covidData = data.timeline.cases;
            const dates = Object.keys(covidData);
            const cases = Object.values(covidData);

            const ctx = document.getElementById('covidChart').getContext('2d');
            const chart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dates,
                    datasets: [{
                        label: 'COVID-19 Cases',
                        data: cases,
                        backgroundColor: 'rgba(0, 123, 255, 0.5)',
                        borderColor: 'rgba(0, 123, 255, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
});
