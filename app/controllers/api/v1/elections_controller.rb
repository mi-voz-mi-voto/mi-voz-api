class Api::V1::ElectionsController < ApplicationController

  def index
    elections = ElectionsFacade.elections(params[:location])
    referendums = ElectionsFacade.referendums(params[:location])
    state = ElectionsFacade.state_info(params[:location])

    render json: ElectionsSerializer.election_info(elections, referendums, state), status: 200
  end
end
