require 'uri'
require 'open-uri'

module HomeHelper
  def self.open_graph_data(url)
    return { error: 'invalid url' } unless is_valid_url(url)
    file = open(url)
    contents = file.read
    # puts file.hash
    # puts file.methods
    puts ''
    puts ''
    # puts contents.class
    # puts contents.methods
    puts contents
    puts contents.class
    { error: 'suck sess' }
  end

  private

  def self.is_valid_url(url)
    URI.regexp.match(url).present?
  end
end
