class PollOptionsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_helper
  before_action :set_poll_option, only: [:destroy]

  # DELETE /poll_options/1
  # DELETE /poll_options/1.json
  def destroy
    @poll_option.destroy
    respond_to do |format|
      format.html { redirect_to admin_url(params[:poll_id]), notice: 'Poll option was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_option
      @poll_option = PollOption.find(params[:option_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_option_params
      params.require(:poll_option).permit(:poll_id, :option_id)
    end
end
