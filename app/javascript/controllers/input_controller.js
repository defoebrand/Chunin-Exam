import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url", "display", "testing" ]

  initialize(){
    this.displayTarget.classList.add('textMessage')
  }

  connect() {
    // this.displayTarget.textContent = "Honey, let's shrink the urls!"
  }
  
  sanitizeInput(url) {
    const httpRegEx = new RegExp(/^[http://]|[https://]/);
    const httpUrl = httpRegEx.test(url) ? url : 'http://' + url
    return httpUrl
  }

  shorten() {
    console.log(this.test3)
    const domain = 'localhost:3000/'
    // this.displayTarget.textContent = `${domain}${this.test3}`
    // this.displayTarget.href = `http://${domain}${this.test3}`
    this.displayTarget.classList.remove('textMessage')
    this.displayTarget.classList.add('shortLink')
  }

  get url() {
    return this.urlTarget.value
  }
  get test3(){
    return this.testingTarget.attributes.value.nodeValue
  }
}
