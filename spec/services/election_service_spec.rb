require 'rails_helper'

RSpec.describe ElectionService do
  it 'establishes a connection' do
    elections = ElectionService.get_elections('Denver')

    expect(elections).to be_a(Hash)
    expect(elections[:election][:name]).to eq('VIP Test Election')
  end
end
