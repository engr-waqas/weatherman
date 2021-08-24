class ReadingFiles

  def initialize
    @files_data = []
  end

  def reading_files_data(files_path, files_names)
    Dir.chdir(files_path) do
      Dir.glob(files_names).each do |file|
        File.readlines(file).each do |line|
          @files_data << line.split('\n')
        end
      end
    end
    @files_data

  rescue StandardError
    puts "Directory not found! "
  end

end
