require 'zip/zip'

class ClearJamendo
  def initialize(dir)
    begin
      @dir = Dir.new(dir)
    rescue # if user inputed wrong folder name
      puts "Directory \"#{dir}\" is not found"
    end
    @directory = dir
    @file_for_delete = 'License.txt'
  end

  def clear
    count = 0
    dir_list = @dir.entries

    # Delete "." and ".." files from list:
    dir_list.shift
    dir_list.shift

    dir_list.each do |dir_name|
      unless dir_name.include?('.zip')
        next
      end
      new_name = dir_name.partition('_-_').first
      begin
        Dir.mkdir(@directory + '\\' + new_name)
      rescue # if zip file is not from Jamendo go to next iteration
        next
      end
      unzip_file(@directory + '\\' + dir_name, @directory + '\\' + new_name)

      # Delete licence file:
      delete_file (@directory + '\\' + new_name + '\\' + @file_for_delete)

      # Delete source zip file:
      delete_file (@directory + '\\' + dir_name)

      count.next
    end
    puts "There is no Jamendo files to unpack" if count.zero?
  end
  
private
  def delete_file one
    if File.exists? one
      File.delete one 
    end
  end

  def unzip_file (file, destination)
    Zip::ZipFile.open(file) do |zip_file|
      zip_file.each do |f|
        f_path = File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      end
    end
  end
end 

jam = ClearJamendo.new(ARGV.shift)
jam.clear