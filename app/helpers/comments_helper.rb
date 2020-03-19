# frozen_string_literal: true

module CommentsHelper
  def comment_rating(how_much)
    how_much.times do
      fa_icon 'star'
    end
  end
end
