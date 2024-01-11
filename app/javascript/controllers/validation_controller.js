import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validation"
export default class extends Controller {
  static targets = [ "requiredField", "submit" ]
  connect() {
    this.checkDataIsValid()
  }

  submit(e) {
    if (!this.allIsGood()) {
      e.preventDefault()
    }
  }

  check() {
    this.checkDataIsValid()
  }

  checkDataIsValid() {
    if (this.allIsGood()) {
        this.submitTarget.classList.remove("btn-disabled")
    } else {
        this.submitTarget.classList.add("btn-disabled")
    }
  }

  allIsGood() {
    let emptyTargets = this.requiredFieldTargets.filter((target) => {
      if (target.value === "") return target
    })


    return !emptyTargets.length
  }
}
