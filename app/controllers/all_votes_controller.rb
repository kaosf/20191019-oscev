class AllVotesController < ApplicationController
  before_action :set_all_vote, only: [:show, :edit, :update, :destroy]

  # GET /all_votes
  # GET /all_votes.json
  def index
    @all_votes = AllVote.all
  end

  # GET /all_votes/1
  # GET /all_votes/1.json
  def show
  end

  # GET /all_votes/new
  def new
    @all_vote = AllVote.new
  end

  # GET /all_votes/1/edit
  def edit
  end

  # POST /all_votes
  # POST /all_votes.json
  def create
    @all_vote = AllVote.new(all_vote_params)

    respond_to do |format|
      if @all_vote.save
        format.html { redirect_to @all_vote, notice: 'All vote was successfully created.' }
        format.json { render :show, status: :created, location: @all_vote }
      else
        format.html { render :new }
        format.json { render json: @all_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_votes/1
  # PATCH/PUT /all_votes/1.json
  def update
    respond_to do |format|
      if @all_vote.update(all_vote_params)
        format.html { redirect_to @all_vote, notice: 'All vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @all_vote }
      else
        format.html { render :edit }
        format.json { render json: @all_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_votes/1
  # DELETE /all_votes/1.json
  def destroy
    @all_vote.destroy
    respond_to do |format|
      format.html { redirect_to all_votes_url, notice: 'All vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_vote
      @all_vote = AllVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def all_vote_params
      params.fetch(:all_vote, {})
    end
end
