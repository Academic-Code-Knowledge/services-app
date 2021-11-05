# Capturar imagen desde webcam
## 1.- Crear controlador Cam
```
rails generate controller Cam index
```
Con esto podemos tener una ruta y una vista para capturar una foto desde la webcam

## 2.- Agregar la siguiente linea al archivo app/assets/config/manifest.js
```
//= link_tree ../javascript
```
Esta linea permite que al compilar los archivos de assets, incluya toso los archivos de la carpeta javascript
## 3.- Crear el archivo
```
app/assets/javascript/cam.js
```
con el siguiente codigo
```
'use strict';

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
context.drawImage(video, 0, 0, 320, 240);
snap.addEventListener("click", function () {
    context.drawImage(video, 0, 0, 320, 240);
});
```
Este codigo permite iniciar, ejecutar y mostrar una captura de imagen desde la webcam
(Fuente: https://programacion.net/articulo/acceder_a_la_webcam_y_capturar_imagen_utilizando_html5_y_javascript_2045)

## 4.- En el archivo app\views\layouts\application.html.erb agregar la linea antes de terminar el body
```
<%= javascript_include_tag "cam.js" %>
```
Esta linea permite incluir el archivo cam.js en la aplicacion.
## 5.- En el archivo app\views\cam\index.html.erb agregar lo siguiente
```
<div class="row d-flex p-2 bd-highlight">
  <div class="col-sm text-center">
    <video class="border position-relative" id="video" playsinline autoplay></video>
  </div>
  <div class="col-sm text-center">
    <!-- Webcam video snapshot -->
    <canvas class="border position-relative" id="canvas" width="320" height="240"></canvas>
  </div>
</div>
<div class="row d-flex p-2 bd-highlight">
  <div class="col-sm text-center">
    <button id="snap">Capturar Imagen</button>
  </div>
</div>
```
aca podemos visualizar 3 objetos, una ventana con el striming de la camara, un boton para la captura que detecta eventos en javascript y una ventana canvas en dodne podremos visualizar la captura una vez que se presione el boton.
## 6.- Finalmente inicie el servidor y navegue para capturar una imagen
Ejecute el comando
```
rails s
```
para ejecutal la aplicacion y poder dirigirse a la ruta 
http://localhost:3000/cam/index
