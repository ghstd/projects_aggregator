import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	close_banner() {
		document.cookie = "cookies_accepted=true; path=/; max-age=2592000; SameSite=Lax"

		this.element.remove()
	}
}
