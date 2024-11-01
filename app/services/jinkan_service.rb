# Jinkan is a unofficial myanimelist API
 
class JinkanService 
  include HTTParty
  base_uri 'https://api.jikan.moe/v4' # Don't need final slash

  def self.anime_details(id)
    url = "/anime/#{id}/" # DON'T FORGET TO ADD A INITIAL SLASH
    response = get(url)
    if response.success?
      response.parsed_response['data']
    else
      Rails.logger.debug("Response failed with URL: #{url}")
      Rails.logger.debug("Response: #{response.inspect}")
    end
  end
end