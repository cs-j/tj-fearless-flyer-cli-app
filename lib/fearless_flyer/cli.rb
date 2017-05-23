class FearlessFlyer::CLI

  def call
    FearlessFlyer::Scraper.scrape_products_page
    list_products
    menu
    goodbye
  end

  def list_products
    puts "Fearlessly Featured Products:"

    FearlessFlyer::Product.all.each.with_index(1) do |product, i|
      puts "#{i}. #{product.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number that corresponds to the product you're interested in, type list to see the products again, or type exit:"
      input = gets.strip.downcase

      if input.to_i.between?(1, 6)
        the_product = FearlessFlyer::Product.all[input.to_i-1]
        FearlessFlyer::Scraper.scrape_product_details(the_product)
      elsif input == "list"
        list_products
      else
        puts "Not sure which product you want."
      end
    end
  end

  def goodbye
    puts "At least go for Two Buck Chuck!"
  end

end
