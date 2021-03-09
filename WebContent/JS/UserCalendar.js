// ================================
// START YOUR APP HERE
// ================================



const init = {
	monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
	today: new Date(),
	monForChange: new Date().getMonth(),
	activeDate: new Date(),
	getFirstDay: (yy, mm) => new Date(yy, mm, 1),
	getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
	nextMonth: function() {
		let d = new Date();
		d.setDate(1);
		d.setMonth(++this.monForChange);
		this.activeDate = d;
		return d;
	},
	prevMonth: function() {
		let d = new Date();
		d.setDate(1);
		d.setMonth(--this.monForChange);
		this.activeDate = d;
		return d;
	},
	addZero: (num) => (num < 10) ? '0' + num : num,
	activeDTag: null,
	getIndex: function(node) {
		let index = 0;
		while (node = node.previousElementSibling) {
			index++;
		}
		return index;
	}
};

const $calBody = document.querySelector('.cal-body');
const $btnNext = document.querySelector('.btn-cal.next');
const $btnPrev = document.querySelector('.btn-cal.prev');

/**
 * @param {number} date
 * @param {number} dayIn
*/
//   function loadDate (date, dayIn) {
//     document.querySelector('.cal-date').textContent = date;
//     document.querySelector('.cal-day').textContent = init.dayList[dayIn];
//   }

/**
 * @param {date} fullDate
 */
function loadYYMM(fullDate) {
	let yy = fullDate.getFullYear();
	let mm = fullDate.getMonth();
	let firstDay = init.getFirstDay(yy, mm);
	let lastDay = init.getLastDay(yy, mm);
	let markToday;  // for marking today date

	if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
		markToday = init.today.getDate();
	}

	document.querySelector('.cal-month').textContent = init.monList[mm];
	document.querySelector('.cal-year').textContent = yy;

	let trtd = '';
	let startCount;
	let countDay = 0;
	for (let i = 0; i < 6; i++) {
		trtd += '<tr>';
		for (let j = 0; j < 7; j++) {
			if (i === 0 && !startCount && j === firstDay.getDay()) {
				startCount = 1;
			}
			if (!startCount) {
				trtd += '<td>'
			} else {
				let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
				trtd += '<td class="day';
				trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
				trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
			}
			trtd += (startCount) ? ++countDay : '';
			if (countDay === lastDay.getDate()) {
				startCount = 0;
			}
			trtd += '</td>';
		}
		trtd += '</tr>';
	}
	$calBody.innerHTML = trtd;
}

/**
 * @param {string} val
 */
function createNewList(val) {
	let id = new Date().getTime() + '';
	let yy = init.activeDate.getFullYear();
	let mm = init.activeDate.getMonth() + 1;
	let dd = init.activeDate.getDate();
	const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

	let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

	let eventData = {};
	eventData['date'] = date;
	eventData['memo'] = val;
	eventData['complete'] = false;
	eventData['id'] = id;
	init.event.push(eventData);
	$todoList.appendChild(createLi(id, val, date));
}

loadYYMM(init.today)
/*loadDate(init.today.getDate(), init.today.getDay());*/

$btnNext.addEventListener('click', () => {

	loadYYMM(init.nextMonth());
	let mm = init.activeDate.getMonth() + 1;
	console.log('mm : '+mm);
	$(function(){
		$.ajax({
			url:'/project333333/CalDate.do?nm='+mm,
			success:function(){
				
			}, error: function(){
				
			}
			
		});
		
	})
});
$btnPrev.addEventListener('click', () => {

	loadYYMM(init.prevMonth())
	let mm = init.activeDate.getMonth() + 1;
	console.log(mm);
	$(function(){
		$.ajax({
			url:'/project333333/CalDate.do?nm='+mm,
			success:function(){
				
			}, error: function(){
				
			}
			
		});
		
	})
});

$calBody.addEventListener('click', (e) => {
	if (e.target.classList.contains('day')) {

		if (init.activeDTag) {
			init.activeDTag.classList.remove('day-active');
		}
		let day = Number(e.target.textContent);
		let yy = init.activeDate.getFullYear();
		let mm = init.activeDate.getMonth() + 1;


		$(function() {
			$.ajax({
				url: '/project333333/Date.do?yy=' + yy + '&mm=' + mm + '&dd=' + day,
				dataType: 'json',
				success: function(data) {
					/*	console.log(data.LAD);
						console.log(data.LBD);
						console.log(data.LCD);*/
					console.log(data.dm0);
					console.log(data.dm1);
					console.log(data.dm2);
					console.log(data.dm3);
					console.log(data.dm4);
					console.log(data.dm5);
					console.log(data.dm6);
					var LAD = parseInt(data.LAD);
					var LBD = parseInt(data.LBD);
					var LCD = parseInt(data.LCD);

					var arrint = new Array();
					for (let i = 0; i < 7; i++) {
						arrint[i] = day - 3 + i;
					}
					var arrString = new Array();
					for (let i = 0; i < 7; i++) {
						if (arrint[i] <= 9) {
							arrString[i] = "0" + String(arrint[i]);
						} else {
							arrString[i] = String(arrint[i]);

						}



					}




//파이차트
					let ctx = document.getElementById('pieChartCanvas').getContext('2d');
					chart.destroy();

					pieChartData = {
						labels: ['A', 'B'],
						datasets: [{
							data: [LAD, LCD],
							backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)']
						}]
					};

					chart = new Chart(ctx, {
						type: 'pie',
						data: pieChartData,
						options: {
						}
					});

//바차트
					let ctx2 = document.getElementById('barChartCanvas').getContext('2d');
					myBarChart.destroy();
					myBarChart = new Chart(ctx2, {
						type: 'bar',
						data: {
							labels: [arrString[0] + "일", arrString[1] + "일", arrString[2] + "일", arrString[3] + "일", arrString[4] + "일", arrString[5] + "일", arrString[6] + "일"],
							datasets: [{
								data: [data.dm0, data.dm1, data.dm2, data.dm3, data.dm4, data.dm5, data.dm6],
								backgroundColor: ["rgba(255,1,1,0.5)", "rgb(255, 159, 64)", "rgb(255, 100, 100)", "rgba(1,255,1,0.5)",
						"rgba(100,255,100,0.5)", "rgba(1,1,255,0.5)", "rgb(25,42,86)"],
							}]
						},
						options: {
							legend:{
								display:false
							},
							hover: {
								mode: 'index'
							},
							responsive: false,
							scales: {
								xAxes: [{
									ticks:{
										fontColor:"rgba(225,225,225)",
										fontSize:20
									},
									gridLines: {
										color: "rgba(0,0,0,0)"
																			}
								}],
								yAxes: [{
									
									gridLines: {
										color: "rgba(0,0,0,0)"
									},
									ticks: {
										beginAtZero: true,
										stepSize:10,
										fontColor:"rgba(225,225,225)",
										fontSize:20
									}
								}]
							}
						}
					});

				}, error: function() {

				}
			});
		})

		e.target.classList.add('day-active');
		/*loadDate(day, e.target.cellIndex);*/
		init.activeDTag = e.target;
		init.activeDate.setDate(day);
	}
});

/*var ed = document.getElementById('ed');
ed.addEventListener('click',() => {
	let mm = init.activeDate.getMonth() + 1;
	console.log(mm);
	$(function(){
		$.ajax({
			url:'/project333333/CalDate.do?nm='+mm,
			success:function(){
			}, error: function(){
			}
			
		});
		
	})
	
})*/






