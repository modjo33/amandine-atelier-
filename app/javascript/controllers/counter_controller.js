import { Controller } from "@hotwired/stimulus"

// Animated counter: <span data-controller="counter" data-counter-target-value="50" data-counter-suffix-value="+">0</span>
export default class extends Controller {
  static values = {
    target: { type: Number, default: 0 },
    suffix: { type: String, default: "" },
    prefix: { type: String, default: "" },
    duration: { type: Number, default: 2000 }
  }

  connect() {
    this.element.textContent = this.prefixValue + "0" + this.suffixValue
    this.hasAnimated = false

    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting && !this.hasAnimated) {
            this.hasAnimated = true
            this.animate()
            this.observer.unobserve(entry.target)
          }
        })
      },
      { threshold: 0.3 }
    )

    this.observer.observe(this.element)
  }

  animate() {
    const target = this.targetValue
    const duration = this.durationValue
    const start = performance.now()

    const step = (now) => {
      const progress = Math.min((now - start) / duration, 1)
      // Ease out cubic
      const eased = 1 - Math.pow(1 - progress, 3)
      const current = Math.round(eased * target)
      this.element.textContent = this.prefixValue + current + this.suffixValue

      if (progress < 1) {
        requestAnimationFrame(step)
      }
    }

    requestAnimationFrame(step)
  }

  disconnect() {
    if (this.observer) this.observer.disconnect()
  }
}
