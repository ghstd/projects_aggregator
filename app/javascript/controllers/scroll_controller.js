import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	connect() {
		console.log('connect')

	}

	autoScroll() {
		console.log('Auto scrolling...')

    const firstChild = this.element.firstElementChild;
    if (firstChild) {
      firstChild.scrollIntoView({ behavior: "smooth" });
    }
  }

}