class BestSellers::CLI

  def call
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Best Sellers:"

    @books = BestSellers::Book.all
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number that corresponds to the book you're interested in, type list to see the books again, or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_book = @books[input.to_i-1]
        puts "#{the_book.title}"
      elsif input == "list"
        list_books
      else
        puts "Not sure which book you're interested in. Type list or exit:"
      end
    end
  end

  def goodbye
    puts "Happy reading!"
  end

end
