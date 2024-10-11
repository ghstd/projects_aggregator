import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	static targets = ['form']

	connect() {
		document.addEventListener("turbo:before-stream-render", this.turboStreamHandler.bind(this))
	}

	disconnect() {
		document.removeEventListener("turbo:before-stream-render", this.turboStreamHandler.bind(this))
	}

	turboStreamHandler(event) {
		const target = this.element.querySelector('ul[id]')

		if (event.detail.newStream.target === target.id) {
			const button = this.element.querySelector('.replies__button')
			const form = this.formTarget
			const textArea = form.querySelector('textarea')
			button.classList.toggle("replies__button--active")
			form.classList.toggle("replies__form--active")
			textArea.value = ""
		}
	}

  show(event) {
		const button = event.currentTarget
		const form = this.formTarget
		button.classList.toggle("replies__button--active")
		form.classList.toggle("replies__form--active")
  }
}
