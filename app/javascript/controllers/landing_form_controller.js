import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "success", "firstName", "email", "submit", "errorMessage"]

  async submit(event) {
    event.preventDefault()

    this.submitTarget.disabled = true
    this.submitTarget.textContent = "Envoi en cours..."
    this.errorMessageTarget.classList.add("hidden")

    const csrfToken = document.querySelector("meta[name='csrf-token']")?.content

    try {
      const response = await fetch(this.formTarget.action, {
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
            source: "instagram"
          }
        })
      })

      const data = await response.json()

      if (response.ok) {
        this.formTarget.classList.add("hidden")
        this.successTarget.classList.remove("hidden")
      } else {
        this.errorMessageTarget.textContent = data.errors.join(", ")
        this.errorMessageTarget.classList.remove("hidden")
        this.submitTarget.disabled = false
        this.submitTarget.textContent = "Je reçois ma vidéo gratuite →"
      }
    } catch {
      this.errorMessageTarget.textContent = "Une erreur est survenue. Réessayez."
      this.errorMessageTarget.classList.remove("hidden")
      this.submitTarget.disabled = false
      this.submitTarget.textContent = "Je reçois ma vidéo gratuite →"
    }
  }
}
