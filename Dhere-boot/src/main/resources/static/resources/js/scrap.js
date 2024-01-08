window.onload = function() {
	showInfo(0);
}
 
 function showInfo(index) {
   var contentBoxes = document.querySelectorAll('.infoContent');
   
   // Hide all content boxes
   contentBoxes.forEach(function(box) {
     box.classList.remove('active');
   });

   // Show the selected content box
   contentBoxes[index].classList.add('active');
 }
 
