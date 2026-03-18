import { Controller } from "@hotwired/stimulus"

// Subtle parallax: moves element slower than scroll
// data-parallax-speed-value="0.15" (default)
export default class extends Controller {
  static values = { speed: { type: Number, default: 0.15 } }

  connect() {
    this.onScroll = this.handleScroll.bind(this)
    window.addEventListener("scroll", this.onScroll, { passive: true })
    this.handleScroll()
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll)
  }

  handleScroll() {
    const rect = this.element.getBoundingClientRect()
    const windowHeight = window.innerHeight
    const elementCenter = rect.top + rect.height / 2
    const offset = (elementCenter - windowHeight / 2) * this.speedValue
    this.element.style.transform = `translateY(${offset}px)`
  }
}
