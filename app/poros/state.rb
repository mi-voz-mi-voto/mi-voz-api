class State
  attr_reader :election_info_url

  def initialize(data)
    @election_info_url = data[:electionInfoUrl]
  end
end
