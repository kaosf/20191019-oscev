class Public::ElectionsController < ApplicationController
  before_action :set_election, only: [:show]

  def index
    @elections = Election.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election
      @election = Election.find(params[:id])
    end
end
