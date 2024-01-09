import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll"
export default class extends Controller {
  static values = {
    toBottom: Boolean
  }

  connect() {
    if (this.toBottomValue) {
      let element = this.element;
      element.scrollTo({top: element.scrollHeight});
    }
  }
}
