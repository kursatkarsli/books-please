class Book < ApplicationRecord
  has_many :interests

  extend FriendlyId
  friendly_id :title, use: :slugged

  enum medium: { paper_book: 0, kindle: 1, audiobook: 2 }

  def self.favourites(user)
    includes(:interests)
      .where(interests: { user: user, is_favourite: true })
  end
end
