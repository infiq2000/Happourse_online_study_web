var eye_ratio_threshold = 0.25

const video = document.getElementById("video");
/*let predictedAges = [];*/

Promise.all([
  faceapi.nets.tinyFaceDetector.loadFromUri("js/face/models"),
  faceapi.nets.faceLandmark68Net.loadFromUri("js/face/models"),
  faceapi.nets.faceRecognitionNet.loadFromUri("js/face/models"),
  faceapi.nets.faceExpressionNet.loadFromUri("js/face/models"),
  faceapi.nets.ageGenderNet.loadFromUri("js/face/models")
]);

function e_dist(p1, p2){
	return Math.sqrt(Math.pow(p1['x'] - p2['x']) + Math.pow(p1['y'] - p2['y']))
}

function e_ratio(p0, p1, p2, p3, p4, p5){
	var dv1 = e_dist(p1, p5)
	var dv2 = e_dist(p2, p4)
	
	var d_h = e_dist(p0, p3)
	
	return (dv1 + dv2)/(2 * d_h)
}

function startVideo() {
  navigator.getUserMedia(
    { video: {} },
    stream => (video.srcObject = stream),
    err => console.error(err)
  );
};

document.getElementById('cam').onclick = function(e){
    if (this.checked){
        startVideo();
    }
    else{
		const mediaStream = video.srcObject;

		// Through the MediaStream, you can get the MediaStreamTracks with getTracks():
		const tracks = mediaStream.getTracks();
		
		// Tracks are returned as an array, so if you know you only have one, you can stop it with: 
		tracks[0].stop();
		
		// Or stop all like so:
		tracks[0].stop();
	}
};


video.addEventListener("playing", () => {

  const canvas = faceapi.createCanvasFromMedia(video);
  document.body.append(canvas);

  const displaySize = { width: video.width, height: video.height };
  faceapi.matchDimensions(canvas, displaySize);
  
  setInterval(async () => {
    const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks();
      /*.withFaceExpressions()
      .withAgeAndGender();*/
    const resizedDetections = faceapi.resizeResults(detections, displaySize);

    canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
    
    landmarks = await faceapi.detectFaceLandmarks(video)
    landmarkPositions = landmarks.positions
    
    var l0 = landmarkPositions[36];
    var l1 = landmarkPositions[37];
    var l2 = landmarkPositions[38];
    var l3 = landmarkPositions[39];
    var l4 = landmarkPositions[40];
    var l5 = landmarkPositions[41];

    var r0 = landmarkPositions[42];
    var r1 = landmarkPositions[43];
    var r2 = landmarkPositions[44];
    var r3 = landmarkPositions[45];
    var r4 = landmarkPositions[46];
    var r5 = landmarkPositions[47];
    
    var left_ratio = e_ratio(l0,l1,l2,l3,l4,l5);
    var right_ratio = e_ratio(r0,r1,r2,r3,r4,r5);
    var avg_ratio = (left_ratio+ right_ratio)/2
    
    console.log(avg_ratio);
    if (avg_ratio < eye_ratio_threshold){
		console.log("LOW");
	}

    

    faceapi.draw.drawDetections(canvas, resizedDetections);
    faceapi.draw.drawFaceLandmarks(canvas, resizedDetections);
    /*faceapi.draw.drawFaceExpressions(canvas, resizedDetections);

    const age = resizedDetections[0].age;
    const interpolatedAge = interpolateAgePredictions(age);
    const bottomRight = {
      x: resizedDetections[0].detection.box.bottomRight.x - 50,
      y: resizedDetections[0].detection.box.bottomRight.y,
    };

    new faceapi.draw.DrawTextField([`${faceapi.utils.round(interpolatedAge, 0)} years`],bottomRight).draw(canvas);*/
  }, 100);
});

/*function interpolateAgePredictions(age) {
  predictedAges = [age].concat(predictedAges).slice(0, 30);
  const avgPredictedAge =
    predictedAges.reduce((total, a) => total + a) / predictedAges.length;
  return avgPredictedAge;
}*/
