class App
  def initialize
    @books = []
    @albums = []
    @games = []
    @authors = []
    @labels = []
    @genres = []
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
