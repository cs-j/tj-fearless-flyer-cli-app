class BestSellers::Book
  attr_accessor :title, :author, :publisher, :description, :time_on_list, :purchase_url

  def self.all
  # Should return all instances of states
  # Scrape site and return information based on that data
    self.scrape_books
  end

  def self.scrape_books
    books = []

    # go to site, find the product
    # extract the properties
    # instantiate a state

    books << self.scrape_nyt

#    book_1 = self.new
#    book_1.title = "Alabama"
#    book_1.election_info = "Tuesday, April 18, 2017 (Alabama House District 67 Special General Election)"
#    book_1.registration_deadlines = "In Person: Tuesday, April 4, 2017 By Mail: Postmarked by Tuesday, April 4, 2017 Online by Tuesday, April 4, 2017"
#    book_1.url = "http://www.vote411.org/state_guide?state_id=Alabama"

    books
  end

  def self.scrape_nyt
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-fiction/?module=DropDownNav&action=click&region=navbar&contentCollection=Books&version=Fiction&referrer=https%3A%2F%2Fwww.google.com%2F&pgtype=Reference&_r=0"))
    binding.pry
  end

end
