import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	static targets = ['form']

  show(event) {
		const button = event.currentTarget
		const form = this.formTarget
		button.classList.toggle("replies__button--active")
		form.classList.toggle("replies__form--active")
  }
}
