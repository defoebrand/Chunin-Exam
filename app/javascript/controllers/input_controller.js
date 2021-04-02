import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url", "display"  ]

  get url() {
    return this.urlTarget.value
  }

  initialize(){
    this.displayTarget.classList.add('textMessage')
  }

  connect() {
    this.displayTarget.textContent = "Honey, let's shrink the urls!"
  }

  sanitizeInput(url) {
    const httpRegEx = new RegExp(/^(http:\/\/)|(https:\/\/)/);
    const httpUrl = httpRegEx.test(url) ? url : 'http://' + url
    const wwwRegEx = new RegExp(/(^www.)|(:\/\/www.)/);
    const wwwUrl = wwwRegEx.test(httpUrl) ? httpUrl.replace('www.', '') :  httpUrl
    return wwwUrl
  }

  grabUserData({ connection, maxTouchPoints, userAgent, width, height, language, platform }){
    return {
      connection,
      maxTouchPoints,
      userAgent,
      width,
      height,
      language,
      platform
    }
  }

  async shorten() {
    const domain = 'ur-shorty.herokuapp.com/'
    const url = this.sanitizeInput(this.url)
    const data = this.grabUserData(navigator)

    const shortKey = await fetch('/app', {
      method: 'POST',
      body: JSON.stringify({ url, data }),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    }).then((response) => {
      return response.json()
    }).then((data) => data.short)

    this.displayTarget.textContent = `${domain}${shortKey}`
    this.displayTarget.classList.remove('textMessage')
    this.displayTarget.parentNode.classList.add('shortLink')
    this.displayTarget.nextElementSibling.classList.add('show-board')
  }

  copy(){
    if (document.queryCommandSupported("copy")){
      if(!this.displayTarget.classList.contains('textMessage')){
        navigator.clipboard.writeText(this.displayTarget.textContent)
      }
    }
  }
}
