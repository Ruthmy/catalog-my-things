require 'json'
require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'music_album'
require_relative 'genre'
require_relative 'list_functions'
require_relative 'file_manager'
require_relative 'add_gather_save'
require_relative 'add_music_album_methods'

class App
  include FileManager
  include AddGather
  include ListFunctions
  include AddMusicAlbumMethods
  def initialize
    create_data
    load_data_from_files
    ensure_files_exist
  end

  # Sets the arrays to be empty or to be the parsed info from the files
  def load_data_from_files
    @games = load_json_file('./data/games.json', [])
    @authors = load_json_file('./data/authors.json', [])
    @books = load_json_file('./data/books.json', [])
    @labels = load_json_file('./data/labels.json', [])
    @genres = load_json_file('./data/genres.json', [])
    @music_albums = load_json_file('./data/music_albums.json', [])
  end

  def ensure_files_exist
    create_file_if_not_exists('./data/games.json')
    create_file_if_not_exists('./data/authors.json')
    create_file_if_not_exists('./data/books.json')
    create_file_if_not_exists('./data/labels.json')
    create_file_if_not_exists('./data/genres.json')
    create_file_if_not_exists('./data/music_albums.json')
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
    label_name = gets.chomp
    print 'Label Color: '
    label_color = gets.chomp.strip
    label_color = nil if label_color.empty?
    print 'Publish date [Day/Month/Year]: '
    publish_date = gets.chomp
    print 'Multiplayer: '
    multiplayer = gets.chomp
    print 'Last played at [Day/Month/Year]: '
    last_played_at = gets.chomp
    add_game({ genre: genre, author: author,
               label: label_name, label_color: label_color,
               publish_date: publish_date, multiplayer: multiplayer,
               last_played_at: last_played_at })
  end

  private

  def respond_to_option(selected_opt, options)
    if options.key?(selected_opt)
      send(options[selected_opt])
    else
      exit_app
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
    add_author_if_doesnt_exist(first_name, last_name)
    label_obj = Label.new(options[:label], options[:label_color])
    add_label(label_obj)
    add_genre_if_doesnt_exist(options[:genre])

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

  def add_author_if_doesnt_exist(first_name, last_name)
    return if @authors.any? { |author| author['first_name'] == first_name && author['last_name'] == last_name }

    author = Author.new(first_name, last_name)
    author_input = {
      'id' => author.id,
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }

    @authors << author_input
    File.write('./data/authors.json', JSON.pretty_generate(@authors))
  end

  def add_music_album
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Label: '
    label_name = gets.chomp
    print 'Label Color: '
    label_color = gets.chomp.strip
    label_color = nil if label_color.empty?
    print 'Publish date [Day/Month/Year]: '
    publish_date = gets.chomp
    print 'Is it on spotify? (y/n) '
    on_spotify = gets.chomp.upcase == 'Y'
    create_music_album({
                         genre: genre, author: author,
                         label: label_name, label_color: label_color,
                         publish_date: publish_date, on_spotify: on_spotify
                       })
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
end
