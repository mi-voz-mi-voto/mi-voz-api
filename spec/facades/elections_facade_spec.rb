require 'rails_helper'

RSpec.describe ElectionsFacade do
  it 'can create only election poros' do
    elections = ElectionsFacade.elections('Arkansas')

    expect(elections.first).to be_an(Election)
    expect(elections.first.type).to eq('General')
  end

  it 'can create only referendum poros' do
    referendums = ElectionsFacade.referendums('Arkansas')

    expect(referendums.last).to be_a(Referendum)
    expect(referendums.last.type).to eq('Referendum')
  end

  it 'creates a state poro' do
    state = ElectionsFacade.state_info('Arkansas')

    expect(state).to be_a(State)
  end
end
