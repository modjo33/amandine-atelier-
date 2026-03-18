class BrevoService
  API_URL = "https://api.brevo.com/v3/contacts"

  def self.sync_contact(email:, first_name:, last_name: nil)
    api_key = Rails.application.credentials.dig(:brevo, :api_key) || ENV["BREVO_API_KEY"]
    list_id = Rails.application.credentials.dig(:brevo, :list_id) || ENV["BREVO_LIST_ID"]

    return unless api_key.present? && list_id.present?

    uri = URI(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["accept"] = "application/json"
    request["content-type"] = "application/json"
    request["api-key"] = api_key

    body = {
      email: email,
      attributes: { PRENOM: first_name, NOM: last_name }.compact,
      listIds: [list_id.to_i],
      updateEnabled: true
    }

    request.body = body.to_json
    response = http.request(request)

    Rails.logger.info("[Brevo] Sync contact #{email}: #{response.code}")
    response
  rescue StandardError => e
    Rails.logger.error("[Brevo] Error syncing #{email}: #{e.message}")
    nil
  end
end
