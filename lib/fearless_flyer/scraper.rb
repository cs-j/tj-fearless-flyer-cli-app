class FearlessFlyer::Scraper

attr_reader :doc

  def self.scrape_products_page
    @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))

    date = @doc.search("div.article.featured").text.strip
    puts "(as of #{date})"

    name_array = @doc.search("h2.sub-lead").collect {|name| name.text.strip}
    @products = name_array.each do |name|
      "#{name}"
    end
  end

  def self.scrape_product_details
    @doc = Nokogiri::HTML(open("http://www.traderjoes.com/fearless-flyer"))
    links = @doc.search("div.row.text-center a").map { |link| link['href'] }

    @descriptions =[]
    links.each do |link|
      url = "http://www.traderjoes.com#{link}"
      product_details = Nokogiri::HTML(open(url))
      description = product_details.search('div.article p').text.strip
      @descriptions << description
    end
    return @descriptions
  end

end
