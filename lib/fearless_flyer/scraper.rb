class FearlessFlyer::Scraper

attr_reader :doc

  def self.scrape_products_page
    @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))

    date = @doc.search("div.article.featured").text.strip
    puts "(as of #{date})"
    binding.pry
    name_array = @doc.search("col-sm-6").collect {|name| name.text.strip}
    name_array.each do |name|
      FearlessFlyer::Product.new(name, url)
    end
  end

  def self.scrape_product_details(product)
    @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))
    link = @doc.search("div.row.text-center a").map { |link| link['href'] }

    @descriptions = []
    links.each do |link|
      url = "http://www.traderjoes.com#{link}"
      product_details = Nokogiri::HTML(open(url))
      description = product_details.search('div.article p').text.strip
      @descriptions << description
    end
    return @descriptions
  end

end
