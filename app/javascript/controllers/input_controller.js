import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url", "display"  ]

  initialize(){
    this.displayTarget.classList.add('textMessage')
  }

  connect() {
    this.displayTarget.textContent = "Honey, let's shrink the urls!"
  }

  async shorten() {
    const fetchAddress = `/app?url=${'http://' + this.url}`
    const newKey = await fetch(fetchAddress, {method: 'post'}).then((response) => response.json()).then((data) => data.short)
    this.displayTarget.textContent = `localhost:3000/${newKey}`
    this.displayTarget.href = `http://localhost:3000/${newKey}`
    this.displayTarget.classList.remove('textMessage')
    this.displayTarget.classList.add('shortLink')
  }

  get url() {
    return this.urlTarget.value
  }
}
