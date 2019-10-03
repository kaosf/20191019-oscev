class VotesController < ApplicationController
  before_action :set_election
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /elections/:election_id/votes
  # GET /elections/:election_id/votes.json
  def index
    @votes = @election.votes
  end

  # GET /elections/:election_id/votes/1
  # GET /elections/:election_id/votes/1.json
  def show
  end

  # GET /elections/:election_id/votes/new
  def new
    @vote = @election.votes.build
  end

  # GET /elections/:election_id/votes/1/edit
  def edit
  end

  # POST /elections/:election_id/votes
  # POST /elections/:election_id/votes.json
  def create
    @vote = @election.votes.build(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to election_vote_url(@election, @vote), notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elections/:election_id/votes/1
  # PATCH/PUT /elections/:election_id/votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to election_vote_url(@election, @vote), notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/:election_id/votes/1
  # DELETE /elections/:election_id/votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to election_votes_url(@election), notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_election
      @election = Election.find(params[:election_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = @election.votes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:election_id, :c)
    end
end
