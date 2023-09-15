module ListFunctions
  def list_books
    if @books.empty?
      puts 'No books found.'
      return
    end

    puts 'Listing all books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book['label']}, Author: #{book['author']},
        Genre: #{book['genre']},
        Publish Date: #{book['publish_date']},
        Cover State: #{book['cover_state']}, Publisher: #{book['publisher']}"
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums found.'
      return
    end

    puts 'Listing all music albums:'
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}. Title: #{music_album['label']}, Author: #{music_album['author']},
        Genre: #{music_album['genre']},
        Publish Date: #{music_album['publish_date']},
        On Spotify: #{music_album['on_spotify']}"
    end
  end

  def list_games
    puts 'Games: '
    @games.each do |game|
      puts "Title: #{game['label']}, Author: #{game['author']}, Genre: #{game['genre']}, "
      print "Archived: #{game['archived']}"
      puts "\n"
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres found.'
      return
    end

    puts 'Genres: '
    @genres.each do |genre|
      puts "ID: #{genre['id']}, Name: #{genre['name']}"
    end
  end

  def list_labels
    puts 'Labels: '
    @labels.each do |label|
      puts "ID: #{label['id']}, Name: #{label['name']}"
    end
  end

  def list_authors
    puts 'Authors: '
    @authors.each do |author|
      puts "Name: #{author['first_name']} #{author['last_name']}, ID: #{author['id']}"
    end
  end
end
