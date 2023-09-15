module ListFunctions
  def list_books
    if @books.empty?
      puts "\nNo books found. \n\n"
      return
    end

    puts "\nListing all books:\n\n"
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book['label']}, Author: #{book['author']},
        Genre: #{book['genre']},
        Publish Date: #{book['publish_date']},
        Cover State: #{book['cover_state']}, Publisher: #{book['publisher']}"
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts "\nNo music albums found. \n\n"
      return
    end

    puts "\nListing all music albums:\n\n"
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}. Title: #{music_album['label']}, Author: #{music_album['author']},
        Genre: #{music_album['genre']},
        Publish Date: #{music_album['publish_date']},
        #{music_album['on_spotify'] ? 'On Spotify' : 'Not on Spotify'},
        #{music_album['archived'] ? 'Archived' : 'Not archived'}"
    end
  end

  def list_games
    if @games.empty?
      puts "\nNo games found. \n\n"
      return
    end

    puts "\nGames: \n\n"
    @games.each do |game|
      puts "Title: #{game['label']}, Author: #{game['author']}, Genre: #{game['genre']}, "
      print "Archived: #{game['archived']}"
      puts "\n"
    end
  end

  def list_genres
    if @genres.empty?
      puts "\nNo genres found. \n\n"
      return
    end

    puts "\nListing all Genres: \n\n"
    @genres.each do |genre|
      puts "ID: #{genre['id']}, Name: #{genre['name']}"
    end
  end

  def list_labels
    if @labels.empty?
      puts "\nNo labels found. \n\n"
      return
    end

    puts "\nListing all Labels: \n\n"
    @labels.each do |label|
      puts "ID: #{label['id']}, Name: #{label['name']}, Color: #{label['color']}"
    end
  end

  def list_authors
    if @authors.empty?
      puts "\nNo authors found. \n\n"
      return
    end

    puts "\nAuthors: \n\n"
    @authors.each do |author|
      puts "Name: #{author['first_name']} #{author['last_name']}, ID: #{author['id']}"
    end
  end
end
