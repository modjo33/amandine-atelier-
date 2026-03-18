module Admin::SiteContentsHelper
  SECTIONS = {
    "hero" => { label: "Hero", icon: "🏠", description: "Section d'accueil principale" },
    "marquee" => { label: "Bandeau défilant", icon: "📢", description: "Texte défilant sous le hero" },
    "problem" => { label: "Problème", icon: "❓", description: "Les 3 cartes problème" },
    "solution" => { label: "Solution", icon: "💡", description: "Section À propos / Mon rôle" },
    "offers" => { label: "Offres", icon: "🎯", description: "Les 3 piliers (Stratégie, Formation, Organisation)" },
    "testimonials" => { label: "Témoignages", icon: "💬", description: "Les avis clients" },
    "newsletter" => { label: "Newsletter", icon: "📧", description: "Section inscription newsletter" },
    "instagram" => { label: "Instagram", icon: "📸", description: "Lien et handle Instagram" },
    "footer" => { label: "Footer", icon: "📋", description: "Pied de page" }
  }.freeze

  CONTENT_LABELS = {
    "hero_tagline" => "Accroche (sous-titre)",
    "hero_title" => "Titre principal",
    "hero_description" => "Description",
    "hero_cta_primary" => "Bouton principal",
    "hero_cta_secondary" => "Bouton secondaire",
    "hero_image" => "Photo hero",
    "marquee_prefix" => "Texte avant le chiffre",
    "marquee_highlight" => "Chiffre mis en avant",
    "marquee_suffix" => "Texte après le chiffre",
    "problem_title" => "Titre de la section",
    "problem_card1_title" => "Carte 1 — Titre",
    "problem_card1_text" => "Carte 1 — Texte",
    "problem_card2_title" => "Carte 2 — Titre",
    "problem_card2_text" => "Carte 2 — Texte",
    "problem_card3_title" => "Carte 3 — Titre",
    "problem_card3_text" => "Carte 3 — Texte",
    "solution_subtitle" => "Sur-titre",
    "solution_title" => "Titre principal",
    "solution_tagline" => "Accroche cursive",
    "solution_text1" => "Paragraphe 1",
    "solution_text2" => "Paragraphe 2",
    "solution_cta" => "Texte du bouton",
    "solution_image" => "Photo portrait",
    "offers_tagline" => "Accroche cursive",
    "offers_title" => "Titre de la section",
    "offer1_title" => "Offre 1 — Titre",
    "offer1_text" => "Offre 1 — Description",
    "offer2_title" => "Offre 2 — Titre",
    "offer2_text" => "Offre 2 — Description",
    "offer3_title" => "Offre 3 — Titre",
    "offer3_text" => "Offre 3 — Description",
    "testimonial1_quote" => "Témoignage 1 — Citation",
    "testimonial1_name" => "Témoignage 1 — Nom",
    "testimonial1_role" => "Témoignage 1 — Poste",
    "testimonial2_quote" => "Témoignage 2 — Citation",
    "testimonial2_name" => "Témoignage 2 — Nom",
    "testimonial2_role" => "Témoignage 2 — Poste",
    "testimonial3_quote" => "Témoignage 3 — Citation",
    "testimonial3_name" => "Témoignage 3 — Nom",
    "testimonial3_role" => "Témoignage 3 — Poste",
    "newsletter_title" => "Titre",
    "newsletter_text" => "Texte descriptif",
    "instagram_handle" => "Nom du compte (@…)",
    "instagram_url" => "Lien Instagram",
    "footer_tagline" => "Accroche cursive",
    "footer_description" => "Description"
  }.freeze

  def section_info(section)
    SECTIONS[section] || { label: section.humanize, icon: "📄", description: "" }
  end

  def content_label(key)
    CONTENT_LABELS[key] || key.humanize
  end
end
