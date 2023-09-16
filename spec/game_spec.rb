require './game'
require './author'
require './genre'
require './label'

describe Game do
  context 'When testing the Game class' do
    it "Create a new instance and shouldn't be archieved" do
      author = Author.new('Mojang', '')
      genre = Genre.new('Adventure')
      label = Label.new('Minecraft')
      game = Game.new({
                        genre: genre,
                        author: author,
                        label: label,
                        publish_date: '2009/05/25',
                        multiplayer: true,
                        last_played_at: '2022/06/27'
                      })
      expect(game.can_be_archived?).to be false
    end

    it 'Create a new instance and should be archieved' do
      author = Author.new('Mojang', '')
      genre = Genre.new('Adventure')
      label = Label.new('Minecraft')
      game = Game.new({
                        genre: genre,
                        author: author,
                        label: label,
                        publish_date: '2009/06/08',
                        multiplayer: true,
                        last_played_at: '2020/12/10'
                      })
      expect(game.can_be_archived?).to be true
    end
  end
end
