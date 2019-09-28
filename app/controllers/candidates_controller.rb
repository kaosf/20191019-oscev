class CandidatesController < ApplicationController
  before_action :set_election
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  # GET /elections/:election_id/candidates
  # GET /elections/:election_id/candidates.json
  def index
    @candidates = @election.candidates
  end

  # GET /elections/:election_id/candidates/1
  # GET /elections/:election_id/candidates/1.json
  def show
  end

  # GET /elections/:election_id/candidates/new
  def new
    @candidate = @election.candidates.build
  end

  # GET /elections/:election_id/candidates/1/edit
  def edit
  end

  # POST /elections/:election_id/candidates
  # POST /elections/:election_id/candidates.json
  def create
    @candidate = @election.candidates.build(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to election_candidate_url(@election, @candidate), notice: 'Candidate was successfully created.' }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elections/:election_id/candidates/1
  # PATCH/PUT /elections/:election_id/candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/:election_id/candidates/1
  # DELETE /elections/:election_id/candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to election_candidates_url(@election), notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_election
      @election = Election.find(params[:election_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = @election.candidates.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:election_id, :number, :name)
    end
end
