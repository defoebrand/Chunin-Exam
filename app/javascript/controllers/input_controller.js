import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url", "display"  ]

  initialize(){
    console.log(this.application)
    console.log(this.element)
  }

  connect() {
    this.displayTarget.textContent = "Honey, let's shrink the urls!"
  }

  shorten() {
    console.log(`Hello, ${this.url}!`)
    this.displayTarget.textContent = `http://www.my-domain.com/${this.url}`
  }

  get url() {
    return this.urlTarget.value
  }
}
