class ElectionsSerializer

  def self.election_info(elections, referendums, state)
    {
      data: {
        elections: elections.map do |election|
          {
            office: election.office,
            type: election.type,
            candidates: election.candidates.map do |candidate|
              {
                name: candidate[:name],
                party: candidate[:party],
              }
            end
          }
      end,

      referendums: referendums.map do |referendum|
        {
          type: referendum.type,
          title: referendum.title,
          url: referendum.url
        }
      end,

      election_info: state.election_info_url
    }
  }
  end
end
