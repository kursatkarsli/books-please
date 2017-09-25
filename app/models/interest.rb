class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: {
    uninterested: 0,
    read_list: 1,
    reading: 2,
    completed: 3,
    rejected: 4
  }
end
