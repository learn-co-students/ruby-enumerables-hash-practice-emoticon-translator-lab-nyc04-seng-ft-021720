# require modules here
require 'yaml'


def load_library(path)
  emoticons = YAML.load_file(path)
  output = {get_meaning: {}, get_emoticon: {}}
  emoticons.each do |key, value|
    output[:get_meaning][value[1]] = key
    output[:get_emoticon][value[0]] = value[1]
  end
  output
end

def get_japanese_emoticon(yaml, english_emoticon)
  output = load_library(yaml)[:get_emoticon][english_emoticon]
  output_for_requests(output)
end

def get_english_meaning(yaml, japanese_emoticon)
  output = load_library(yaml)[:get_meaning][japanese_emoticon]
  output_for_requests(output)
end

def output_for_requests(input)
  if input
    return input
  else
    return "Sorry, that emoticon was not found"
  end  
end

# p load_library('lib/emoticons.yml')