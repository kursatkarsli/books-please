class BooksController < ApplicationController
  before_action :set_book, only: [:show, :toggle_favourite]
  def index
    @books = Book.all
    @favs = Book.favourites(current_user)
  end

  def show; end

  def toggle_favourite
    @interest.toggle :is_favourite
    @interest.save

    redirect_to @book
  end

  private

  def set_book
    @book = Book.friendly.find(params[:id])
    @interest = @book.interests.find_by user: current_user
    @interest ||= Interest.create book: @book, user: current_user
  end
end
