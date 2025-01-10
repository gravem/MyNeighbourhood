import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="toggle-map"
export default class extends Controller {
  static targets = ['toggle'];

  connect() {
    console.log('Hello from the toggle map controller');
  }

  fire(event) {
    event.preventDefault();
    this.toggleTarget.classList.toggle('d-none');
  }
}
