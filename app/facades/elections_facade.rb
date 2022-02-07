#General elections and referendums are considered to be the same to civic service
#Created poros for each to make serializing easier 
class ElectionsFacade

  def self.elections(location)
    service = ElectionService.get_elections(location)[:contests]

    all_elections = service.map do |data|
        if data[:type] != 'Referendum'
            Election.new(data)
        end
    end
    elections = all_elections.reject {|elec| elec == nil}
    return elections
  end

  def self.referendums(location)
    service = ElectionService.get_elections(location)[:contests]

    all_referendums = service.map do |data|
        if data[:type] == 'Referendum'
          Referendum.new(data)
        end
    end
    referendums = all_referendums.reject {|ref| ref == nil}
  end

  def self.state_info(location)
    service = ElectionService.get_elections(location)[:state][0][:electionAdministrationBody]

    State.new(service)
  end
end
