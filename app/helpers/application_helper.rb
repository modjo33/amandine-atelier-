module ApplicationHelper
  def c(key)
    @c&.dig(key)&.value.to_s
  end

  def c_image(key)
    record = @c&.dig(key)
    record&.image&.attached? ? record.image : nil
  end
end
