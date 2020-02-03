require 'pry'
require 'yaml'


def load_library(file_path)
library = YAML.load_file(file_path)
result = {"get_meaning" => {}, "get_emoticon" => {}}
library.each do |meaning, emoticon|
  result["get_meaning"][emoticon[1]] = meaning
  result["get_emoticon"][emoticon[0]] = emoticon[1]
end
result
end


def get_japanese_emoticon(file_path, english_emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(english_emoticon)
    library["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(japanese_emoticon)
    library["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
