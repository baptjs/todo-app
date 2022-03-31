import { Controller } from "stimulus"
import Rails from "@rails/ujs";
// if (Rails.fire(document, "rails:attachBindings")) {
//   Rails.start();
// }

export default class extends Controller {
  // static targets = ["details"]

  submit() {
    Rails.fire(event.target.closest("form"), "submit");
    // event.target.closest("form").submit();
  }

  showdetails() {
    event.target.nextElementSibling.classList.toggle('d-none');
  }
}