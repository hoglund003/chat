import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove"
export default class extends Controller {
  static values = {
    timeOut: Number
  }
  connect() {
    setTimeout(() => {
      this.element.remove()
    }, this.timeOutValue)
  }
}
