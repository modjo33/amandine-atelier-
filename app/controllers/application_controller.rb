class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # En dev on skip pour éviter les 406 sur navigateurs anciens / DevTools mobile / WSL/Edge,
  # en prod on garde le check (les vrais users sont sur des navigateurs récents).
  allow_browser versions: :modern, if: -> { Rails.env.production? }

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # Après connexion d'un admin, rediriger vers le dashboard admin (pas la home publique).
  # Si l'admin a tenté d'accéder à une page protégée, Devise utilise stored_location_for
  # automatiquement, donc on ne casse pas le flow "deep link → login → page demandée".
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      stored_location_for(resource) || admin_dashboard_path
    else
      super
    end
  end
end
