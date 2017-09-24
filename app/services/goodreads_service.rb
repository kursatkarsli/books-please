class GoodreadsService

  def search_book(query)
    client = Goodreads.new
    search = client.search_books(query)

    if search.total_results == "0"
      []
    elsif search.total_results == "1"
      [map_book(search.results.work)]
    else
      map_books search.results.work
    end
  end

  def find_book_by(good_id)
    client = Goodreads.new
    good_book = client.book(good_id)
    good_author = good_book.authors.author.is_a?(Array) ?
      good_book.authors.author.first.name :
      good_book.authors.author.name

    Book.new(
      title: good_book.title,
      author: good_author,
      pages: good_book.num_pages,
      description: good_book.description,
      large_image_url: good_book.image_url.gsub!(/m(?=\/\d+)/, 'l'),
      small_image_url: good_book.image_url
    )
  end

  private

  def map_book work
    proposal           = Proposal.new
    proposal.id        = work.best_book.id
    proposal.title     = work.best_book.title
    proposal.author    = work.best_book.author.name
    proposal.rating    = work.average_rating
    proposal.image_url = work.best_book.small_image_url
    proposal
  end

  def map_books works
    works.map &method(:map_book)
  end



end