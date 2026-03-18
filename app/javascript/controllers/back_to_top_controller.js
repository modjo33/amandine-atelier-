import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.style.opacity = "0"
    this.element.style.pointerEvents = "none"
    this.element.style.transition = "opacity 0.4s ease, transform 0.4s ease"
    this.element.style.transform = "translateY(20px)"

    this.onScroll = this.handleScroll.bind(this)
    window.addEventListener("scroll", this.onScroll, { passive: true })
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll)
  }

  handleScroll() {
    if (window.scrollY > 600) {
      this.element.style.opacity = "1"
      this.element.style.pointerEvents = "auto"
      this.element.style.transform = "translateY(0)"
    } else {
      this.element.style.opacity = "0"
      this.element.style.pointerEvents = "none"
      this.element.style.transform = "translateY(20px)"
    }
  }

  scrollToTop() {
    window.scrollTo({ top: 0, behavior: "smooth" })
  }
}
