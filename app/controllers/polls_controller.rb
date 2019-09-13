class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update]

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.joins(:poll_options).group('polls.id')
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    if @poll.poll_options.count < 2
      respond_to do |format|
        format.html { redirect_to polls_url }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    @option = @poll.poll_options.where(id: params[:votes]).take
    if @option.present? && (@option.poll_id.eql? params[:id].to_i)
      respond_to do |format|
        if @option.increment!(:votes)
          format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
          format.json { render :show, status: :ok, location: @poll }
        else
          format.html { render :edit }
          format.json { render json: @poll.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.includes(:poll_options).where(id: params[:id]).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(poll_options_attributes: [:id, :votes])
    end
end
