def open_file(file_name, &block)
  File.open(file_name, "r") do |file|
    return file.read unless block

    file.each_line do |line|
      yield line
    end
  end
end

require "json"

def open_json_file(file_name)
  File.open(file_name, "r") do |file|
    return JSON.parse(file.read, symbolize_names: true)
  end
end
