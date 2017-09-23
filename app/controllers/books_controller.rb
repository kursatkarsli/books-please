class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :destroy, :toggle]
  before_action :set_book, only: [:show, :destroy, :toggle]
  
  def index
    @favs = Book.favourites(current_user)
    @books = Book.all
  end

  def show; end

  def new
    params[:query] ||= 'Ekożona'

    client = Goodreads.new
    search = client.search_books(params[:query])
    results = search.results.work

    @works = results.is_a?(Array) ? results : [results]
  end

  def create
    good_id = params[:gr_id]
    client = Goodreads.new
    good_book = client.book(good_id)
    good_author = good_book.authors.author

    @book = Book.new(
      title: good_book.title,
      author: good_author.is_a?(Array) ?
        good_author.first.name :
        good_author.name,
      pages: good_book.num_pages,
      description: good_book.description,
      large_image_url: good_book.image_url.gsub!(/m(?=\/\d+)/, 'l'),
      small_image_url: good_book.image_url,
    )

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_path
    else
      redirect_to @book
    end
  end

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
      interest.user = current_user
    end
  end
end
