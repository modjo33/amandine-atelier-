# Seed site contents - idempotent (find_or_create_by key)

contents = [
  # ── Hero ──
  { key: "hero_tagline", value: "Stratégie • Formation • Organisation", content_type: "text", section: "hero", position: 1 },
  { key: "hero_title", value: "Tu gères la com'… mais c'est pas ton job ?", content_type: "text", section: "hero", position: 2 },
  { key: "hero_description", value: "Je t'aide à structurer ta communication digitale pour qu'elle devienne un vrai levier business, sans y passer ta vie.", content_type: "text", section: "hero", position: 3 },
  { key: "hero_cta_primary", value: "Découvrir la méthode", content_type: "text", section: "hero", position: 4 },
  { key: "hero_cta_secondary", value: "Voir mon Instagram", content_type: "text", section: "hero", position: 5 },
  { key: "hero_image", value: "", content_type: "image", section: "hero", position: 6 },

  # ── Marquee ──
  { key: "marquee_prefix", value: "Les Français passent", content_type: "text", section: "marquee", position: 1 },
  { key: "marquee_highlight", value: "3 à 5h/jour", content_type: "text", section: "marquee", position: 2 },
  { key: "marquee_suffix", value: "sur les réseaux — Ton entreprise est-elle visible ?", content_type: "text", section: "marquee", position: 3 },

  # ── Problème ──
  { key: "problem_title", value: "Tu passes des heures sur les réseaux sans résultats ?", content_type: "text", section: "problem", position: 1 },
  { key: "problem_card1_title", value: "Temps perdu", content_type: "text", section: "problem", position: 2 },
  { key: "problem_card1_text", value: "Des heures à publier du contenu sans stratégie claire ni retour concret.", content_type: "text", section: "problem", position: 3 },
  { key: "problem_card2_title", value: "Énergie gaspillée", content_type: "text", section: "problem", position: 4 },
  { key: "problem_card2_text", value: "Ton équipe s'épuise sur des tâches qui ne font pas partie de son métier.", content_type: "text", section: "problem", position: 5 },
  { key: "problem_card3_title", value: "Peu de visibilité", content_type: "text", section: "problem", position: 6 },
  { key: "problem_card3_text", value: "Aucun prospect chaud, peu d'engagement et une présence qui ne décolle pas.", content_type: "text", section: "problem", position: 7 },

  # ── Solution ──
  { key: "solution_subtitle", value: "Mon rôle", content_type: "text", section: "solution", position: 1 },
  { key: "solution_title", value: "Te rendre autonome.", content_type: "text", section: "solution", position: 2 },
  { key: "solution_tagline", value: "sans que ce soit ton métier premier.", content_type: "text", section: "solution", position: 3 },
  { key: "solution_text1", value: "Je ne gère pas tes réseaux à ta place.", content_type: "text", section: "solution", position: 4 },
  { key: "solution_text2", value: "Je forme ton équipe, je construis ta stratégie, je t'organise pour attirer les bonnes personnes et générer des prospects chauds pour ton service commercial.", content_type: "text", section: "solution", position: 5 },
  { key: "solution_cta", value: "Voir les offres", content_type: "text", section: "solution", position: 6 },
  { key: "solution_image", value: "", content_type: "image", section: "solution", position: 7 },

  # ── Offres ──
  { key: "offers_tagline", value: "Ce que je propose", content_type: "text", section: "offers", position: 1 },
  { key: "offers_title", value: "Trois piliers pour ta com'", content_type: "text", section: "offers", position: 2 },
  { key: "offer1_title", value: "Audit-Stratégie", content_type: "text", section: "offers", position: 3 },
  { key: "offer1_text", value: "Je construis ta stratégie digitale sur-mesure pour attirer les bonnes personnes.", content_type: "text", section: "offers", position: 4 },
  { key: "offer2_title", value: "Atelier Digital", content_type: "text", section: "offers", position: 5 },
  { key: "offer2_text", value: "Je forme ton équipe à créer du contenu qui convertit, sans y passer sa vie.", content_type: "text", section: "offers", position: 6 },
  { key: "offer3_title", value: "Community Management", content_type: "text", section: "offers", position: 7 },
  { key: "offer3_text", value: "Je structure ta création de contenu pour gagner en efficacité et en visibilité.", content_type: "text", section: "offers", position: 8 },

  # ── Témoignages ──
  { key: "testimonial1_quote", value: "Amandine a transformé notre approche des réseaux. En 3 mois, notre équipe est devenue complètement autonome.", content_type: "text", section: "testimonials", position: 1 },
  { key: "testimonial1_name", value: "Marie L.", content_type: "text", section: "testimonials", position: 2 },
  { key: "testimonial1_role", value: "Directrice marketing", content_type: "text", section: "testimonials", position: 3 },
  { key: "testimonial2_quote", value: "La formation était ultra concrète. On a enfin une stratégie claire et des résultats mesurables.", content_type: "text", section: "testimonials", position: 4 },
  { key: "testimonial2_name", value: "Sophie D.", content_type: "text", section: "testimonials", position: 5 },
  { key: "testimonial2_role", value: "Fondatrice PME", content_type: "text", section: "testimonials", position: 6 },
  { key: "testimonial3_quote", value: "Grâce à l'organisation mise en place, on publie régulièrement sans stress. Les leads arrivent tout seuls.", content_type: "text", section: "testimonials", position: 7 },
  { key: "testimonial3_name", value: "Camille R.", content_type: "text", section: "testimonials", position: 8 },
  { key: "testimonial3_role", value: "Responsable communication", content_type: "text", section: "testimonials", position: 9 },

  # ── Newsletter ──
  { key: "newsletter_title", value: "Reçois des conseils gratuits", content_type: "text", section: "newsletter", position: 1 },
  { key: "newsletter_text", value: "Stratégie, contenu, organisation — directement dans ta boîte mail, chaque semaine.", content_type: "text", section: "newsletter", position: 2 },

  # ── Instagram ──
  { key: "instagram_handle", value: "@amandine_atelier_digital", content_type: "text", section: "instagram", position: 1 },
  { key: "instagram_url", value: "https://www.instagram.com/amandine_atelier_digital", content_type: "text", section: "instagram", position: 2 },
  { key: "instagram_embed_id", value: "", content_type: "text", section: "instagram", position: 3 },

  # ── Chiffres clés ──
  { key: "counter1_number", value: "50", content_type: "text", section: "counters", position: 1 },
  { key: "counter1_suffix", value: "+", content_type: "text", section: "counters", position: 2 },
  { key: "counter1_label", value: "Entreprises accompagnées", content_type: "text", section: "counters", position: 3 },
  { key: "counter2_number", value: "3", content_type: "text", section: "counters", position: 4 },
  { key: "counter2_suffix", value: "h", content_type: "text", section: "counters", position: 5 },
  { key: "counter2_label", value: "Gagnées par semaine", content_type: "text", section: "counters", position: 6 },
  { key: "counter3_number", value: "95", content_type: "text", section: "counters", position: 7 },
  { key: "counter3_suffix", value: "%", content_type: "text", section: "counters", position: 8 },
  { key: "counter3_label", value: "De satisfaction client", content_type: "text", section: "counters", position: 9 },

  # ── Footer ──
  { key: "footer_tagline", value: "Stratégie & sérénité", content_type: "text", section: "footer", position: 1 },
  { key: "footer_description", value: "Formation et organisation pour ta communication digitale.", content_type: "text", section: "footer", position: 2 }
]

