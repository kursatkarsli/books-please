class BooksController < ApplicationController

  def index
    @books = (1..10).map { Book.new title: "Książeczka", author: "Autorka" }
  end

end
