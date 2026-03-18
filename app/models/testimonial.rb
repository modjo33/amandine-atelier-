class Testimonial < ApplicationRecord
  validates :quote, presence: true
  validates :name, presence: true

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(position: :asc) }
end
