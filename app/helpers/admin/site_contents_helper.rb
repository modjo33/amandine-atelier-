module Admin::SiteContentsHelper
  SECTIONS = {
    "hero" => { label: "Hero", icon: "🏠", description: "Section d'accueil principale" },
    "marquee" => { label: "Bandeau défilant", icon: "📢", description: "Texte défilant sous le hero" },
    "problem" => { label: "Problème", icon: "❓", description: "Les 3 cartes problème" },
    "solution" => { label: "Solution", icon: "💡", description: "Section À propos / Mon rôle" },
    "offers" => { label: "Offres", icon: "🎯", description: "Les 4 offres : card courte + détails de la modal « En savoir plus »" },
    "testimonials" => { label: "Témoignages", icon: "💬", description: "Les avis clients" },
    "newsletter" => { label: "Newsletter", icon: "📧", description: "Section inscription newsletter" },
    "instagram" => { label: "Instagram", icon: "📸", description: "Lien et handle Instagram" },
    "counters" => { label: "Chiffres clés", icon: "🔢", description: "Les compteurs animés (stats)" },
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
    "offers_tagline" => "Accroche cursive (au-dessus du titre)",
    "offers_title"   => "Titre de la section",

    # Offre 1 — Temps Partagé / Gestion déléguée
    "offer1_title"          => "Offre 1 — Nom (ex: Temps Partagé)",
    "offer1_subtitle"       => "Offre 1 — Sous-titre (ex: Gestion déléguée)",
    "offer1_price"          => "Offre 1 — Prix (ex: 950 € / mois)",
    "offer1_badge"          => "Offre 1 — Badge optionnel sous le prix (ex: 💼 Financement OPCO, laisser vide si rien)",
    "offer1_for_who"        => "Offre 1 — Pour qui ? (texte court — sur la card)",
    "offer1_text"           => "Offre 1 — Description (texte court — sur la card)",
    "offer1_promesse"       => "Offre 1 — Modal : Promesse (italique encadré)",
    "offer1_comprend"       => "Offre 1 — Modal : Ce que comprend l'offre (1 item par ligne)",
    "offer1_benefice"       => "Offre 1 — Modal : Bénéfice client",

    # Offre 2 — Coup de Pouce / Accompagnement ponctuel
    "offer2_title"          => "Offre 2 — Nom (ex: Coup de Pouce)",
    "offer2_subtitle"       => "Offre 2 — Sous-titre (ex: Accompagnement ponctuel)",
    "offer2_price"          => "Offre 2 — Prix (ex: 140 € / 2 h)",
    "offer2_badge"          => "Offre 2 — Badge optionnel sous le prix (laisser vide si rien)",
    "offer2_for_who"        => "Offre 2 — Pour qui ? (texte court — sur la card)",
    "offer2_text"           => "Offre 2 — Description (texte court — sur la card)",
    "offer2_promesse"       => "Offre 2 — Modal : Promesse (italique encadré)",
    "offer2_comprend"       => "Offre 2 — Modal : Ce que comprend l'offre (1 item par ligne)",
    "offer2_benefice"       => "Offre 2 — Modal : Bénéfice client",

    # Offre 3 — Cap Réseaux / Accompagnement stratégique
    "offer3_title"          => "Offre 3 — Nom (ex: Cap Réseaux)",
    "offer3_subtitle"       => "Offre 3 — Sous-titre (ex: Accompagnement stratégique)",
    "offer3_price"          => "Offre 3 — Prix (ex: 200 € / demi-journée)",
    "offer3_badge"          => "Offre 3 — Badge optionnel sous le prix (laisser vide si rien)",
    "offer3_for_who"        => "Offre 3 — Pour qui ? (texte court — sur la card)",
    "offer3_text"           => "Offre 3 — Description (texte court — sur la card)",
    "offer3_promesse"       => "Offre 3 — Modal : Promesse (italique encadré)",
    "offer3_comprend"       => "Offre 3 — Modal : Ce que comprend l'offre (1 item par ligne)",
    "offer3_benefice"       => "Offre 3 — Modal : Bénéfice client",

    # Offre 4 — Autonomie Réseaux / Sur-mesure
    "offer4_title"          => "Offre 4 — Nom (ex: Autonomie Réseaux)",
    "offer4_subtitle"       => "Offre 4 — Sous-titre (ex: Accompagnement sur-mesure)",
    "offer4_price"          => "Offre 4 — Prix (ex: 1 200 € / 3 mois)",
    "offer4_badge"          => "Offre 4 — Badge optionnel sous le prix (ex: 💼 Possibilité de financement OPCO)",
    "offer4_for_who"        => "Offre 4 — Pour qui ? (texte court — sur la card)",
    "offer4_text"           => "Offre 4 — Description (texte court — sur la card)",
    "offer4_promesse"       => "Offre 4 — Modal : Promesse (italique encadré)",
    "offer4_comprend"       => "Offre 4 — Modal : Ce que comprend l'offre (1 item par ligne)",
    "offer4_benefice"       => "Offre 4 — Modal : Bénéfice client",
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
    "instagram_embed_id" => "ID widget Elfsight (ex: xxxxxxxx-xxxx-xxxx-xxxx)",
    "counter1_number" => "Compteur 1 — Chiffre",
    "counter1_suffix" => "Compteur 1 — Suffixe (+, %, h…)",
    "counter1_label" => "Compteur 1 — Label",
    "counter2_number" => "Compteur 2 — Chiffre",
    "counter2_suffix" => "Compteur 2 — Suffixe",
    "counter2_label" => "Compteur 2 — Label",
    "counter3_number" => "Compteur 3 — Chiffre",
    "counter3_suffix" => "Compteur 3 — Suffixe",
    "counter3_label" => "Compteur 3 — Label",
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
