# main.rb

require_relative 'item'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'
require_relative 'game'
require_relative 'author'

class Application
  def initialize
    @books = []
    @music_albums = []
    @games = []
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      break if choice.zero?

      handle_choice(choice)
    end
  end

  def display_menu
    puts 'Choose an option:'
    puts '1. Add Book'
    puts '2. List All Books'
    puts '3. Add Music Album'
    puts '4. List All Music Albums'
    puts '5. Add Game'
    puts '6. List All Games'
    puts '7. List All Labels'
    puts '8. List All Genres'
    puts '9. List All Authors'
    puts '0. Exit'
  end

  def handle_choice(choice)
    actions = {
      1 => :add_book,
      2 => :list_all_books,
      3 => :add_music_album,
      4 => :list_all_music_albums,
      5 => :add_game,
      6 => :list_all_games,
      7 => :list_all_labels,
      8 => :list_all_genres,
      9 => :list_all_authors
    }

    if actions.include?(choice)
      send(actions[choice])
    else
      display_invalid_choice
    end
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book publisher:'
    publisher = gets.chomp
    puts 'Enter book cover state (good/bad):'
    cover_state = gets.chomp

    book = Book.new(title: title, publisher: publisher, cover_state: cover_state)
    @books << book
    puts 'Book added successfully!'
  end

  def list_all_books
    puts 'Listing all books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def add_music_album
    # implement a similar pattern as the add_book method.
  end

  def list_all_music_albums
    # implement a similar pattern as the list_all_books method.
  end

  def add_game
    # implement a similar pattern as the add_book method.
  end

  def list_all_games
    # implement a similar pattern as the list_all_books method.
  end

  def list_all_labels
    puts 'Listing all labels:'
    @labels.each_with_index do |label, index|
      puts "#{index + 1}. #{label.name}"
    end
  end

  def list_all_genres
    puts 'Listing all genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_all_authors
    puts 'Listing all authors:'
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.name}"
    end
  end
end

app = Application.new
app.run
