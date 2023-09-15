require_relative '../music_album'

describe MusicAlbum do
  describe '#initialize' do
    it 'should create a new music album' do
      music_album = MusicAlbum.new('rock', 'The Beatles', 'Apple', '1968-11-22', on_spotify: true)
      expect(music_album).to be_a(MusicAlbum)
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if the music album is older than 10 years and on spotify' do
      music_album = MusicAlbum.new('rock', 'The Beatles', 'Apple', '1968-11-22', on_spotify: true)
      expect(music_album.can_be_archived?).to eq(true)
    end

    it 'should return false if the music album is older than 10 years and not on spotify' do
      music_album = MusicAlbum.new('rock', 'The Beatles', 'Apple', '1968-11-22', on_spotify: false)
      expect(music_album.can_be_archived?).to eq(false)
    end

    it 'should return false if the music album is not older than 10 years and on spotify' do
      music_album = MusicAlbum.new('rock', 'The Beatles', 'Apple', '2018-11-22', on_spotify: true)
      expect(music_album.can_be_archived?).to eq(false)
    end
  end

  describe '#move_to_archive' do
    it 'should change the archived attribute to true' do
      music_album = MusicAlbum.new('rock', 'The Beatles', 'Apple', '1968-11-22', on_spotify: true)
      music_album.move_to_archive
      expect(music_album.archived).to eq(true)
    end
  end

  describe '#id' do
    it 'should return an id' do
      music_album = MusicAlbum.new('rock', 'The Beatles', 'Apple', '1968-11-22', on_spotify: true)
      expect(music_album.id).to be_a(Integer)
    end
  end

  describe '#genre' do
    it 'should return a genre' do
      music_album = MusicAlbum.new('rock', 'The Beatles', 'Apple', '1968-11-22', on_spotify: true)
      expect(music_album.genre).to eq('rock')
    end
  end

  describe 'add the right amount of albums' do
    it 'should return 5 albums' do
      music_albums = []
      5.times do
        music_albums << MusicAlbum.new('rock', 'The Beatles', 'Apple', '1968-11-22', on_spotify: true)
      end
      expect(music_albums.size).to eq(5)
    end
  end
end
