const key = document.getElementById('on-off','navitem');
const container = document.getElementById
('container','list_group');

key.addEventListener('click',function(){
    key.classList.toggle('switch-on','icon-click');
    container.classList.toggle('container-on');
    


});