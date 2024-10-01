import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["themePointer"]

  switchTheme(event) {
		const pointer = this.themePointerTarget
		const button = event.currentTarget
		const theme = button.dataset.switch_theme

		if (button.classList.contains("theme_switcher__button--active")) return

		pointer.classList.remove("theme_switcher__pointer--light", "theme_switcher__pointer--middle", "theme_switcher__pointer--dark")
		pointer.classList.add(`theme_switcher__pointer--${theme}`)

		this.element.querySelectorAll(".theme_switcher__button").forEach((el) => {
			el.classList.remove("theme_switcher__button--active")
		})
		button.classList.add("theme_switcher__button--active")

		document.body.setAttribute("data-theme", theme)
		document.cookie = `theme=${theme}; path=/; max-age=2592000; SameSite=Lax`
	}
}
