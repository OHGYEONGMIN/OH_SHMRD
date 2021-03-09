
var tabButtons=document.querySelectorAll(".public .buttonContainer button");
var tabPanels=document.querySelectorAll(".public  .tabPanel");

function showPanel(panelIndex,colorCode) {
    tabButtons.forEach(function(node){
        node.style.backgroundColor="";
        node.style.color="";
    });
    tabButtons[panelIndex].style.backgroundColor=colorCode;
    tabButtons[panelIndex].style.color="white";
    tabPanels.forEach(function(node){
        node.style.display="none";
    });
    tabPanels[panelIndex].style.display="block";
    tabPanels[panelIndex].style.backgroundColor=colorCode;
}
// tabButtons(0,'#cf6a87');
showPanel(0,'rgba(225,225,225,0.3)');