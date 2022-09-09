import { Controller } from "@hotwired/stimulus"

import swal from "sweetalert"

export default class extends Controller {
  connect() {
    console.log("Hello from Sweetalert!")
  }
}
