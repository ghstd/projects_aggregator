import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  open(event) {
		const img = event.currentTarget
		const modal = document.getElementById("modal")
		const modalImage = modal.querySelector(".modal__image")

		document.body.classList.add("no-scroll")
		modal.classList.add("modal--active")
		modalImage.src = img.src
		
		modal.addEventListener("click", () => {
			modal.classList.add("modal--decrease")

			setTimeout(() => {
				document.body.classList.remove("no-scroll")
				modal.classList.remove("modal--active")
				modal.classList.remove("modal--decrease")
			}, 250)
		}, { once: true })
  }

}
