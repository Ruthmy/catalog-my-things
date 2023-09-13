require 'json'
require_relative 'author'
require_relative 'game'

class App
  def initialize
    create_data
    @books = []
    @albums = []
    @labels = []
    @genres = []
    create_file_if_not_exists('./data/games.json')
    create_file_if_not_exists('./data/authors.json')
    load_data_from_files
  end

  # Creates a data directory if not exists
  def create_data
    return if Dir.exist?('./data')

    Dir.mkdir('./data')
  end

  # Sets the arrays to be empty or to be the parsed info from the files
  def load_data_from_files
    @games = load_json_file('./data/games.json', [])
    @authors = load_json_file('./data/authors.json', [])
  end

  # A method to check if the files are empty or not, and parse the info
  def load_json_file(file_path, default_value)
    file = File.open(file_path)
    file_data = file.read
    if file_data.empty?
      default_value
    else
      JSON.parse(file_data)
    end
  end

  # Creates the json files if they don't exist
  def create_file_if_not_exists(file_path)
    return if File.exist?(file_path)

    File.open(file_path, 'w')
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
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Multiplayer: '
    multiplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    add_game(genre, author, label, publish_date, multiplayer, last_played_at)
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
    puts 'this will list the books'
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
    puts 'this will list the labels'
  end

  def list_authors
    puts 'Authors: '
    @authors.each do |author|
      puts "Name: #{author['first_name']} #{author['last_name']}, ID: #{author['id']}"
    end
  end

  def add_book
    puts 'this will add a book'
  end

  def add_music_album
    puts 'this will add a music album'
  end

  def add_game(genre, author, label, publish_date, multiplayer, last_played_at)
    names = author.split  # Split the name at the spaces.
    first_name = names[0]
    last_name = names[1] if names.length > 1
    author_obj = Author.new(first_name, last_name)
    add_author(author_obj)

    game = Game.new(genre, author_obj, label, publish_date, multiplayer, last_played_at)

    game_input = {
      'id' => game.id,
      'author' => author,
      'genre' => game.genre,
      'label' => game.label,
      'publish_date' => game.publish_date,
      'multiplayer' => game.multiplayer,
      'last_played_at' => game.last_played_at,
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

  def exit_app
    puts 'Thanks for using the app'
    exit
  end
end
