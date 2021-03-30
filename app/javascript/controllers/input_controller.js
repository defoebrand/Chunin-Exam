import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url", "display"  ]

  initialize(){
    this.displayTarget.classList.add('textMessage')
  }

  connect() {
    this.displayTarget.textContent = "Honey, let's shrink the urls!"
  }
  
  sanitizeInput(url) {
    const httpRegEx = new RegExp(/^[http://]|[https://]/);
    const httpUrl = httpRegEx.test(url) ? url : 'http://' + url
    return httpUrl
  }

  async shorten() {
    const domain = 'localhost:3000/'
    const fetchAddress = `/app?url=${this.sanitizeInput(this.url)}`
    const shortKey = await fetch(fetchAddress, {method: 'post'}).then((response) => response.json()).then((data) => data.short)
    this.displayTarget.textContent = `${domain}${shortKey}`
    this.displayTarget.href = `http://${domain}${shortKey}`
    this.displayTarget.classList.remove('textMessage')
    this.displayTarget.classList.add('shortLink')
  }

  get url() {
    return this.urlTarget.value
  }
}
