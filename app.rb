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
  end

  # Creates a data directory if not exists
  def create_data
    return if Dir.exist?('./data')

    Dir.mkdir('./data')
  end

  # Sets the arrays to be empty or to be the parsed info from the files
  def load_data_from_files
    @games = load_data_from_files('./data/games.json', [])
    @authors = load_data_from_files('./data/authors.json', [])
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
    puts 'this will list the books'
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

  def list_labels
    puts 'this will list the labels'
  end

  def list_authors
    puts 'this will list the authors'
  end

  def add_book
    puts 'this will add a book'
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
