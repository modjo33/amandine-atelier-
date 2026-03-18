class PageView < ApplicationRecord
  validates :path, presence: true

  scope :today, -> { where(created_at: Time.current.all_day) }
  scope :this_week, -> { where(created_at: Time.current.all_week) }
  scope :this_month, -> { where(created_at: Time.current.all_month) }
end
