import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {

  submit() {
    Rails.fire(event.target.closest("form"), "submit");
  }

  showdetails() {
    event.target.nextElementSibling.classList.toggle('d-none');
  }
}