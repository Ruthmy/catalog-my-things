module AddMusicAlbumMethods
  def create_music_album(options)
    names = options[:author].split # Split the name at the spaces.
    first_name = names[0]
    last_name = names[1] if names.length > 1
    add_author_if_doesnt_exist(first_name, last_name)
    add_label(options[:label])
    add_genre_if_doesnt_exist(options[:genre])

    music_album = create_object_music_album(options)
    music_album_input = {
      'id' => music_album.id,
      'author' => options[:author],
      'genre' => music_album.genre,
      'label' => music_album.label,
      'on_spotify' => music_album.on_spotify,
      'archived' => music_album.can_be_archived?
    }
    @music_albums << music_album_input
    File.write('./data/music_albums.json', JSON.pretty_generate(@music_albums))
  end

  def create_object_music_album(options)
    MusicAlbum.new(
      options[:genre],
      options[:author],
      options[:label],
      options[:publish_date],
      on_spotify: options[:on_spotify]
    )
  end

  def add_genre_if_doesnt_exist(genre_name)
    return if @genres.any? { |genre| genre['name'] == genre_name }

    genre = Genre.new(genre_name)
    genre_input = {
      'id' => genre.id,
      'name' => genre.name
    }
    @genres << genre_input
    File.write('./data/genres.json', JSON.pretty_generate(@genres))
  end
end
