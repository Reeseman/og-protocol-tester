require 'uri'
require 'open-uri'
require 'nokogiri'

module HomeHelper
  def self.open_graph_data(url)
    return { error: 'invalid url' } unless is_valid_url(url)
    data = {}
    page = Nokogiri::HTML(URI.open(url))
    page.css('meta').each do |tag|
      property = tag.attribute('property')
      if property.present? && property.value.include?('og:')
        data[property.value] = tag.attribute('content').value
      end
    end
    if data.empty?
      data[:error] = 'No opengraph data available for that URL. The site has either not set it up, or it blocks robots such as myself.'
    end
    data
  end

  private

  def self.is_valid_url(url)
    URI.regexp.match(url).present?
  end
end
