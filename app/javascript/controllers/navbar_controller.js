import { Controller } from "@hotwired/stimulus"

// Navbar: transparent at top, solid on scroll + mobile burger
export default class extends Controller {
  static targets = ["menu", "burger"]

  connect() {
    this.scrolled = false
    this.menuOpen = false
    this.onScroll = this.handleScroll.bind(this)
    window.addEventListener("scroll", this.onScroll, { passive: true })
    this.handleScroll()
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll)
  }

  handleScroll() {
    const scrolled = window.scrollY > 50
    if (scrolled !== this.scrolled) {
      this.scrolled = scrolled
      if (scrolled) {
        this.element.style.background = "rgba(255,255,255,0.96)"
        this.element.style.backdropFilter = "blur(12px)"
        this.element.style.boxShadow = "0 4px 30px rgba(172,97,103,0.08)"
      } else {
        this.element.style.background = "rgba(255,255,255,0.85)"
        this.element.style.backdropFilter = "blur(6px)"
        this.element.style.boxShadow = "none"
      }
    }
  }

  toggleMenu() {
    this.menuOpen = !this.menuOpen
    if (this.hasMenuTarget) {
      if (this.menuOpen) {
        this.menuTarget.style.display = "flex"
        requestAnimationFrame(() => {
          this.menuTarget.style.opacity = "1"
          this.menuTarget.style.transform = "translateY(0)"
        })
      } else {
        this.menuTarget.style.opacity = "0"
        this.menuTarget.style.transform = "translateY(-10px)"
        setTimeout(() => { this.menuTarget.style.display = "none" }, 300)
      }
    }
    // Animate burger icon
    if (this.hasBurgerTarget) {
      this.burgerTarget.classList.toggle("burger-open", this.menuOpen)
    }
  }
}
