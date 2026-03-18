class Article < ApplicationRecord
  has_one_attached :cover_image

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :content, presence: true

  before_validation :generate_slug, if: -> { slug.blank? && title.present? }
  before_save :set_published_at

  scope :published, -> { where(published: true).where("published_at <= ?", Time.current) }
  scope :ordered, -> { order(published_at: :desc) }
  scope :by_category, ->(cat) { where(category: cat) if cat.present? }

  def to_param
    slug
  end

  def reading_time
    words = content.to_s.split.size
    [(words / 200.0).ceil, 1].max
  end

  private

  def generate_slug
    base = title.parameterize
    self.slug = base
    counter = 1
    while Article.where(slug: slug).where.not(id: id).exists?
      self.slug = "#{base}-#{counter}"
      counter += 1
    end
  end

  def set_published_at
    self.published_at = Time.current if published? && published_at.blank?
  end
end
