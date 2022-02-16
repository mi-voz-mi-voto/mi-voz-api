class ElectionService

  def self.get_elections(location)
    response = conn.get do |faraday|
      faraday.params['address'] = location
      faraday.params['electionId'] = 2000
    end
    JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

  def self.conn
    Faraday.new('https://www.googleapis.com/civicinfo/v2/voterinfo') do |faraday|
      faraday.params['key'] = ENV['google_key']
    end
  end
end
