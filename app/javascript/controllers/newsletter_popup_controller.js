import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay", "formWrapper", "success", "firstName", "email", "submitBtn", "errorMessage", "formElement"]

  static values = { delay: { type: Number, default: 3000 } }

  connect() {
    if (localStorage.getItem("popup_seen")) return

    this.timeout = setTimeout(() => this.open(), this.delayValue)
  }

  disconnect() {
    if (this.timeout) clearTimeout(this.timeout)
  }

  open() {
    this.element.classList.remove("hidden")
    requestAnimationFrame(() => {
      this.overlayTarget.classList.remove("opacity-0")
      this.overlayTarget.classList.add("opacity-100")
    })
  }

  close() {
    localStorage.setItem("popup_seen", "true")
    this.overlayTarget.classList.remove("opacity-100")
    this.overlayTarget.classList.add("opacity-0")
    setTimeout(() => this.element.classList.add("hidden"), 300)
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
    this.errorMessageTarget.classList.add("hidden")

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
        this.formWrapperTarget.classList.add("hidden")
        this.successTarget.classList.remove("hidden")
        localStorage.setItem("popup_seen", "true")
      } else {
        this.errorMessageTarget.textContent = data.errors.join(", ")
        this.errorMessageTarget.classList.remove("hidden")
        this.submitBtnTarget.disabled = false
        this.submitBtnTarget.textContent = "Je reçois ma vidéo →"
      }
    } catch {
      this.errorMessageTarget.textContent = "Une erreur est survenue. Réessayez."
      this.errorMessageTarget.classList.remove("hidden")
      this.submitBtnTarget.disabled = false
      this.submitBtnTarget.textContent = "Je reçois ma vidéo →"
    }
  }
}
