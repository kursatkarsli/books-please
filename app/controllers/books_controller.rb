class BooksController < ApplicationController
  before_action :set_book, only: [:show, :toggle]
  def index
    user = current_user

    @favs = Book.favourites(user).select(:title, :slug)

    @books = Book.joins(:interests)
    .where(interests: {user: user})
      .or(Book.joins(:interests)
    .where(interests: {id: nil}))
    .select(:title, :slug)
  end

  def show; end

  def toggle
    if params[:favourite]
      @interest.toggle! :is_favourite
    elsif params[:read_list]
      @interest.read_list!
    elsif params[:reading]
      @interest.reading!
    elsif params[:complete]
      @interest.completed!
    elsif params[:reject]
      @interest.rejected!
    elsif params[:forget]
      @interest.uninterested!
    end

    redirect_to @book
  end

  private

  def set_book
    @book = Book.friendly.find(params[:id])
    @interest = @book.interests.find_or_create_by(user: current_user) do |interest|
      interest.book = @book
      user = current_user
    end
  end
end
