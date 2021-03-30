import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url", "display"  ]

  initialize(){
    this.displayTarget.classList.add('textMessage')
  }

  connect() {
    this.displayTarget.textContent = "Honey, let's shrink the urls!"
  }

  shorten() {
    this.displayTarget.textContent = `localhost:3000/${this.url}`
    this.displayTarget.href = `http://localhost:3000/${this.url}`
    this.displayTarget.classList.remove('textMessage')
    this.displayTarget.classList.add('shortLink')
  }

  get url() {
    return this.urlTarget.value
  }
}
