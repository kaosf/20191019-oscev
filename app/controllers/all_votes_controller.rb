class AllVotesController < ApplicationController
  # DELETE /election/:election_id/all_votes
  # DELETE /election/:election_id/all_votes.json
  def destroy
    election = Election.find(params[:election_id])
    election.votes.destroy_all
    respond_to do |format|
      format.html { redirect_to public_election_url(election), notice: 'All vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