contents.each do |attrs|
  SiteContent.find_or_create_by!(key: attrs[:key]) do |sc|
    sc.value = attrs[:value]
    sc.content_type = attrs[:content_type]
    sc.section = attrs[:section]
    sc.position = attrs[:position]
  end
end

puts "✓ #{SiteContent.count} contenus créés/vérifiés"

# ── Testimonials ──
testimonials = [
  { quote: "En 3 mois, ma visibilité a explosé. Amandine a su capter l'essence de ma marque et la traduire en stratégie concrète.", name: "Marie L.", role: "Créatrice de bijoux", position: 1 },
  { quote: "Je me sentais perdue avec les réseaux sociaux. Aujourd'hui j'ai un planning clair et des résultats mesurables.", name: "Sophie D.", role: "Fondatrice PME", position: 2 },
  { quote: "Grâce à l'organisation mise en place, on publie régulièrement sans stress. Les leads arrivent tout seuls.", name: "Camille R.", role: "Responsable communication", position: 3 }
]

testimonials.each do |attrs|
  Testimonial.find_or_create_by!(name: attrs[:name]) do |t|
    t.quote = attrs[:quote]
    t.role = attrs[:role]
    t.position = attrs[:position]
  end
end

puts "✓ #{Testimonial.count} témoignages créés/vérifiés"
