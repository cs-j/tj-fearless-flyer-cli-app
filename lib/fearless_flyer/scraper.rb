class FearlessFlyer::Scraper

# => 1. Need a Scraper Class
# => 2. That class needs to instantiate the products page
# => 3. Need to scrape the details of that products page
# => 4. Need to scrape the individual products from that page and add them to that instance

  attr_reader :doc

=begin
  def initialize
    @products_page = ProductsPage.new
    @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))
  end

  def self.scrape
    scrape_products_page
    @products_page # => by this point, this instance should have a bunch of products and details
  end

  def self.scrape_products_page
    # => this method populates @products_page with more data from the products page site (:products and :date)
    products = @doc.search("h2.sub-lead").first.text
    date = @doc.search("div.article.featured").text.strip
  end

  def self.scrape_product_details
    @doc.search("div.row.text-center").each do |product_table|
    # => instantiate the product
    product = Product.new
    product.name = product_table.search("").text.strip
    product.description = product_table.search("").text.strip
    product.ingredients = product_table.search("").text.strip

    @products_page.add_product(product)
    # => scrape the data
    # => add the product to the products page
  end
end
=end

=begin
def initialize
#  @products_page = ProductsPage.new(date)
  @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))
end

def self.all
  self.scrape_products_page
  @products_page # => by this point, this instance should have a bunch of products and details
end

def self.scrape_products_page
  # => this method populates @products_page with more data from the products page site (:products and :date)
  products = @doc.search("h2.sub-lead").collect {|name| name.text.strip}
  date = @doc.search("div.article.featured").text.strip
  @products_page = ProductsPage.new(date)
  @products_page << products
end
=end


  def self.all
    self.scrape_products_page
    @products_page
  end

  def self.scrape_products_page
    @products_page = []
    @products_page << self.scrape_tjs
    @products_page
  end

  def self.scrape_tjs
    @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))
    name_array = @doc.search("h2.sub-lead").collect {|name| name.text.strip}
    @products = name_array.each do |name|
      "#{name}"
    end
#    @date = @doc.search("div.article.featured").text.strip
#    binding.pry
  end

end
