import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open(event) {
    event.preventDefault()
    event.stopPropagation()

    const offerId = this.element.dataset.offer
    const modal = document.getElementById("modal-" + offerId)
    if (!modal) return

    const overlay = modal.querySelector("[data-overlay]")
    const panel = modal.querySelector("[data-panel]")

    modal.style.display = "flex"
    requestAnimationFrame(function() {
      requestAnimationFrame(function() {
        overlay.style.opacity = "1"
        panel.style.transform = "translateY(0)"
        panel.style.opacity = "1"
      })
    })
    document.body.style.overflow = "hidden"

    function closeModal(e) {
      if (e) e.preventDefault()
      overlay.style.opacity = "0"
      panel.style.transform = "translateY(30px)"
      panel.style.opacity = "0"
      setTimeout(function() { modal.style.display = "none" }, 300)
      document.body.style.overflow = ""
      document.removeEventListener("keydown", onEsc)
      modal.removeEventListener("click", onOverlay)
    }

    function onEsc(e) { if (e.key === "Escape") closeModal(e) }
    function onOverlay(e) { if (e.target.hasAttribute("data-overlay")) closeModal(e) }

    document.addEventListener("keydown", onEsc)
    modal.addEventListener("click", onOverlay)

    var closeBtns = modal.querySelectorAll("[data-close]")
    for (var i = 0; i < closeBtns.length; i++) {
      closeBtns[i].onclick = function(e) { closeModal(e) }
    }
  }
}
