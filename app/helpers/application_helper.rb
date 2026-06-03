module ApplicationHelper
  def c(key)
    @c&.dig(key)&.value.to_s
  end

  def c_image(key)
    record = @c&.dig(key)
    record&.image&.attached? ? record.image : nil
  end

  # Extrait l'UUID du widget Elfsight, que l'admin colle juste l'ID
  # ou tout le code d'intégration (commentaire + <script> + <div>).
  def elfsight_app_id
    c("instagram_embed_id")[/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i]
  end
end
