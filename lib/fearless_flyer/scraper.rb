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
    product_url = product.url
    product.description = ""

    url = "http://www.traderjoes.com#{product_url}"
    product_details = Nokogiri::HTML(open(url))
    product_details.search('div.article p').each do |p|
      text = p.text.strip
      if text != "" && (p.text.strip.split(" ")[0] != "Ingredients:") && (p.text.strip.split(" ")[0] != "NOTE:") && (p.text.strip.split(" ")[0] != "Related")
        product.description = product.description + p.text.strip
      end
      product.description
    end
  end

end
