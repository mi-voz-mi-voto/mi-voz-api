require 'rails_helper'

RSpec.describe 'Elections Api' do
  it 'returns election info for a given state' do
    location_params = {'location': 'Alaska'}

    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
    get '/api/v1/elections', headers: headers, params: location_params
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:elections)
    expect(json[:data]).to have_key(:referendums)
    expect(json[:data]).to have_key(:election_info)
  end
end
