class App
    def initialize
      @books = []
      @albums = []
      @games = []
    end
  
    def option_select
      selected_opt = gets.chomp
      case selected_opt
      when '1'
        puts 'This will list the books'
      when '2'
        puts 'This will list the music albums'
      when '3'
        puts 'This will list the games'
      when '4'
        puts 'This will list the genres'
      when '5'
        puts 'This will list the labels'
      when '6'
        puts 'This will list the authors'
      when '7'
        puts 'This will add a book'
      when '8'
        puts 'This will add a music album'
      when '9'
        puts 'This will add a game'
      else
        puts 'Thanks for using the app'
        exit
      end
    end
  end