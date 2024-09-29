import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	connect() {
    document.addEventListener("click", this.hideOnClickOutside.bind(this))
  }

  disconnect() {
    document.removeEventListener("click", this.hideOnClickOutside.bind(this))
  }

  show(event) {
		// event.stopPropagation()
		this.element.classList.toggle("lang_switcher--active")
  }

	hideOnClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.element.classList.remove("lang_switcher--active")
    }
  }
}
