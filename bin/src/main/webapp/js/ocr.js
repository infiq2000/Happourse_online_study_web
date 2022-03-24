var local_ocr = localStorage.getItem("ocr_img");
var a = local_ocr;
console.log(a);

let startX, startY;
let endX, endY;

document.getElementsByTagName('body')[0].addEventListener('mousedown', function(event) {
	console.log("ok");
    startX = Math.floor(event.pageX);
    startY = Math.floor(event.pageY);
});

document.getElementsByTagName('body')[0].addEventListener('mouseup', function(event) {
	endX = Math.floor(event.pageX);
    endY = Math.floor(event.pageY);
    snapImage(Math.min(endX, startX), Math.min(endY, startY), Math.max(endX, startX), Math.max(endY, startY));
});

function snapImage(x1,y1,x2,y2, e){
    console.log(x1, x2, y1, y2);
    html2canvas(document.body).then(function(canvas) {
        // calc the size -- but no larger than the html2canvas size!
        var width = Math.min(canvas.width,Math.abs(x2-x1));
        var height = Math.min(canvas.height,Math.abs(y2-y1));
        // create a new avatarCanvas with the specified size
        var avatarCanvas = document.createElement('canvas');
        avatarCanvas.width=width;
        avatarCanvas.height=height;
        avatarCanvas.id = 'avatarCanvas';
        // put avatarCanvas into document body
        document.body.appendChild(avatarCanvas);
        // use the clipping version of drawImage to draw
        // a clipped portion of html2canvas's canvas onto avatarCanvas
        var avatarCtx = avatarCanvas.getContext('2d');
        avatarCtx.drawImage(canvas,x1,y1,width,height,0,0,width,height);
        var image_data_url = avatarCanvas.toDataURL('image/jpeg').replace(/^data:image\/jpeg;base64,/, "");
        console.log(image_data_url);
    });
}