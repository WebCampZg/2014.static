require 'json'
require 'babosa'
require "open-uri"


contents = JSON.parse(File.read('speakers.json'))

contents.each do |speaker|
  image =  speaker["speaker"]["name"].to_slug.normalize.to_s + '.jpg'
  path = File.expand_path(File.join('..', 'content', 'images', 'speakers', image))

  unless File.file? path

    puts "Downloading image for #{speaker["speaker"]["name"]}"

    File.open(path, 'wb') do |fo|
      fo.write open(speaker["speaker"]["image"]).read
    end

  end

end