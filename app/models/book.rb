class Book < ApplicationRecord
    enum medium: { paper_book: 0, kindle: 1, audiobook: 2}
end
