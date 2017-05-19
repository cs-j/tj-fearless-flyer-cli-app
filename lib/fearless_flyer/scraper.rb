class FearlessFlyer::Scraper

attr_reader :doc

  def self.scrape_products_page
    @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))

    date = @doc.search("div.article.featured").text.strip
    puts "(as of #{date})"

    @links = @doc.search("div.row.text-center a").map { |link| link['href'] }
    names = @doc.search("div.col-sm-6").collect {|name| name.text.strip}

    h = Hash[names.zip @links]

    h.each do |name, url|
      product = FearlessFlyer::Product.new(name, url)
      product
    end
  end

  def self.scrape_product_details(product)
    product = FearlessFlyer::Product.find(product)
    product_url = product.url

    url = "http://www.traderjoes.com#{product_url}"
    product_details = Nokogiri::HTML(open(url))
    description = product_details.search('div.article p').text.strip
    product.description = description
  end

end
