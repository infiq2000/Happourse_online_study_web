var buttons = document.querySelectorAll('.btn_hash');
var btn_checked = document.getElementById('checked');


btn_checked.click();

for(var i=0; i<buttons.length; i++){
	/*buttons[i].style.background = 'lightblue';*/
    buttons[i].addEventListener("click", mouseClick);
    /*buttons[i].addEventListener("dblclick", mouseDoubleClick)*/
}



function mouseClick() {
	if(this.style.background == "lightcoral"){
		this.style.background = "lightblue";
		this.style.color = '#6c757d';
	}else if(this.style.background == "lightblue"){
		this.style.background = "lightcoral";
		this.style.color = 'white';
	}else{
		this.style.background = "lightblue";
		this.style.color = '#6c757d';
	}
	
}


/*function mouseDoubleClick() {
	this.style.background = "#f5e5e8";
	this.style.color = 'white';
}*/