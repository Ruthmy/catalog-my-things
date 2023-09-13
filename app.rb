require_relative 'book'
require_relative 'label'

class App
  def initialize
    @books = []
    @albums = []
    @games = []
    @authors = []
    @labels = []
    @genres = []
    @book_id_counter = 1
  end

  def option_select
    selected_opt = gets.chomp
    options = {
      '1' => :list_books,
      '2' => :list_music_albums,
      '3' => :list_games,
      '4' => :list_genres,
      '5' => :list_labels,
      '6' => :list_authors,
      '7' => :add_book,
      '8' => :add_music_album,
      '9' => :add_game
    }

    respond_to_option(selected_opt, options)
  end

  private

  def respond_to_option(selected_opt, options)
    if options.key?(selected_opt)
      send(options[selected_opt])
    else
      exit_app
    end
  end

  def list_books
    if @books.empty?
      puts 'No books available.'
    else
      @books.each { |book| puts book }
    end
  end

  def list_music_albums
    puts 'this will list the music albums'
  end

  def list_games
    puts 'this will list the games'
  end

  def list_genres
    puts 'this will list the genres'
  end

  def list_authors
    puts 'this will list the authors'
  end

  def list_labels
    if @labels.empty?
      puts 'No labels available.'
    else
      @labels.each { |label| puts "#{label.title} (#{label.color})" }
    end
  end

  def add_book
    publisher = prompt_user('Enter publisher:')
    cover_state = prompt_user('Enter cover state:')
    genre = prompt_user('Enter genre:')
    author = prompt_user('Enter author:')
    source = prompt_user('Enter source:')
    
    # Prompt the user to select a label
    label_title = prompt_user('Enter label:')
    label = find_or_create_label(label_title) # Find an existing label or create a new one
  
    # Validate the publish date input
    publish_date = prompt_publish_date
  
    book = Book.new(
      publisher,
      cover_state,
      genre,
      author,
      source,
      label, # Pass the label object to the book constructor
      publish_date
    )
    @books << book
  
    puts 'Book added successfully!'
  end

  # Find an existing label or create a new one
  def find_or_create_label(title)
    label = @labels.find { |l| l.title == title }
    if label.nil?
      # Create a new label if it doesn't exist
      label = Label.new(@labels.length + 1, title, 'default_color')
      @labels << label
    end
    label
  end
  
  # Prompt the user for the publish date until they provide a valid year
  def prompt_publish_date
    loop do
      input = prompt_user('Enter publish date (Year):')
      begin
        year = Integer(input)
        return year if year >= 0 # Ensure it's a non-negative year
      rescue ArgumentError
        puts 'Invalid year. Please enter a valid numeric year.'
      end
    end
  end

  def prompt_user(message)
    puts message
    gets.chomp
  end

  def add_music_album
    puts 'this will add a music album'
  end

  def add_game
    puts 'this will add a game'
  end

  def exit_app
    puts 'Thanks for using the app'
    exit
  end
end
