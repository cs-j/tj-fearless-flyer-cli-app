class FearlessFlyer::CLI

  def call
    list_products
    menu
    goodbye
  end

  def list_products
    puts "Fearlessly Featured Products:"

    @products = FearlessFlyer::Scraper.scrape_products_page
    @products.each.with_index(1) do |product, i|
      puts "#{i}. #{product}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number that corresponds to the product you're interested in, type list to see the products again, or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_product = @products[input.to_i-1]
        puts "#{the_product}"

        @descriptions = FearlessFlyer::Scraper.scrape_product_details
        description = @descriptions[input.to_i-1]
        puts "#{description}"

      elsif input == "list"
        list_products
      else
      end
    end
  end

  def goodbye
    puts "At least go for Two Buck Chuck!"
  end

end
