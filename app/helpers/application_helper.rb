# frozen_string_literal: true

module ApplicationHelper
  def image_avatar(user)
    if user.avatar&.attached?
      image_tag user.variant(:thumb)
    else
      image_tag 'fallback/default.png', size: '40x40'
    end
  end
end
