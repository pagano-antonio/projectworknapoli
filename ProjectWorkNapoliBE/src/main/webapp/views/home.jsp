<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Gestional Tool</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function displayElapsedTime() {
    var timestamp = document.getElementById("time").value;
    var currentTime = new Date().getTime();
    var elapsedTimeInSeconds = Math.floor((currentTime - timestamp) / 1000);
    var hours = Math.floor(elapsedTimeInSeconds / 3600);
    var remainingSeconds = elapsedTimeInSeconds % 3600;
    var minutes = Math.floor(remainingSeconds / 60);
    var seconds = remainingSeconds % 60;
    var formattedHours = ("0" + hours).slice(-2);
    var formattedMinutes = ("0" + minutes).slice(-2);
    var formattedSeconds = ("0" + seconds).slice(-2);
    var message = "Session time: " + formattedHours + ":" + formattedMinutes + ":" + formattedSeconds;
    document.getElementById("elapsedTime").innerHTML = message;
}
document.addEventListener('DOMContentLoaded', function() {
    displayElapsedTime();
    setInterval(displayElapsedTime, 1000);
});

</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="wrapper">
		<jsp:include page="sidebar.jsp" />
		<div id="content" class="home">
		<div class="wrapper-home">
		<div>Welcome ${sessionScope.username}</div>
			<input type="hidden" id="time" name="time"
				value="${sessionScope.timestamp}" />
			<div id="elapsedTime"></div>
			
			</div>

			<img style="display: none" src="/images/hr-2.jpg" />
			<div class="quadratoni">
			
			<div class="quadratone"> 
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>account-multiple</title><path d="M16 17V19H2V17S2 13 9 13 16 17 16 17M12.5 7.5A3.5 3.5 0 1 0 9 11A3.5 3.5 0 0 0 12.5 7.5M15.94 13A5.32 5.32 0 0 1 18 17V19H22V17S22 13.37 15.94 13M15 4A3.39 3.39 0 0 0 13.07 4.59A5 5 0 0 1 13.07 10.41A3.39 3.39 0 0 0 15 11A3.5 3.5 0 0 0 15 4Z"></path></svg>
			<span class="number">${candidatesNumber}</span><span> Candidates </span>
			</div>
			
			<div class="quadratone"> 
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>email-newsletter</title><path d="M12 .64L8.23 3H5V5L2.97 6.29C2.39 6.64 2 7.27 2 8V18C2 19.11 2.9 20 4 20H20C21.11 20 22 19.11 22 18V8C22 7.27 21.61 6.64 21.03 6.29L19 5V3H15.77M7 5H17V9.88L12 13L7 9.88M8 6V7.5H16V6M5 7.38V8.63L4 8M19 7.38L20 8L19 8.63M8 8.5V10H16V8.5Z"></path></svg>
			<span class="number">${jobsNumber}</span><span> Job Offers</span>
			</div>
			
			<div class="quadratone"> 
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>microphone</title><path d="M12,2A3,3 0 0,1 15,5V11A3,3 0 0,1 12,14A3,3 0 0,1 9,11V5A3,3 0 0,1 12,2M19,11C19,14.53 16.39,17.44 13,17.93V21H11V17.93C7.61,17.44 5,14.53 5,11H7A5,5 0 0,0 12,16A5,5 0 0,0 17,11H19Z"></path></svg>
			<span class="number">${jobInterviewNumber}</span><span> Job Interviews</span>
			</div>
			
			<div class="quadratone"> 
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>domain</title><path d="M18,15H16V17H18M18,11H16V13H18M20,19H12V17H14V15H12V13H14V11H12V9H20M10,7H8V5H10M10,11H8V9H10M10,15H8V13H10M10,19H8V17H10M6,7H4V5H6M6,11H4V9H6M6,15H4V13H6M6,19H4V17H6M12,7V3H2V21H22V7H12Z"></path></svg>
			<span class="number">${companiesNumber}</span> <span>Companies</span>
			</div>
			
			</div>
			
			<div class="charts-container">
			
			
			
			
			<div class="only-chart">
			<h4>CANDIDATES GROUPED BY CITIES</h4>
			<div class="only-chart-inside">
			<canvas id="cities" ></canvas>
			</div>
			</div>
			
			<div class="only-chart">
			<h4>CANDIDATES GROUPED BY DEGREE</h4>
			<div class="only-chart-inside">
			<canvas id="degree" ></canvas>
			</div>
			</div>
			
		<div class="only-chart">
			<h4>CANDIDATES GROUPED BY AGE</h4>
			<div class="only-chart-inside">
			<canvas id="ageChart" style="padding-bottom:5px;max-width:300px!important;max-height:300px!important;"></canvas>
			</div>
			</div>
			
			<div class="only-chart">
			<h4>AVERAGE SALARY OF JOB OFFERS</h4>
			<div class="only-chart-inside">
			<canvas id="salaryChart" style="padding-bottom:5px;max-width:300px!important;max-height:300px!important;"></canvas>
			</div>
			</div>
			
			<div class="only-chart">
			<h4>GROUPING OF JOB OFFERS BY COMPANIES</h4>
			<div class="only-chart-inside">
			<canvas id="jobOffersChart"  width="300" height="300"></canvas>
			</div>
			</div>	
			
			<div class="only-chart">
			<h4>GROUPING OF JOB INTERVIEWS BY STATES</h4>
			<div class="only-chart-inside">
			<canvas id="barChart" width="300" height="300"></canvas>
			</div>
			</div>
			
			

		</div>
	</div>
	<div class="my-toast ${toastTitle}">
		<div class="my-toast-content">
			<svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg"
				viewBox="0 0 24 24">
				<title>close</title><path
					d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" /></svg>

			<svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg"
				viewBox="0 0 24 24">
				<title>check-circle-outline</title><path
					d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" /></svg>
			<div class="message">
				<span class="text text-1">${toastTitle}!</span> <span
					class="text text-2">${toastMessage}</span>
			</div>
		</div>
		<div class="progress active"></div>
	</div>


	<input type="hidden" id="modelAttr" name="modelAttr"
		value="${showToast}" />

	<script>

