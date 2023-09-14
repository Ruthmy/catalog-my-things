require 'json'
require_relative 'file_manager'
require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'addgathersave'

class App
  include FileManager
  include AddGather
  def initialize
    create_data
    initialize_collections
    ensure_files_exist
    load_data_from_files
  end

  def initialize_collections
    @albums = []
    @genres = []
    load_data_from_files
  end

  def ensure_files_exist
    create_file_if_not_exists('./data/games.json')
    create_file_if_not_exists('./data/authors.json')
    create_file_if_not_exists('./data/books.json')
    create_file_if_not_exists('./data/labels.json')
  end

  # Sets the arrays to be empty or to be the parsed info from the files
  def load_data_from_files
    @games = load_json_file('./data/games.json', [])
    @authors = load_json_file('./data/authors.json', [])
    @books = load_json_file('./data/books.json', [])
    @labels = load_json_file('./data/labels.json', [])
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
      '9' => :enter_new_game
    }
    respond_to_option(selected_opt, options)
  end

  # Options to entry a new game
  def enter_new_game
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish date [Day/Month/Year]: '
    publish_date = gets.chomp
    print 'Multiplayer: '
    multiplayer = gets.chomp
    print 'Last played at [Day/Month/Year]: '
    last_played_at = gets.chomp
    add_game({
               genre: genre,
               author: author,
               label: label,
               publish_date: publish_date,
               multiplayer: multiplayer,
               last_played_at: last_played_at
             })
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
      puts 'No books found.'
      return
    end

    puts 'Listing all books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book['label']}, Author: #{book['author']},
        Genre: #{book['genre']},
        Publish Date: #{book['publish_date']},
        Cover State: #{book['cover_state']}, Publisher: #{book['publisher']}"
    end
  end

  def list_music_albums
    puts 'this will list the music albums'
  end

  def list_games
    puts 'Games: '
    @games.each do |game|
      puts "Title: #{game['label']}, Author: #{game['author']}, Genre: #{game['genre']}, "
      print "Archived: #{game['archived']}"
      puts "\n"
    end
  end

  def list_genres
    puts 'this will list the genres'
  end

  def list_labels
    puts 'Labels: '
    @labels.each do |label|
      puts "ID: #{label['id']}, Name: #{label['name']}"
    end
  end

  def list_authors
    puts 'Authors: '
    @authors.each do |author|
      puts "Name: #{author['first_name']} #{author['last_name']}, ID: #{author['id']}"
    end
  end

  def add_label_if_not_exists(label_name)
    return if @labels.any? { |label| label['name'] == label_name } # Check if label already exists

    {
      'id' => Random.rand(1..1000),
      'name' => label_name
    }
  end

  def add_game(options)
    names = options[:author].split # Split the name at the spaces.
    first_name = names[0]
    last_name = names[1] if names.length > 1
    author_obj = Author.new(first_name, last_name)
    add_author(author_obj)
    label_obj = Label.new(options[:label])
    add_label(label_obj)

    game = create_game(options)
    game_input = {
      'id' => game.id,
      'author' => options[:author],
      'genre' => game.genre,
      'label' => game.label,
      'multiplayer' => game.multiplayer,
      'archived' => game.can_be_archived?
    }
    @games << game_input
    File.write('./data/games.json', JSON.pretty_generate(@games))
  end

  def add_author(author)
    author_input = {
      'id' => author.id,
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }

    @authors << author_input
    File.write('./data/authors.json', JSON.pretty_generate(@authors))
  end
end

def create_book(options)
  Book.new(options)
end

def add_music_album
  puts 'this will add a music album'
end

def add_label(label)
  label_input = {
    'id' => Random.rand(1..1000),
    'name' => label.title
  }

  save_label(label_input)
end

def save_label(label_input)
  @labels << label_input
  File.write('./data/labels.json', JSON.pretty_generate(@labels))
end

def exit_app
  puts 'Thanks for using the app'
  exit
end

def create_game(options)
  Game.new({
             genre: options[:genre],
             author: options[:author],
             label: options[:label],
             publish_date: options[:publish_date],
             multiplayer: options[:multiplayer],
             last_played_at: options[:last_played_at]
           })
end
