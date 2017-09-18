class Book < ApplicationRecord
  has_many :interests
  has_many :readers, through: :interests, source: :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  enum medium: { paper_book: 0, kindle: 1, audiobook: 2 }

  def self.favourites(user)
    joins(:interests)
      .where(interests: { user: user, is_favourite: true })
  end

  def self.read_list(user)
    joins(:interests)
      .where(interests: { user: user, status: :read_list })
  end

  def self.reading(user)
    joins(:interests)
      .where(interests: { user: user, status: :reading })
  end

  def self.completed(user)
    joins(:interests)
      .where(interests: { user: user, status: :completed })
  end
end
