var ctx = document.getElementById("userValChart");
var userValChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: <%= @work_id_reviews %>,
    datasets: [{
      label: "Your valoration",
      fill: false,
      lineTension: 0.1,
      backgroundColor: "rgba(75,192,192,0.4)",
      borderColor: "rgba(75,192,192,1)",
      borderCapStyle: 'butt',
      borderDash: [],
      borderDashOffset: 0.0,
      borderJoinStyle: 'miter',
      pointBorderColor: "rgba(75,192,192,1)",
      pointBackgroundColor: "#fff",
      pointBorderWidth: 1,
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(75,192,192,1)",
      pointHoverBorderColor: "rgba(220,220,220,1)",
      pointHoverBorderWidth: 2,
      pointRadius: 1,
      pointHitRadius: 10,
      data: <%= @user_valoration %>
    },
    {
      label: "Overcost",
      fill: false,
      lineTension: 0.1,
      backgroundColor: "rgba(12,34,45,1)",
      borderColor: "rgba(12,34,45,1)",
      borderCapStyle: 'butt',
      borderDash: [],
      borderDashOffset: 0.0,
      borderJoinStyle: 'miter',
      pointBorderColor: "rgba(12,34,45,1)",
      pointBackgroundColor: "#fff",
      pointBorderWidth: 1,
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(12,34,45,1)",
      pointHoverBorderColor: "rgba(220,220,220,1)",
      pointHoverBorderWidth: 2,
      pointRadius: 1,
      pointHitRadius: 10,
      data: <%= @overcosts %>
    }
    ]
  },
  options: { 
    responsive: true,  
    scales: {
      yAxes: [{
        ticks: {
          scaleOverride:true,
          beginAtZero:true,
          max:10,
        }
      }]
    }
  }

});

