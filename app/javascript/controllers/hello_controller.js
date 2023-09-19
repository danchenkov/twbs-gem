import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["message", "name"]

  connect() {
    console.log("Connect")
  }
  click() {
    this.messageTarget.textContent = "Hello, " + (this.nameTarget.value || "world")
  }
}
