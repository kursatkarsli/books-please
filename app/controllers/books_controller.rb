class BooksController < ApplicationController
  before_action :set_book, only: [:show, :toggle]
  def index
    @books = Book.includes(:interests)
        .where(interests: {user: current_user})
      .or(Book.includes(:interests)
        .where(interests: {id: nil}))
      .references(:interests)
    @favs = Book.favourites(current_user)
  end

  def show; end

  def toggle
    case
    when params[:favourite]
      @interest.toggle! :is_favourite
    when params[:read_list]
      @interest.read_list!
    when params[:reading]
      @interest.reading!
    when params[:complete]
      @interest.completed!
    when params[:reject]
      @interest.rejected!
    when params[:forget]
      @interest.uninterested!
    end

    redirect_to @book
  end

  private

  def set_book
    @book = Book.friendly.find(params[:id])
    @interest = @book.interests.find_by user: current_user
    @interest ||= Interest.create book: @book, user: current_user
  end
end
