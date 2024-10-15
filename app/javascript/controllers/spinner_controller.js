import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	connect() {
		document.addEventListener("turbo:submit-start", this.showSpinner.bind(this))
		document.addEventListener("turbo:submit-end", this.hideSpinner.bind(this))
	}

	disconnect() {
		document.removeEventListener("turbo:submit-start", this.showSpinner.bind(this))
		document.removeEventListener("turbo:submit-end", this.hideSpinner.bind(this))
	}

	showSpinner() {
		this.element.style.display = "block"
	}

	hideSpinner() {
		this.element.style.display = "none"
	}
}
