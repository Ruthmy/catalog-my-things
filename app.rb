require_relative 'music_album'
require_relative 'genre'

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
    if @genres.empty?
      puts '---> There are no genres, please add one first'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index} - #{genre.name}"
      end
      puts ''
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are no labels, please add one'
    else
      @labels.each do |label|
        puts " > #{label.name}"
      end
    end
  end

  def list_authors
    puts 'this will list the authors'
  end

  def add_book
    puts 'this will add a book'
  end

  def add_genre
    print "\n* Creating a new genre *\n\nPlease enter the name of the new genre:  "
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    puts "\n---> Genre '#{genre_name}' added\n"
  end

  def select_genre
    puts "\n* Please enter the genre number from the list below\n\n"
    list_genres
    puts "\n* If genre doesn't exist, type 'new' to create a new one\n"
    genre_name = gets.chomp
    if genre_name == 'new'
      add_genre
      puts "\n* Thanks for adding a new genre. Now, please enter the genre number from the list below\n\n"
      list_genres
      genre_name = gets.chomp
      @genres[genre_name.to_i]
    elsif genre_name.to_i < @genres.length
      @genres[genre_name.to_i]
    else
      return puts "\n---> Genre does not exist, you will be redirected to the main menu\n\n"
    end
  end

  def select_label
    puts "\n* Please enter the label number from the list below\n\n"
    list_labels
    puts "\n* If label doesn't exist, type 'new' to create a new one, otherwise you'll be redirected to the main menu\n"
    label_name = gets.chomp
    if label_name == 'new'
      add_label
      puts "\n* Thanks for adding a new label. Now, please enter the label number from the list below\n\n"
      list_labels
      label_name = gets.chomp
      label = @labels[label_name.to_i]
    elsif label_name.to_i < @labels.length
      label = @labels[label_name.to_i]
    else
      puts "\n---> Label does not exist, you will be redirected to the main menu\n\n"
    end
  end

  def add_music_album
    print '* Please anter the publish date: '
    publish_date = gets.chomp
    # Process to select/add a genre
    genre = select_genre
    # Process to select/add an author
    # author = select_author
    # Process to select/add a label
    # label = select_label
    puts 'Is it on spotify? (y/n)'
    on_spotify = gets.chomp.upcase == 'Y'
    # Process to add a new music album
    music_album = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    music_album.genre = genre
    @albums << music_album
    print "@albums #{@albums}\n"
    # music_album.author = author
    # music_album.label = label
  end

  def add_game
    puts 'this will add a game'
  end

  def exit_app
    puts 'Thanks for using the app'
    exit
  end
end
