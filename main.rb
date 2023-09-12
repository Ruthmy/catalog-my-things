require 'json'

class Catalog
  def initialize(filename = 'catalog.json')
    @filename = filename
    if File.exist?(@filename)
      @items = JSON.parse(File.read(@filename))
    else
      @items = {
        'books' => [],
        'music_albums' => [],
        'games' => [],
        'labels' => [],
        'genres' => [],
        'authors' => []
      }
    end
  end

  def add_book(title)
    @items['books'] << title
    save
  end

  def add_music_album(album_name)
    @items['music_albums'] << album_name
    save
  end

  def add_game(game_name)
    @items['games'] << game_name
    save
  end

  # add other methods if necessary

  def save
    File.write(@filename, @items.to_json)
  end

  def list_books
    @items['books']
  end

  # add other list methods if necessary
end

def display_menu
  puts 'Please choose an option:'
  puts '1) Add Book'
  puts '2) Add Music Album'
  puts '3) Add Game'
  puts '4) List All Books'
  puts '5) List All Music Albums'
  puts '6) List All Games'
  puts '7) Exit'
  gets.chomp.to_i
end

catalog = Catalog.new

loop do
  choice = display_menu

  case choice
  when 1
    puts 'Enter Book Title:'
    title = gets.chomp
    catalog.add_book(title)
    puts 'Book added successfully!'
  when 2
    puts 'Enter Music Album Name:'
    album_name = gets.chomp
    catalog.add_music_album(album_name)
    puts 'Music Album added successfully!'
  when 3
    puts 'Enter Game Name:'
    game_name = gets.chomp
    catalog.add_game(game_name)
    puts 'Game added successfully!'
  when 4
    puts 'Books:'
    puts catalog.list_books
  when 5
    puts 'Music Albums:'
    puts catalog.list_music_albums
  when 6
    puts 'Games:'
    puts catalog.list_games
  when 7
    puts 'Goodbye!'
    exit
  else
    puts 'Invalid choice! Please choose a valid option.'
  end
end
