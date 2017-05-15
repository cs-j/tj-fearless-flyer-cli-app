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
#    binding.pry
  end

end
