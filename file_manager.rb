module FileManager
  def create_data
    return if Dir.exist?('./data')

    Dir.mkdir('./data')
  end

  def load_json_file(file_path, default_value)
    unless File.exist?(file_path)
      puts "Error: File #{file_path} does not exist!"
      return default_value
    end

    file_data = File.read(file_path)
    file_data.empty? ? default_value : JSON.parse(file_data)
  end

  def create_file_if_not_exists(file_path)
    return if File.exist?(file_path)

    File.open(file_path, 'w')
  end
end
