require_relative 'label'

module AddGather
  def add_book
    book_details = gather_book_details
    save_book(book_details)
  end

  def gather_book_details
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish date (dd/mm/yyyy): '
    publish_date = gets.chomp
    puts 'Publisher:'
    publisher = gets.chomp
    print 'Cover state (good, average, bad): '
    cover_state = gets.chomp

    {
      genre: genre,
      author: author,
      label: label,
      publish_date: publish_date,
      cover_state: cover_state,
      publisher: publisher
    }
  end

  def create_book(options)
    Book.new(options)
  end

  def save_book(options)
    names = options[:author].split # Split the name at the spaces.
    first_name = names[0]
    last_name = names[1] if names.length > 1
    add_author_if_doesnt_exist(first_name, last_name)
    add_label(options[:label])
    add_genre_if_doesnt_exist(options[:genre])

    book = create_book(options)

    book_input = {
      'id' => book.id, # This assumes you have a similar id logic for books as with games.
      'author' => options[:author],
      'genre' => book.genre,
      'label' => book.label,
      'publish_date' => book.publish_date,
      'cover_state' => book.cover_state,
      'publisher' => book.publisher,
      'archived' => book.can_be_archived? # Use the updated can_be_archived? method
    }

    json_book(book_input)
    add_label_if_not_exists(options[:label])
  end

  def json_book(book_input)
    @books << book_input
    File.write('./data/books.json', JSON.pretty_generate(@books))
  end
end
