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
        

let camera_button = document.querySelector("#on");
let video = document.querySelector("#video");
let camera_stop = document.querySelector("#off");
let mood_rate = document.querySelector("#mood_rate_text");
var low = 0
var high = 0


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
			low = low + 1;
		}else{
			high = high +1;
		}
	})
}

function stopClock() {
    clearInterval(intervalID);
}

function check_rate(){
	var total = low + high;
	console.log('Total: ',total*5/60);
	console.log('High Mood: ',high*5/60);
	return (high/total)*100;
}

camera_button.addEventListener('click', async function() {
	
   	let stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: false });
	video.srcObject = stream;
	
	var intervalID = setInterval(capture, 5000);
	
	camera_stop.addEventListener('click', async function() {
		setTimeout(() => { clearInterval(intervalID); alert('Thank you for your contribution!'); }, 100);
	   	const mediaStream = video.srcObject;
		const tracks = mediaStream.getTracks();
		tracks.forEach(track => track.stop());
		mood_rate.value = String(check_rate())+"%";
	});
	
});

