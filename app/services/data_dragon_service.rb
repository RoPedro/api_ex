# Data Dragon is a static json API for league of legends data

require 'httparty'

class DataDragonService
  include HTTParty
  base_uri 'https://ddragon.leagueoflegends.com'

  # Fetch the latest version of Data Dragon
  def self.latest_version
    response = get('/api/versions.json')
    response.parsed_response.first if response.success?
  end

  # Fetch champion list for the latest version
  def self.champions(version = latest_version, language = 'en_US')
    url = "/cdn/#{version}/data/#{language}/champion.json"
    response = get(url)
    response.parsed_response['data'] if response.success?
  end

  # Fetch details for a single champion
  def self.champion_details(champion_name, version = latest_version, language = 'en_US')
    url = "/cdn/#{version}/data/#{language}/champion/#{champion_name}.json"
    response = get(url)
  
    if response.success?
      champion_data = response.parsed_response['data']
      champion_name_lower = champion_name.downcase
  
      champion_data.each do |champion, details|
        if champion.downcase == champion_name_lower
          return details
        end
      end
    end
  
    return nil
  end
end