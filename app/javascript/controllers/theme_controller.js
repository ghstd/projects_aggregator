import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["themePointer"]

  switchTheme(event) {
		const pointer = this.themePointerTarget
		const button = event.currentTarget
		const theme = button.dataset.theme

		pointer.classList.remove("theme_switcher__pointer--light", "theme_switcher__pointer--middle", "theme_switcher__pointer--dark")
		pointer.classList.add(`theme_switcher__pointer--${theme}`)

		this.element.querySelectorAll(".theme_switcher__button").forEach((el) => {
			el.classList.remove("theme_switcher__button--active")
		})
		button.classList.add("theme_switcher__button--active")
	}
}
