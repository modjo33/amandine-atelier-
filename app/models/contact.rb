class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_create :generate_unsubscribe_token

  scope :newsletter_subscribers, -> { where(newsletter_opt_in: true) }

  private

  def generate_unsubscribe_token
    self.unsubscribe_token = SecureRandom.urlsafe_base64(32)
  end
end
