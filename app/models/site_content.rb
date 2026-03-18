class SiteContent < ApplicationRecord
  has_one_attached :image

  validates :key, presence: true, uniqueness: true
  validates :section, presence: true

  scope :by_section, ->(section) { where(section: section).order(:position) }

  def self.get(key)
    find_by(key: key)&.value
  end

  def self.get_image(key)
    record = find_by(key: key)
    record&.image&.attached? ? record.image : nil
  end

  def image?
    content_type == "image"
  end

  def text?
    content_type == "text"
  end
end
