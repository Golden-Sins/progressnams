import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time"
export default class extends Controller {
  static targets = ["time"]
  connect() {
    this.updateTime()
    setInterval(() => this.updateTime(), 1000)
  }
  disconnect() {
    clearInterval(this.interval)
  }
  updateTime() {
    this.timeTarget.innerHTML = new Date().toLocaleDateString() + ' ' + new Date().toLocaleTimeString()
  }
}
