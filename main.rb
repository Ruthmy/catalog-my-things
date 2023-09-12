require 'json'

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def to_json(*_args)
    {
      title: @title,
      author: @author
    }.to_json
  end

  def self.from_json(json)
    Book.new(json['title'], json['author'])
  end
end

class MusicAlbum
  attr_accessor :title, :artist, :genre # Adicionado :genre

  # Adicionado =nil'
  def initialize(title, artist, genre = nil)
    @title = title
    @artist = artist
    @genre = genre
  end

  def to_json(*_args)
    {
      title: @title,
      artist: @artist,
      genre: @genre
    }.to_json
  end

  def self.from_json(json)
    MusicAlbum.new(json['title'], json['artist'], json['genre'])
  end
end

class Game
  attr_accessor :title, :system, :label # Passo 1

  # Passo 2
  def initialize(title, system, label = nil)
    @title = title
    @system = system
    @label = label
  end

  def to_json(*_args)
    {
      title: @title,
      system: @system,
      label: @label # Passo 2
    }.to_json
  end

  def self.from_json(json)
    Game.new(json['title'], json['system'], json['label']) # Passo 4
  end
end

class CatalogApp
  def initialize(filename = 'catalog_data.json')
    @filename = filename
    @data = load_or_initialize_data
  end

  def load_or_initialize_data
    return { 'books' => [], 'music_albums' => [], 'games' => [] } unless File.exist?(@filename)

    raw_data = JSON.parse(File.read(@filename))
    {
      'books' => raw_data['books'].map { |book_data| Book.from_json(book_data) },
      'music_albums' => raw_data['music_albums'].map { |album_data| MusicAlbum.from_json(album_data) },
      'games' => raw_data['games'].map { |game_data| Game.from_json(game_data) }
    }
  end

  def save_data
    File.write(@filename, @data.to_json)
  end

  def display_menu
    puts 'Choose an option:'
    puts '1. Add Book'
    puts '2. Add Music Album'
    puts '3. Add Game'
    puts '4. List All Books'
    puts '5. List All Music Albums'
    puts '6. List All Games'
    puts '7. List All Labels'
    puts '8. List All Genres'
    puts '9. List All Authors'
    puts '0. Exit'
    gets.chomp.to_i
  end

  def execute_option(option)
    actions = {
      1 => -> { add_book },
      2 => -> { add_music_album },
      3 => -> { add_game },
      4 => -> { list_all_books },
      5 => -> { list_all_music_albums },
      6 => -> { list_all_games },
      7 => -> { list_all_labels },
      8 => -> { list_all_genres },
      9 => -> { list_all_authors },
      0 => -> { exit_app }
    }

    action = actions[option]
    action&.call || display_invalid_option
  end

  def display_invalid_option
    puts 'Invalid option. Please try again.'
  end

  def add_book
    puts 'Enter the title of the book:'
    title = gets.chomp
    puts 'Enter the author of the book:'
    author = gets.chomp
    book = Book.new(title, author)
    @data['books'] << book
    save_data
    puts 'Book added successfully!'
  end

  def add_music_album
    puts 'Enter the title of the album:'
    title = gets.chomp
    puts 'Enter the artist:'
    artist = gets.chomp
    puts 'Enter the genre:' # Adicionado esta linha
    genre = gets.chomp # Adicionado esta linha
    album = MusicAlbum.new(title, artist, genre) # Adicionado o parâmetro genre
    @data['music_albums'] << album
    save_data
    puts 'Music album added successfully!'
  end

  def add_game
    puts 'Enter the title of the game:'
    title = gets.chomp
    puts 'Enter the system:'
    system = gets.chomp
    puts 'Enter the label:' # Passo 3
    label = gets.chomp
    game = Game.new(title, system, label) # Passo 3
    @data['games'] << game
    save_data
    puts 'Game added successfully!'
  end

  def list_all_books
    @data['books'].each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_music_albums
    @data['music_albums'].each_with_index do |album, index|
      puts "#{index + 1}. Title: #{album.title}, Artist: #{album.artist}"
    end
  end

  def list_all_games
    @data['games'].each_with_index do |game, index|
      puts "#{index + 1}. Title: #{game.title}, System: #{game.system}"
    end
  end

  def list_all_labels
    labels = @data['games'].map(&:label).compact.uniq # Modificação aqui
    if labels.empty?
      puts 'No labels found.'
    else
      puts 'List of all game labels:'
      labels.each { |label| puts label }
    end
  end

  def list_all_genres
    genres = @data['music_albums'].map(&:genre).compact.uniq # Corrigido aqui
    if genres.empty?
      puts 'No genres found.'
    else
      puts 'List of all music album genres:'
      genres.each { |genre| puts genre }
    end
  end

  def list_all_authors
    authors = @data['books'].map(&:author).uniq
    if authors.empty?
      puts 'No authors found.'
    else
      puts 'List of all authors:'
      authors.each { |author| puts author }
    end
  end

  def exit_app
    puts 'Thank you for using the catalog app! Goodbye.'
    exit
  end

  def run
    loop do
      option = display_menu
      execute_option(option)
    end
  end
end

# Start the app
app = CatalogApp.new
app.run
