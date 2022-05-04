document.getElementById("off").onclick = function () {
		document.getElementById("off").style.display = 'none';
			document.getElementById("video").style.display = 'none';
			document.getElementById("mood_rate").style.display = 'block';
        };

document.getElementById("on").onclick = function () {
			document.getElementById("video").style.display = 'block';
            document.getElementById("off").style.display = 'block';
            document.getElementById("mood_rate").style.display = 'none';
        };        
        
/*let ocr = document.querySelector(".video-box");*/
const screenshotTarget = document.body;

let camera_button = document.querySelector("#on");
let video = document.querySelector("#video");
let camera_stop = document.querySelector("#off");
let mood_rate_total = document.querySelector("#mood_rate_text_total");
let mood_rate_1 = document.querySelector("#mood_rate_text_1");
let mood_rate_2 = document.querySelector("#mood_rate_text_2");
let mood_rate_3 = document.querySelector("#mood_rate_text_3");
let label = document.querySelector("#mood_rate_label");
const mood = [];


function capture(){
	
	canvas1.getContext('2d').drawImage(video, 0, 0, canvas1.width, canvas1.height);
   	var image_data_url = canvas1.toDataURL('image/jpeg').replace(/^data:image\/jpeg;base64,/, "");
   	
   	fetch('http://127.0.0.1:8000/', {
	  method: 'POST',
	  body: JSON.stringify({
	    file: image_data_url,
	  }),
	  headers: {
	    'Content-type': 'application/json; charset=UTF-8',
	  },
	})
	  .then(function(response){
		return response.json();
	})
	  .then(function(data){
		if(data == 0){
			mood.push(0);
		}else{
			mood.push(1);
		}
	})
	
	console.log(mood);
}

function stopClock() {
    clearInterval(intervalID);
}

function check_rate(){
	var total = mood.length - 1 ;
	var doan = parseInt(total/3);
	console.log('doan: ',doan);
	var rate_1 = 0
	var rate_2 = 0
	var rate_3 = 0
	var rate_t = 0
	
	for (let i = 0; i < doan; i++) {
		if (mood[i] == 1){
			rate_1 = rate_1 + 1;
		}
	}
	
	for (let j = doan; j < doan*2; j++) {
		if (mood[j] == 1){
			rate_2 = rate_2 + 1;
		}
	}
	
	for (let k = doan*2; k < total; k++) {
		if (mood[k] == 1){
			rate_3 = rate_3 + 1;
		}
	}
	
	console.log('Total: ',total);
	console.log('rate1: ', rate_1);
	console.log('rate2: ', rate_2);
	console.log('rate3: ', rate_3);
	
	var rate_t = (rate_1 + rate_2 + rate_3)/total*100;
	return [rate_t.toFixed(2), rate_1/doan, rate_2/doan, rate_3/(total-doan*2)];
}

camera_button.addEventListener('click', async function() {
	
   	let stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: false });
	video.srcObject = stream;
	
	var intervalID = setInterval(capture, 3000);
	
	camera_stop.addEventListener('click', async function() {
		setTimeout(() => { 
			clearInterval(intervalID); 
			alert('Thank you for your contribution!'); 
			location.reload();
			}, 100);
			
	   	const mediaStream = video.srcObject;
		const tracks = mediaStream.getTracks();
		tracks.forEach(track => track.stop());
		
		let rate = check_rate();
		
		if(rate[0] >= 50 && rate[0] <75){
			label.innerHTML = "Good Job!";
			label.style.color = "yellow";
		}else{
			if(rate[0] < 50){
				label.innerHTML = "Come On!";
				label.style.color = "red";
			}
		}
		mood_rate_total.value = String(rate[0])+"%";
		mood_rate_1.value = rate[1];
		mood_rate_2.value = rate[2];
		mood_rate_3.value = rate[3];
	});
	
});

/*function screen(){
	html2canvas(screenshotTarget).then((canvas) => {
	    var base64image = canvas.toDataURL("image/jpeg").replace(/^data:image\/jpeg;base64,/, "");
	    console.log(base64image);
	    return base64image;
	});
}*/

function screen(){
	const screenshotTarget = document.body;

	html2canvas(screenshotTarget).then((canvas) => {
	    const base64image = canvas.toDataURL("image/png");
	    console.log(base64image)
	    window.location.href = base64image;
	    $.ajax({
				  url: "/Happourse/GetPicture",
				  type: "post", //send it through get method
				  data: {
						base64image : base64image
				  },
				  success: function(data) {

				  },
				  error: function(xhr) {
				    //Do Something to handle error
				  }
				});
	});
}



var checkCtrl=false;
$('*').keydown(function(e){
    if(e.keyCode=='17'){
        checkCtrl=true;
    }
}).keyup(function(ev){
    if(ev.keyCode=='17'){
        checkCtrl=false;
    }
}).keydown(function(event){
    if(checkCtrl){
        if(event.keyCode=='81'){
			var img_url = screen();
			//localStorage.setItem("ocr_img", img_url);
			//console.log(localStorage);
			var win = window.open('/Happourse/crop/index.html', '_blank');
  			win.focus();
            checkCtrl=false;
        }
    }
})
