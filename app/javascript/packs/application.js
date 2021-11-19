import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import jQuery from 'jquery';
// import font awesome javascript Daniel
import '@fortawesome/fontawesome-free/js/all';

import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal

window.jQuery = $;
window.$ = $;


Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "chartkick/chart.js"


