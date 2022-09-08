import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="stimulus-flatpickr"
export default class extends Controller {
  connect() {
    console.log('connected');
  }
}
