class BooksController < ApplicationController
  before_action :set_book, only: [:show, :toggle_favourite]
  def index
    @books = Book.all
    @fav = Book.includes(:interests).where(
      interests: { user_id: 4, is_favourite: true }
    )
  end

  def show; end

  def toggle_favourite
    @interest = @book.interests.find_by user_id: 4
    @interest ||= Interest.create book: @book, user_id: 4
    @interest.toggle :is_favourite
    @interest.save

    redirect_to @book
  end

  private

  def set_book
    @book = Book.friendly.find(params[:id])
    @interest = @book.interests.find_by user_id: 4
    @interest ||= Interest.new
  end
end
