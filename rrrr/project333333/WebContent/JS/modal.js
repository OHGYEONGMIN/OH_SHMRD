var modalBtn = document.querySelector('.signup');
var modalBg = document.querySelector('.modal-bg');
var modalclose = document.querySelector('.modal-close');
//로그인

var modallg = document.querySelector('.modal-login');
var logBtn = document.querySelector('.login');
var logclose = document.querySelector('.login-close');

//닫기 버튼
var cancel = document.querySelector('.cancel');

cancel.addEventListener('click',function(){
	modalBg.classList.remove('bg-active')
})

modalBtn.addEventListener('click', function(){
    modalBg.classList.add('bg-active');
})

modalclose.addEventListener('click',function(){
    modalBg.classList.remove('bg-active');
})

logBtn.addEventListener('click',function(){
    modallg.classList.add('lg-active');
})
logclose.addEventListener('click',function(){
    modallg.classList.remove('lg-active');
})





