var ed = document.getElementById('ed');
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
	
})