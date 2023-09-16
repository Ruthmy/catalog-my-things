require_relative '../genre'

describe Genre do
  describe '#initialize' do
    it 'should create a new genre' do
      genre = Genre.new('rock')
      expect(genre).to be_a(Genre)
    end
  end

  describe '#id' do
    it 'should return an id' do
      genre = Genre.new('rock')
      expect(genre.id).to be_a(Integer)
    end
  end

  describe '#name' do
    it 'should return a name' do
      genre = Genre.new('rock')
      expect(genre.name).to eq('rock')
    end
  end

  describe '#items' do
    it 'should return an array of items' do
      genre = Genre.new('rock')
      expect(genre.items).to be_a(Array)
    end
  end
end
