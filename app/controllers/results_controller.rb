class ResultsController < ApplicationController
  before_action :set_election

  def index
  end

  private
    def set_election
      @election = Election.find(params[:election_id])
    end
end