document.addEventListener('DOMContentLoaded', function() {
	
        var modelAttr = $("#modelAttr").val();
        if(modelAttr == "true"){
        showToast();
        }
    
});
    function showToast() {
    	const toast = document.querySelector(".my-toast");
        const progress = document.querySelector(".progress");
		
        let timer1, timer2;
		

        toast.classList.add("active");
        progress.classList.add("active");

        timer1 = setTimeout(() => {
            toast.classList.remove("active");
        }, 2500);

        timer2 = setTimeout(() => {
            progress.classList.remove("active");
        }, 2500);
    }

    const closeIcon = document.querySelector(".my-toast-close");
    console.log("closeIcon", closeIcon);

    closeIcon.addEventListener("click", () => {
        const toast = document.querySelector(".my-toast");
        const progress = document.querySelector(".progress");

        toast.classList.remove("active");

        setTimeout(() => {
            progress.classList.remove("active");
        }, 300);

        clearTimeout(timer1);
        clearTimeout(timer2);
    });
    
    const colors = [
        '#00BFFF', // Azzurro acceso
        '#FF5733', // Rosso
        '#87CEFA', // Azzurro
        '#FFC300', // Giallo
        '#FF00FF', // Fucsia
        '#FF3300', // Rosso acceso
        '#FF6347', // Rosso corallo
        '#B0E0E6', // Azzurro
        '#FFD700', // Oro
        '#FF1493', // Rosa acceso
        '#FFA500', // Arancione acceso
        '#FF00FF', // Magenta
        '#32CD32', // Verde lime
        '#FF7F50', // Rosa chiaro
        '#00FF00', // Verde brillante
        '#FF8C00', // Arancione scuro
        '#3CB371', // Verde marino chiaro
        '#FF4500', // Arancione rossastro
        '#4169E1', // Blu reale
        '#4682B4' // Blu acqua
    ];
  
    
    const getSuitableY = (y, yArray = [], direction) => {
        let result = y;
        yArray.forEach((existedY) => {
            if (existedY - 15 < result && existedY + 15 > result) {
                if (direction === "right") {
                    result = existedY + 15;
                } else {
                    result = existedY - 15;
                }
            }
        });
        return result;
    };

    const getOriginPoints = (source, center, l) => {
        let a = {x: 0, y: 0};
        var dx = (center.x - source.x) / l
        var dy = (center.y - source.y) / l
        a.x = center.x + l * dx
        a.y = center.y + l * dy
        return a
    };

    const options = {
        plugins: {
            legend: {
                display: false,
                position: "bottom"
            },
        },
        layout: {
            padding: {
                top: 30,
                left: 0,
                right: 0,
                bottom: 30
            }
        }
    };
    
    function getPlugins(myCustomLabel) {
        return [
            {
                afterDraw: (chart) => {
                    const ctx = chart.ctx;
                    ctx.save();
                    ctx.font = "10px 'Averta Std CY'";
                    const leftLabelCoordinates = [];
                    const rightLabelCoordinates = [];
                    const chartCenterPoint = {
                        x:
                        (chart.chartArea.right - chart.chartArea.left) / 2 +
                        chart.chartArea.left,
                        y:
                        (chart.chartArea.bottom - chart.chartArea.top) / 2 +
                        chart.chartArea.top
                    };
                    chart.config.data.labels.forEach((label, i) => {
                        const meta = chart.getDatasetMeta(0);
                        const arc = meta.data[i];
                        const dataset = chart.config.data.datasets[0];

                        const centerPoint = arc.getCenterPoint();
                        let color = chart.config._config.data.datasets[0].backgroundColor[i];
                        let labelColor = chart.config._config.data.datasets[0].backgroundColor[i];


                        const angle = Math.atan2(
                        centerPoint.y - chartCenterPoint.y,
                        centerPoint.x - chartCenterPoint.x
                        );

                        let originPoint = getOriginPoints(chartCenterPoint, centerPoint, arc.outerRadius)
                        const point2X =
                        chartCenterPoint.x + Math.cos(angle) * (centerPoint.x < chartCenterPoint.x ? arc.outerRadius + 10 : arc.outerRadius + 10);
                        let point2Y =
                        chartCenterPoint.y + Math.sin(angle) * (centerPoint.y < chartCenterPoint.y ? arc.outerRadius + 15 : arc.outerRadius + 15);

                        let suitableY;
                        if (point2X < chartCenterPoint.x) {
                        suitableY = getSuitableY(point2Y, leftLabelCoordinates, "left");
                        } else {
                        suitableY = getSuitableY(point2Y, rightLabelCoordinates, "right");
                        }

                        point2Y = suitableY;

                        let value = dataset.data[i];
                        let edgePointX = point2X < chartCenterPoint.x ? chartCenterPoint.x - arc.outerRadius - 10 : chartCenterPoint.x + arc.outerRadius + 10;

                        if (point2X < chartCenterPoint.x) {
                        leftLabelCoordinates.push(point2Y);
                        } else {
                        rightLabelCoordinates.push(point2Y);
                        }

                        //DRAW CODE
                        // first line: connect between arc's center point and outside point
                        ctx.lineWidth = 2;
                        ctx.strokeStyle = color;
                        ctx.beginPath();
                        ctx.moveTo(originPoint.x, originPoint.y);
                        ctx.lineTo(point2X, point2Y);
                        ctx.stroke();
                        // second line: connect between outside point and chart's edge
                        ctx.beginPath();
                        ctx.moveTo(point2X, point2Y);
                        ctx.lineTo(edgePointX, point2Y);
                        ctx.stroke();
                        //fill custom label
                        const labelAlignStyle =
                        edgePointX < chartCenterPoint.x ? "right" : "left";
                        const labelX = edgePointX < chartCenterPoint.x ? edgePointX : edgePointX + 0;
                        const labelY = point2Y + 7;
                        ctx.textAlign = labelAlignStyle;
                        ctx.textBaseline= "bottom";
                        ctx.font = "bold 12px Lato";
                        ctx.fillText(myCustomLabel[i], labelX, labelY);
                    });
                    ctx.restore();
                }
            }
        ];
    }

    var cities = ${cities}; // Recupera i dati dal modello
	var labels = [];
    var data = [];
    var backgroundColor = [];
    var borderColor = [];
	cities.forEach(function(cityData, index) {
        var cityName = cityData[0];
        var numOfCandidates = cityData[1];

        labels.push(cityName + ": " + numOfCandidates); // Aggiungi etichetta nel formato desiderato
        data.push(numOfCandidates);   
        var randomNumber;
        var randomColor;
        do {
            randomNumber = Math.floor(Math.random() * colors.length);
            randomColor = colors[randomNumber];
        } while (backgroundColor.includes(randomColor+'95'));

        backgroundColor.push(randomColor+'95');
        borderColor.push("#fff");
    });
	var ctx = document.getElementById('cities').getContext('2d');

    var myChart = new Chart(ctx, {
        type: 'pie',
        plugins: getPlugins(labels),
        options: options,
        data: {
            labels: labels,
            datasets: [
                {
                    label: "",
                    data: data,
                    backgroundColor: backgroundColor,
                    borderColor: borderColor,
                    borderWidth: 1,
                    polyline: {
                        formatter: (value) => `${value}`
                    }
                }
            ]
        }
    });
    
    
    var degrees = ${degrees}; // Recupera i dati dal modello
	var degreeLabels = [];
    var degreeData = [];
    var degreebackgroundColor = [];
    var degreeborderColor = [];
	degrees.forEach(function(degree, index) {
        var degreeName = degree[0];
        var numOfDegree = degree[1];

        degreeLabels.push(degreeName + ": " + numOfDegree); 
        degreeData.push(numOfDegree); 
        
        var randomNumber;
        var randomColor;
        do {
            randomNumber = Math.floor(Math.random() * colors.length);
            randomColor = colors[randomNumber];
        } while (degreebackgroundColor.includes(randomColor+'95'));

        degreebackgroundColor.push(randomColor+'95');
        degreeborderColor.push("#fff");
    });

    var ctx = document.getElementById('degree').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        plugins: getPlugins(degreeLabels),
        options: options,
        data: {
            labels: degreeLabels,
            datasets: [{
                label: '',
                data: degreeData,
                backgroundColor:degreebackgroundColor,
                borderColor: degreeborderColor,
                borderWidth: 1
            }]
        }
    });
    
    
    /* Bar chart */
    
     var state = ${states}; // Assumi che state sia una lista di oggetti con le proprietà stateDescription e numOfJobInterviews

        // Estrai le descrizioni degli stati e il numero di job interview per ciascuno
        var stateDescriptions = state.map(item => item[0]);
        var numOfJobInterviews = state.map(item => item[1]);
        var sumOfJobInterviews = numOfJobInterviews.reduce((acc, curr) => acc + curr, 0);
		
        var stateBg=[];
        var stateBo=[]
        
      
        // Crea il grafico a barre
        var ctx = document.getElementById('barChart').getContext('2d');
        var barChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: stateDescriptions,
                datasets: [{
                    label: sumOfJobInterviews + ' Job Interviews',
                    data: numOfJobInterviews,
                    backgroundColor: '#8CD8FD',
                    borderColor: '#8CD8FD90',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                    	beginAtZero: true,
                        ticks: {
                            stepSize: 1 // Imposta stepSize su 1 per avere incrementi di 1 sull'asse Y
                        }
                    }
                }
            }
        });
        
        
     // Recupera i dati dalla variabile passata dal modello
        var compOffer = ${compOffer};
       
        // Estrai le chiavi (nomi delle aziende) e i valori (numero di offerte di lavoro)
        var companies = compOffer.map(item => item[0]);
        var jobOffers = compOffer.map(item => item[1]);

        // Crea il grafico utilizzando Chart.js
        var ctx = document.getElementById('jobOffersChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: companies,
                datasets: [{
                    label: '',
                    data: jobOffers,
                    backgroundColor: '#8dfcce',
                    borderColor: '#8dfcce90',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                    	 beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
        
        var ages = ${ages}; // Recupera i dati dal modello
    
      function compareAges(age1, age2) {
           var age1Range = age1[0] === "60+" ? Infinity : age1[0].split("-").map(Number);
            var age2Range = age2[0] === "60+" ? Infinity : age2[0].split("-").map(Number);

            var age1Average = Array.isArray(age1Range) ? (age1Range[0] + age1Range[1]) / 2 : age1Range;
            var age2Average = Array.isArray(age2Range) ? (age2Range[0] + age2Range[1]) / 2 : age2Range;

            return age1Average - age2Average;
        }

        ages.sort(compareAges);
 var ageLabels = [];
     var ageData = [];
     var ageBackgroundColor = [];
     var ageBorderColor = [];
     var currentGroup = [];

     ages.forEach(function(age, index) {
         var ageRange = age[0];
         var numOfCandidates = age[1];

         
             ageData.push(numOfCandidates);
             ageLabels.push(ageRange); // Creiamo l'etichetta per l'intervallo di 10 anni
             
             var randomNumber;
             var randomColor;
             do {
                 randomNumber = Math.floor(Math.random() * colors.length);
                 randomColor = colors[randomNumber];
             } while (ageBackgroundColor.includes(randomColor+'95'));

             ageBackgroundColor.push(randomColor+'95');
             ageBorderColor.push("#fff");
         
     });

     // Se ci sono ancora valori nel gruppo corrente, aggiungili
     if (currentGroup.length > 0) {
         var groupLabel = currentGroup[0] + "-" + (currentGroup[0] + 9); // Creiamo l'etichetta del gruppo
         ageData.push(currentGroup.reduce((a, b) => a + b, 0));
         ageLabels.push(groupLabel);
     }

     var ctx = document.getElementById('ageChart').getContext('2d');
     var myChart = new Chart(ctx, {
         type: 'pie',
         data: {
             labels: ageLabels,
             datasets: [{
                 label: '',
                 data: ageData,
                 backgroundColor: ageBackgroundColor,
                 borderColor: ageBorderColor,
                 borderWidth: 1
             }]
         }
     });
     
     var salary =${salary};
     // Estrai le chiavi (nomi delle aziende) e i valori (numero di offerte di lavoro)
     var salary = ${salary};


var salarybackgroundColors = [];
var salaryborderColors = [];

// Itera su ogni salario e assegna un colore di sfondo e un colore di bordo casualmente
salary.forEach(function(salary) {
	
	 var randomNumber;
     var randomColor;
     do {
         randomNumber = Math.floor(Math.random() * colors.length);
         randomColor = colors[randomNumber];
     } while (ageBackgroundColor.includes(randomColor+'95'));

     salarybackgroundColors.push(randomColor+'95');
     salaryborderColors.push("#fff");
     
    
});
     var salaries = salary.map(item => item[0]);
     var salariesV = salary.map(item => item[1]);

     
     var ctx = document.getElementById('salaryChart').getContext('2d');
     var myChart = new Chart(ctx, {
         type: 'pie',
         data: {
             labels: salaries,
             datasets: [{
                 label: '',
                 data: salariesV,
                 backgroundColor: salarybackgroundColors,
                 borderColor: salaryborderColors,
                 borderWidth: 1
             }]
         }
     });
     
 

</script>
</body>
</html>