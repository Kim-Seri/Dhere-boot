window.onload = function() {
	showInfo(0);
}
 function showInfo(index) {
    var contentBoxes = document.querySelectorAll('.tabcontent');
    var tabs = document.querySelectorAll('.nav-link');

        // Hide all content boxes
		    contentBoxes.forEach(function(box) {
		    box.classList.remove('active');
        });

        // Deactivate all tabs
		    tabs.forEach(function(tab) {
		    tab.classList.remove('active');
        });

        // Show the selected content box
   			contentBoxes[index].classList.add('active');

        // Activate the corresponding tab
   			tabs[index].classList.add('active');
    }	
    
    
   function setActiveButton(button) {
	   var buttons = document.getElementsByClassName("infoTab_btn");
	   
	   for(var i = 0; i < buttons.length; i++) {
		   buttons[i].classList.remove("activeButton");
	   }
	   
	   button.classList.add("activeButton");
   }
    
    