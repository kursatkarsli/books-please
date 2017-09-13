class Book < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    enum medium: { paper_book: 0, kindle: 1, audiobook: 2}
end
