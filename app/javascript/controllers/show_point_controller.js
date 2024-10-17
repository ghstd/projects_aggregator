import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	static targets = ["content"]

  show() {
		const box = this.element
		const content = this.contentTarget

		if (box.classList.contains('about_point--active')) {
      content.style.maxHeight = 0
			const gif = content.querySelector("[data-gif-src]")
			if (gif) gif.src = gif.dataset.gifPreview

    } else {
      content.style.maxHeight = content.scrollHeight + 'px'
			const gif = content.querySelector("[data-gif-src]")
			if (gif) gif.src = gif.dataset.gifSrc
    }

		box.classList.toggle("about_point--active")
  }

}
