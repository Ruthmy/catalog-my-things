require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def run
    options = [
      'List all books',
      'List all music albums',
      'List all games',
      'List all genres',
      'List all labels',
      'List all authors',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]
    puts 'Welcome, please select an option by entering the corresponding number: '
    options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    @app.option_select
    puts 'Press Enter key to continue...'
    gets
    run
  end
end

main = Main.new
main.run