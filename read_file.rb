class Read

  def initialize
    @data = []
  end

  def read_file(path, files)
    begin
      Dir.chdir(path) do
        Dir.glob(files).each do |file|
          File.readlines(file).each do |line|
            @data << line.split('\n')
          end
        end
      end
    rescue
      puts "Directory not found! "
    end
    @data
  end
end
