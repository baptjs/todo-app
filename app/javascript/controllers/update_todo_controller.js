import { Controller } from "stimulus"

export default class extends Controller {

  submit() {
    event.target.closest("form").submit();
  }
}