import { Controller } from "@hotwired/stimulus"

// Supports data-reveal-direction="up|left|right|scale" and data-reveal-delay="200"
export default class extends Controller {
  connect() {
    const direction = this.element.dataset.revealDirection || "up"
    const delay = parseInt(this.element.dataset.revealDelay || "0", 10)

    this.element.style.opacity = "0"
    this.element.style.willChange = "transform, opacity"

    switch (direction) {
      case "left":
        this.element.style.transform = "translateX(-60px)"; break
      case "right":
        this.element.style.transform = "translateX(60px)"; break
      case "scale":
        this.element.style.transform = "scale(0.9)"; break
      default:
        this.element.style.transform = "translateY(40px)"
    }

    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setTimeout(() => {
              entry.target.style.transition = "opacity 0.8s cubic-bezier(0.16,1,0.3,1), transform 0.8s cubic-bezier(0.16,1,0.3,1)"
              entry.target.style.opacity = "1"
              entry.target.style.transform = "translate(0) scale(1)"
            }, delay)
            this.observer.unobserve(entry.target)
          }
        })
      },
      { threshold: 0.1 }
    )

    this.observer.observe(this.element)
  }

  disconnect() {
    if (this.observer) this.observer.disconnect()
  }
}
