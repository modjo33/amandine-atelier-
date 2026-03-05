import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.style.opacity = "0"
    this.element.style.transform = "translateY(32px)"

    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.style.transition = "all 600ms ease"
            entry.target.style.opacity = "1"
            entry.target.style.transform = "translateY(0)"
            this.observer.unobserve(entry.target)
          }
        })
      },
      { threshold: 0.15 }
    )

    this.observer.observe(this.element)
  }

  disconnect() {
    if (this.observer) this.observer.disconnect()
  }
}
