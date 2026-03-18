import { Controller } from "@hotwired/stimulus"

// Animations rejouées à chaque passage dans le viewport
// data-reveal-direction="up|left|right|scale"
// data-reveal-delay="200"
export default class extends Controller {
  connect() {
    this.direction = this.element.dataset.revealDirection || "up"
    this.delay = parseInt(this.element.dataset.revealDelay || "0", 10)

    this.element.style.willChange = "transform, opacity"
    this.element.style.transition = "opacity 0.8s cubic-bezier(0.16,1,0.3,1), transform 0.8s cubic-bezier(0.16,1,0.3,1)"
    this.hide()

    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            this.showTimeout = setTimeout(() => this.show(), this.delay)
          } else {
            if (this.showTimeout) clearTimeout(this.showTimeout)
            this.hide()
          }
        })
      },
      { threshold: 0.1 }
    )

    this.observer.observe(this.element)
  }

  show() {
    this.element.style.opacity = "1"
    this.element.style.transform = "translate(0) scale(1)"
  }

  hide() {
    this.element.style.opacity = "0"
    switch (this.direction) {
      case "left":
        this.element.style.transform = "translateX(-60px)"; break
      case "right":
        this.element.style.transform = "translateX(60px)"; break
      case "scale":
        this.element.style.transform = "scale(0.9)"; break
      default:
        this.element.style.transform = "translateY(40px)"
    }
  }

  disconnect() {
    if (this.observer) this.observer.disconnect()
    if (this.showTimeout) clearTimeout(this.showTimeout)
  }
}
