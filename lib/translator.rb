require 'yaml'
require 'pp'

def load_library(path)
  file = YAML.load_file(path)
  result = {'get_meaning' => {}, 'get_emoticon' => {}}
  file.each{ |meaning, emoticon_arr|
    result['get_meaning'][emoticon_arr[1]] = meaning
    result['get_emoticon'][emoticon_arr[0]] = emoticon_arr[1]
  }
  result
end

def get_japanese_emoticon(path, emoticon)
  file = load_library(path)
  if !file['get_emoticon'][emoticon]
    p 'Sorry, that emoticon was not found'
  else
    return file['get_emoticon'][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  file = load_library(path)
  if !file['get_meaning'][emoticon]
    p 'Sorry, that emoticon was not found'
  else
    return file['get_meaning'][emoticon]
  end
end
