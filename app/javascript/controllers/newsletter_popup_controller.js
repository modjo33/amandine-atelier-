import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay", "panel", "formWrapper", "success", "firstName", "email", "submitBtn", "errorMessage", "formElement"]

  static values = { delay: { type: Number, default: 10000 } }

  connect() {
    if (localStorage.getItem("popup_seen")) return

    this.timeout = setTimeout(() => this.open(), this.delayValue)
  }

  disconnect() {
    if (this.timeout) clearTimeout(this.timeout)
  }

  open() {
    console.log("[popup] opening")
    this.element.style.display = "block"
    requestAnimationFrame(() => {
      this.overlayTarget.style.opacity = "1"
      this.panelTarget.style.transform = "translateX(0)"
    })
  }

  close() {
    localStorage.setItem("popup_seen", "true")
    this.overlayTarget.style.opacity = "0"
    this.panelTarget.style.transform = "translateX(100%)"
    setTimeout(() => { this.element.style.display = "none" }, 500)
  }

  closeOnBackground(event) {
    if (event.target === this.overlayTarget) this.close()
  }

  closeOnEscape(event) {
    if (event.key === "Escape") this.close()
  }

  async submit(event) {
    event.preventDefault()

    this.submitBtnTarget.disabled = true
    this.submitBtnTarget.textContent = "Envoi..."
    this.errorMessageTarget.style.display = "none"

    const csrfToken = document.querySelector("meta[name='csrf-token']")?.content

    try {
      const response = await fetch(this.formElementTarget.action, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": csrfToken
        },
        body: JSON.stringify({
          subscriber: {
            first_name: this.firstNameTarget.value.trim(),
            email: this.emailTarget.value.trim(),
            source: "web"
          }
        })
      })

      const data = await response.json()

      if (response.ok) {
        this.formWrapperTarget.style.display = "none"
        this.successTarget.style.display = "block"
        localStorage.setItem("popup_seen", "true")
      } else {
        this.errorMessageTarget.textContent = data.errors.join(", ")
        this.errorMessageTarget.style.display = "block"
        this.submitBtnTarget.disabled = false
        this.submitBtnTarget.textContent = "Je reçois ma vidéo →"
      }
    } catch {
      this.errorMessageTarget.textContent = "Une erreur est survenue. Réessayez."
      this.errorMessageTarget.style.display = "block"
      this.submitBtnTarget.disabled = false
      this.submitBtnTarget.textContent = "Je reçois ma vidéo →"
    }
  }
}
