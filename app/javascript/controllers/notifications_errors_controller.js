import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	// connect() {
	// 	const observer = new MutationObserver((mutations) => {
	// 		mutations.forEach((mutation) => {
	// 			console.log('Содержимое элемента изменилось:', mutation)
	// 		})
	// 	})
	// 	const config = { childList: true, subtree: true }
	// 	observer.observe(this.element, config)
	// }

	close() {
		// this.element.remove()
		this.element.innerHTML  = ""
	}
}
