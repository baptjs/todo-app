import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = ["details"]

  submit() {
    event.target.closest("form").submit();
  }

  showdetails() {
    event.target.nextElementSibling.classList.toggle('d-none');
  }
}