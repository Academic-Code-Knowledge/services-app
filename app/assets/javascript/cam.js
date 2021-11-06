
const video = document.getElementById('video');
const canvas = document.getElementById('canvas');
const snap = document.getElementById("snap");
const errorMsgElement = document.querySelector('span#errorMsg');

const constraints = {
    audio: false,
    video: {
        width: 320,
        height: 240
    }
};

// Access webcam
async function init() {
    try {
        const stream = await navigator.mediaDevices.getUserMedia(constraints);
        handleSuccess(stream);
    } catch (e) {
        errorMsgElement.innerHTML = `navigator.getUserMedia error:${e.toString()}`;
    }
}

// Success
function handleSuccess(stream) {
    window.stream = stream;
    video.srcObject = stream;
}

// Load init
init();

// Draw image
var context = canvas.getContext('2d');
var dataURL = ""
snap.addEventListener("click", function () {
    context.drawImage(video, 0, 0, 320, 240);
    dataURL =  canvas.toDataURL('image/png');
    console.log(dataURL)
})

save.addEventListener("click", function () {
    console.log(dataURL)
    $.post('/cam/save', {image:`${dataURL}`,name:`${Date.now()}`});
    location.reload();
})
